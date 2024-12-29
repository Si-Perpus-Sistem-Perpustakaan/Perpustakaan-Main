<?php
include "inc/koneksi.php";
?>

<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="assets_style/assets/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets_style/assets/bower_components/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets_style/assets/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
    <title>Laporan Perpustakaan - Laporan Sirkulasi</title>
</head>

<body onload="window.print()" style="font-family: Quicksand, sans-serif;">
    <h3 class='text-center' style='font-family: Quicksand, sans-serif; margin-top: 30px;'>
        .:: Laporan Perpustakaan ::.
    </h3>
    <h4 class='text-center'>Laporan Sirkulasi</h4>

    <?php
    // Query untuk mengambil data sirkulasi termasuk petugas
    $sql = mysqli_query($koneksi, "
        SELECT tb_sirkulasi.id_buku, 
               tb_buku.judul_buku, 
               tb_anggota.id_anggota,
               tb_anggota.nama,
               tb_sirkulasi.id_sk,
               tb_sirkulasi.tgl_pinjam,
               tb_sirkulasi.tgl_kembali,
               tb_sirkulasi.tgl_dikembalikan,
               IF(DATEDIFF(NOW(), tb_sirkulasi.tgl_kembali) <= 0, 0, DATEDIFF(NOW(), tb_sirkulasi.tgl_kembali)) AS telat_pengembalian,
               tb_petugas_sirkulasi.nama_petugas
        FROM tb_sirkulasi
        JOIN tb_anggota ON tb_anggota.id_anggota = tb_sirkulasi.id_anggota
        JOIN tb_buku ON tb_buku.id_buku = tb_sirkulasi.id_buku
        LEFT JOIN tb_petugas_sirkulasi ON tb_petugas_sirkulasi.id_petugas_sirkulasi = tb_sirkulasi.id_petugas_sirkulasi
        WHERE tb_sirkulasi.status = 'KEM'
        ORDER BY tb_sirkulasi.id_anggota
    ");
    
    $no = null;
    $total_denda = null;
    $tarif_denda = 1000;
    ?>

    <table class="table table-striped table-bordered">
        <thead>
            <tr>
                <th style="text-align: center;">No</th>
                <th style="text-align: center;">ID SKL</th>
                <th style="text-align: center;">Buku</th>
                <th style="text-align: center;">Peminjam</th>
                <th style="text-align: center;">Tgl Pinjam</th>
                <th style="text-align: center;">Jatuh Tempo</th>
                <th style="text-align: center;">Tgl Dikembalikan</th>
                <th style="text-align: center;">Denda</th>
                <th style="text-align: center;">Petugas</th> <!-- Kolom Petugas -->
            </tr>
        </thead>
        <tbody>
            <?php
            $row = mysqli_num_rows($sql);

            if ($row > 0) {
                while ($data = mysqli_fetch_array($sql, MYSQLI_ASSOC)) {
                    $no++;
                    $total_denda = $total_denda + ($data['telat_pengembalian'] * $tarif_denda);
                    echo '<tr>
                            <td>' . $no . '</td>
                            <td>' . $data['id_sk'] . '</td>
                            <td>' . $data['judul_buku'] . '</td>
                            <td>' . $data['nama'] . '</td>
                            <td>' . date_format(new DateTime($data['tgl_pinjam']), 'd/M/Y') . '</td>
                            <td>' . date_format(new DateTime($data['tgl_kembali']), 'd/M/Y') . '</td>
                            <td>' . date_format(new DateTime($data['tgl_dikembalikan']), 'd/M/Y') . '</td>
                            <td>Rp. ' . number_format($data['telat_pengembalian'] * $tarif_denda, 0, ',', '.') . '</td>
                            <td>' . ($data['nama_petugas'] ?? '<i>Data tidak tersedia</i>') . '</td>
                          </tr>';
                }
            } else {
                echo "<tr><td colspan='9'>Data tidak ada</td></tr>";
            }
            ?>
            <tr>
                <th colspan="8" style="text-align:right; padding-right:1.5cm;">
                    Total Denda Rp. <?php echo number_format($total_denda, 0, ',', '.'); ?>
                </th>
            </tr>
        </tbody>
    </table>
</body>

</html>
