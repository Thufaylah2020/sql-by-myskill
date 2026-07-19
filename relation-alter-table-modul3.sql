create database perpustakaan;
use perpustakaan;
CREATE TABLE buku (
	id_buku VARCHAR (255) NOT NULL PRIMARY KEY,
	judul_buku VARCHAR (255) NOT NULL,
	nama_penulis VARCHAR (255) NULL,
	jumlah INTEGER NULL
);
-- Mengecek apakah tabel sudah terbentuk
select * from buku;

-- Instruksi 2
ALTER TABLE buku
ADD lokasi VARCHAR (255);

-- Instruksi 3 buat table peminjaman
CREATE TABLE peminjaman (
	no_peminjaman varchar (255) not null primary key, 
    nama_peminjam varchar (255)  not null,
    id_buku varchar (255)  not null,
    jumlah_buku integer not null,
    tgl_peminjaman date not null,
    tgl_ekspektasi_kembali date null,
    tgl_aktual_kembali date null,
    foreign key (id_buku) 
    references buku (id_buku)
);

select * from peminjaman;

explain peminjaman;

select * from buku;

INSERT INTO
    buku (
        id_buku,
        lokasi,
        judul_buku,
        nama_penulis,
        jumlah
    )
VALUES
    (
        '1234133',
        '2U91',
        'Membuat Strategi Bisnis',
        'Dewey Deckers',
        2
    ),
    (
        '1390022',
        '1A12',
        'Anatomi Tubuh for Kids',
        'Syafina',
        3
    ),
    (
        '1773364',
        '1A29',
        'Sentiment Analysis for Dummies 2nd Edition',
        'Regina Alwi, Humaira',
        2
    );
    
    select * from buku;
    
    INSERT INTO
    peminjaman (
        no_peminjaman,
        nama_peminjam,
        id_buku,
        jumlah_buku,
        tgl_pinjam,
        tgl_ekspektasi_kembali,
        tgl_aktual_kembali
    )
VALUES
    (
        'A0000000001',
        'Adi',
        '1234133',
        1,
        '2022-10-10',
        '2022-10-17',
        NULL
    ),
    (
        'A0000000002',
        'Firman',
        '1234133',
        1,
        '2022-10-12',
        '2022-10-19',
        NULL
    ),
    (
        'A0000000003',
        'Tina',
        '1773364',
        1,
        '2022-10-09',
        '2022-10-16',
        '2022-10-12'
    );
    
select * from peminjaman;
select * from buku;