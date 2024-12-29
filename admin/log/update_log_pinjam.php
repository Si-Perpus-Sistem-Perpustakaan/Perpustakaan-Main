<?php
// Memulai session hanya jika belum dimulai
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

// Pastikan session 'id_pengguna' ada
if (!isset($_SESSION['id_pengguna'])) {
    die("Petugas tidak ditemukan. Silakan login.");
}

// Mengambil ID petugas dari session
$id_petugas = $_SESSION['id_pengguna']; 


// Pastikan data POST ada sebelum diproses
if (isset($_POST['id_log'], $_POST['id_buku'], $_POST['id_anggota'], $_POST['tgl_pinjam'])) {
    // Ambil data yang ingin diupdate (misalnya ID log, ID buku, ID anggota)
    $id_log = $_POST['id_log']; // ID log yang ingin diupdate
    $id_buku = $_POST['id_buku']; // ID buku yang ingin diupdate
    $id_anggota = $_POST['id_anggota']; // ID anggota yang ingin diupdate
    $tgl_pinjam = $_POST['tgl_pinjam']; // Tanggal peminjaman yang ingin diupdate

    // Menyiapkan query UPDATE dengan prepared statements
    include "inc/koneksi.php";
    $sql = $koneksi->prepare("UPDATE log_pinjam 
        SET id_buku = ?, 
            id_anggota = ?, 
            tgl_pinjam = ?, 
            id_petugas = ? 
        WHERE id_log = ?");
    
    // Mengikat parameter untuk query prepared statement
    $sql->bind_param("ssssi", $id_buku, $id_anggota, $tgl_pinjam, $id_petugas, $id_log);

    // Eksekusi query
    if ($sql->execute()) {
        echo "Data berhasil diperbarui!";
    } else {
        echo "Error: " . $sql->error;
    }
} else {
    echo "Data yang dibutuhkan tidak lengkap!";
}
?>
