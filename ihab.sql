-- 1. Membuat & Menggunakan Database Baru (Gunakan NIS Kamu)
CREATE DATABASE IF NOT EXISTS db_tokoritel_xi;
USE db_tokoritel_xi;-- 2. Membuat Tabel Kategori Barang
CREATE TABLE barang_kategori (
    id_kategori INT AUTO_INCREMENT PRIMARY KEY,
    nama_kategori VARCHAR(50) NOT NULL
);-- 3. Membuat Tabel Barang (Terikat ke Kategori)
CREATE TABLE barang (
    kode_barang VARCHAR(10) PRIMARY KEY,
    nama_barang VARCHAR(100) NOT NULL,
    harga_jual DECIMAL(10,2) NOT NULL,
    stok INT DEFAULT 0,
    id_kategori INT,
    FOREIGN KEY (id_kategori) REFERENCES barang_kategori(id_kategori) 
    ON DELETE CASCADE ON UPDATE CASCADE
);-- 4. [LENGKAPI MANDIRI] Buat Tabel Pelanggan
CREATE TABLE pelanggan (
    id_pelanggan VARCHAR(10) PRIMARY KEY,
    nama_pelanggan VARCHAR(100) NOT NULL,
    no_hp VARCHAR(15),
    alamat TEXT
);-- 5. [LENGKAPI MANDIRI] Buat Tabel Petugas Kasir
CREATE TABLE petugas (
    id_petugas INT AUTO_INCREMENT PRIMARY KEY,
    nama_petugas VARCHAR(100) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL
);-- 6. [LENGKAPI MANDIRI] Buat Tabel Penjualan Utama (Header Transaction)
CREATE TABLE penjualan (
    no_faktur VARCHAR(20) PRIMARY KEY,
    tgl_transaksi DATETIME DEFAULT CURRENT_TIMESTAMP,
    id_pelanggan VARCHAR(10),
    id_petugas INT,
    total_bayar DECIMAL(12,2) DEFAULT 0,
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
    FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);-- 7. [LENGKAPI MANDIRI] Buat Tabel Detail Penjualan (Jembatan Relasi N:M)
CREATE TABLE penjualan_detail (
    id_detail INT AUTO_INCREMENT PRIMARY KEY,
    no_faktur VARCHAR(20),
    kode_barang VARCHAR(10),
    jumlah INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (no_faktur) REFERENCES penjualan(no_faktur),
    FOREIGN KEY (kode_barang) REFERENCES barang(kode_barang)
);