create database umkm;

-- 1. Mendapatkan Data (SELECT FROM)
select * from umkm_jabar;

-- 2. WHERE u/memfilter berdasarkan kondisi 
select * from umkm_jabar WHERE kategori_usaha = "BATIK";
select * from umkm_jabar WHERE proyeksi_jumlah_umkm >=200000;

-- 3. ORDER u/memfilter data bedasarkan kondisi descending/asdescending 
select proyeksi_jumlah_umkm from umkm_jabar 
WHERE proyeksi_jumlah_umkm >170000 order by proyeksi_jumlah_umkm DESC;

-- 4. LIMIT u/ membatasi jumlah row yang diberikan 
select proyeksi_jumlah_umkm from umkm_jabar where proyeksi_jumlah_umkm >100000 order by proyeksi_jumlah_umkm asc limit 5;
select * from umkm_jabar where proyeksi_jumlah_umkm <180000 limit 2;

-- 5. DISTINCT u/ memberikan baris yang berbeda jika terdapat data yang sama
select distinct kategori_usaha from umkm_jabar;

-- LOGICAL SQL (selalu pakai where)

-- 1. IN operator u/ mengecek nilai
select * from umkm_jabar where kategori_usaha in ("KONVEKSI", "MINUMAN");

-- 2. AND operator (true jikan dua ekspresi yang dibandingkan bernilai true)
select * from umkm_jabar where proyeksi_jumlah_umkm <150000 and proyeksi_jumlah_umkm >100000 limit 10;
select * from umkm_jabar where proyeksi_jumlah_umkm <150000 and proyeksi_jumlah_umkm >100000;

-- 3. OR Operator (true jika minimal satu dari dua ekspresi yang dibandingkan bernilai true)
select * from umkm_jabar where proyeksi_jumlah_umkm >200000 
or nama_kabupaten_kota = "KABUPATEN BANDUNG";

-- 4. NOT operator ( false -> true, true -> false)
select * from umkm_jabar where nama_kabupaten_kota NOT IN ("KABUPATEN BANDUNG", "KABUPATEN MAJALENGKA", "KABUPATEN SUKABUMI");

-- 5. BETWEEN command u/memeriksa nilai yang diberikan apakah berada di rentang nilai yang diberikan (batas termasuk/inklusif)
select * from umkm_jabar where proyeksi_jumlah_umkm between 150000 AND 200000;

-- 6. LIKE command u/ memeriksa nilai yang diberikan apakah sesuai dengan suatu pola tertentu
select * from umkm_jabar where nama_kabupaten_kota LIKE "KABUPATEN BOGOR%";

-- TUGAS - TUGAS 
-- 5. kategori_usaha apa saja yang tersedia di dlam data set
select distinct kategori_usaha from umkm_jabar;

-- 6. tunjukan seluruh data hanya kategori usaha FASHION dan MAKANAN
select * from umkm_jabar where kategori_usaha in ("FASHION", "MAKANAN");

-- 7. tunjukan seluruh data dengan kategori usaha fashion di kabupaten karawang
select * from umkm_jabar where kategori_usaha = "FASHION" and nama_kabupaten_kota = "KABUPATEN KARAWANG";

-- 8. tunjukan seluruh data selain kategori usaha kuliner, makanan, dan minuman
select * from umkm_jabar where kategori_usaha not in ("KULINER", "MAKANAN", "MINUMAN");

-- 9. dari tahun 2018 sd 2020 bagaimana tren jumlah umkm di kabupaten tasikmalaya untuk kategori usaha batik?
select nama_kabupaten_kota, kategori_usaha, proyeksi_jumlah_umkm, tahun from umkm_jabar 
where tahun <=2020 and tahun >=2018 and nama_kabupaten_kota = "KABUPATEN TASIKMALAYA" and kategori_usaha = "BATIK";

-- 10. diantara kota bandung, kabupaten bandung, dan kabupaten bandung barat, dimanakah umkm kuliner terpusat pada tahun 2021
select * from umkm_jabar 
where nama_kabupaten_kota like "%BANDUNG%" and tahun = "2021" and kategori_usaha = "KULINER" order by proyeksi_jumlah_umkm Desc; 

-- 11. kabupaten/kota mana saja yang memenuhi angka 7 pada dihir ke 3 kode tersebut?
select distinct kode_kabupaten_kota, nama_kabupaten_kota from umkm_jabar where kode_kabupaten_kota like "__7%";