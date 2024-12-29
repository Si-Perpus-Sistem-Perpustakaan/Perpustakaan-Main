<section class="content-header">
    <h1 style="text-align:center;">
        Laporan Sirkulasi
    </h1>
</section>

<!-- Main content -->
<section class="content">
    <div class="box box-primary">
        <div class="box-header with-border d-flex justify-content-between align-items-center" style="display: flex; justify-content: space-between; align-items: center;">
            <!-- Form Filter Bulan di sebelah kiri -->
            <form method="POST" action="" id="filterForm" style="display: inline-flex; align-items: center;">
                <label for="bulan" class="col-form-label" style="font-weight: normal; margin-right: 10px;">Pilih:</label>
                <select id="bulan" name="bulan" class="form-control" style="max-width: 180px; margin-right: 10px;" onchange="this.form.submit()">
                    <option value="">- Semua Bulan -</option>
                    <?php
                    for ($i = 1; $i <= 12; $i++) {
                        $selected = ($i == $bulanDipilih) ? 'selected' : '';
                        echo "<option value='$i' $selected>" . date('F', mktime(0, 0, 0, $i, 10)) . "</option>";
                    }
                    ?>
                </select>
            </form>

            <!-- Button Print di sebelah kanan -->
            <a href="?page=MyApp/print_laporan" title="Print" class="btn btn-success" style="margin-left: auto;">
                <i class="glyphicon glyphicon-print"></i> Print
            </a>
        </div>

        <div class="box-body">
            <div class="table-responsive">
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>ID SKL</th>
                            <th>Buku</th>
                            <th>Peminjam</th>
                            <th>Tgl Pinjam</th>
                            <th>Jatuh Tempo</th>
                            <th>Tgl Dikembalikan</th>
                            <th>Denda</th>
                            <th>Petugas</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        // Query untuk mengambil data sirkulasi berdasarkan filter bulan
                        $bulanFilter = isset($_POST['bulan']) ? $_POST['bulan'] : '';

                        $whereClause = "WHERE tb_sirkulasi.status = 'KEM' ";

                        if ($bulanFilter) {
                            $whereClause .= "AND MONTH(tb_sirkulasi.tgl_pinjam) = '$bulanFilter' ";
                        }

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
                            $whereClause
                            ORDER BY tb_sirkulasi.id_anggota
                        ");

                        // Variabel untuk nomor dan total denda
                        $no = null;
                        $total_denda = 0;
                        $tarif_denda = 1000;

                        // Loop untuk menampilkan data
                        while ($data = mysqli_fetch_array($sql, MYSQLI_ASSOC)) {
                            $no++;
                            $denda = $data['telat_pengembalian'] * $tarif_denda;
                            $total_denda += $denda;
                            echo '<tr>
                                <td>' . $no . '</td>
                                <td>' . $data['id_sk'] . '</td>
                                <td>' . $data['judul_buku'] . '</td>
                                <td>' . $data['nama'] . '</td>
                                <td>' . date_format(new DateTime($data['tgl_pinjam']), 'd/M/Y') . '</td>
                                <td>' . date_format(new DateTime($data['tgl_kembali']), 'd/M/Y') . '</td>
                                <td>' . date_format(new DateTime($data['tgl_dikembalikan']), 'd/M/Y') . '</td>
                                <td>Rp. ' . number_format($denda, 0, ',', '.') . '</td>
                                <td>' . ($data['nama_petugas'] ?? '<i>Data tidak tersedia</i>') . '</td>
                            </tr>';
                        }
                        ?>
                        <tr>
                            <th colspan="8" style="text-align:right; padding-right:0.90cm;">Total Denda</th>
                            <th style="text-align:right; padding-right:0.90cm;">
                                Rp. <?php echo number_format($total_denda, 0, ',', '.'); ?>
                            </th>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
