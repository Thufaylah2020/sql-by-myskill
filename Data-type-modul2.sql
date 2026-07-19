create database bimbel;
create table siswa (
	id_siswa varchar(255) not null,
    nama_siswa varchar (255) not null,
    alamat_siswa varchar (255) null,
    tanggal_lahir_siswa date null,
    kelas_siswa varchar (255) not null, 
    sekolah_siswa varchar (255) null
    );
    
    select * from siswa;
    
insert into siswa (
		id_siswa,
		nama_siswa,
		alamat_siswa,
		tanggal_lahir_siswa,
		kelas_siswa,
		sekolah_siswa
   )
   
values (
		'001', 
        "Rizka",
        "Jakarta Barat",
        "2007-03-20",
        "12 IPA A",
        null
	),
    (
		"002",
        "Madani",
        "Jakarta Pusat",
        "2008-01-08",
        "12 IPS A",
        null
	);
        
select * from siswa;

        
    
    
   
    