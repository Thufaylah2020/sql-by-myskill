select * from umkm.umkm_jabar;

-- 1. membuat store Procedures sederhana
DELIMITER $$
CREATE PROCEDURE getAllData ()
BEGIN
	SELECT * FROM umkm.umkm_jabar;
END $$
DELIMITER ;

-- 2. memanggil store procedure 
CALL getAllData ();

-- 3. Mengecek store procedure tersimpan
SHOW PROCEDURE STATUS;

-- 4. menghapus stored procedure
-- DROP PROCEDURE getAllData;
SHOW PROCEDURE STATUS;

-- 5. membuat store procedure dengan parameter
-- 5.1. Parameter IN
DELIMITER $$

CREATE PROCEDURE getDataUMKM(
    IN p_nama_kabupaten VARCHAR(100)
)
BEGIN
    SELECT *
    FROM umkm_jabar
    WHERE nama_kabupaten_kota = p_nama_kabupaten;
END $$

DELIMITER ;
CALL getDataUMKM('KABUPATEN GARUT');

-- 5.2. Parameter OUT
-- variable yang digunakan untuk menyimpan/menampung nilai yang dihasilkan oleh store procedure 
DELIMITER $$
CREATE PROCEDURE getTotalRow
(
	OUT jumlah_row INT 
)
BEGIN 
	SELECT  COUNT(*) INTO jumlah_row FROM umkm_jabar;
END $$
DELIMITER ;

CALL getTotalRow (@jumlah_row);
SELECT @jumlah_row; -- untuk menghitung jumlah row

-- 5.3. Parameter INOUT
SELECT * FROM umkm_jabar;
DELIMITER $$
CREATE PROCEDURE getTotalRow2
(
	INOUT kode_kab INT
)
BEGIN 
	SELECT COUNT(*) INTO kode_kab FROM umkm_jabar WHERE kode_kabupaten_kota = kode_kab;
END $$
DELIMITER ;

SET @kode_kab_kota = 3201;
CALL getTotalRow2(@kode_kab_kota);

SELECT @kode_kab_kota;
SELECT COUNT(*) FROM umkm_jabar WHERE kode_kabupaten_kota = 3201;

-- 7. Loop
DROP PROCEDURE IF EXISTS buatIDMahasiswa;

CREATE TABLE id_mahasiswa (id INT);
SELECT * FROM id_mahasiswa;
INSERT INTO id_mahasiswa VALUES (0);

DELIMITER $$
CREATE PROCEDURE buatIDMahasiswa()
BEGIN
	DECLARE COUNTER INT;
	SET COUNTER = 1;
    WHILE COUNTER <= 10 DO
    INSERT INTO id_mahasiswa VALUES (COUNTER);
    SET COUNTER = COUNTER + 1;
    END WHILE;
END $$
DELIMITER ;

CALL buatIDMahasiswa();
SELECT * FROM id_mahasiswa;

-- 7. Conditional (IF THEN)
DROP test
DELIMITER $$
CREATE PROCEDURE test
(
	IN bilangan INT,
    OUT hasil VARCHAR(100)
)
BEGIN
	IF bilangan > 50 THEN SET hasil = "Lebih dari 50";
    ELSE SET hasil = "kurang dari sama dengan 50";
    END IF;
END $$
DELIMITER ;

CALL test (100, @hasil_test);

SELECT @hasil_test
