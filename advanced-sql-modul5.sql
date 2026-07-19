select * from studentsperformance;
-- 1. Berapa jumlah record pada dataset tersebut?
select count(*) AS jumlah_record FROM studentsperformance;

-- 2. Buatlah query untuk menunjukkan:
-- a. perbandingan rata-rata nilai reading laki-laki dan perempuan!
-- b. nilai math tertinggi dan terendah dari masing-masing tingkatan 
-- pendidikan orangtua (parental level of education
SELECT gender, AVG(reading_score) AS rerata_reading_score FROM studentsperformance GROUP BY gender;
SELECT parental_level_of_education, MIN(math_score) AS min_math_score, MAX(math_score) AS max_math_score FROM studentsperformance GROUP BY parental_level_of_education;

-- 3. Berapa nilai rata-rata dari math, reading dan writing orang 
-- bergender perempuan yang pernah / sudah menyelesaikan 
-- kursus persiapan ujian (test_preparation_course)?
SELECT test_preparation_course, AVG (math_score) as rerata_math FROM studentsperformance WHERE gender = 'female' 
GROUP BY test_preparation_course;
-- AVG (writing_score) as rerata_writing  AVG (reading_score) as rerata_reading
SELECT test_preparation_course, AVG (writing_score) as rerata_writing FROM studentsperformance WHERE gender = 'female' 
GROUP BY test_preparation_course;
SELECT test_preparation_course, AVG (reading_score) as rerata_reading FROM studentsperformance WHERE gender = 'female' 
GROUP BY test_preparation_course;

SELECT 
	gender, 
    test_preparation_course, 
    AVG (math_score),
    AVG (writing_score),
    AVG (reading_score)
FROM 
	studentsperformance 
WHERE 
	gender = 'female'
    AND test_preparation_course = 'completed';

-- 4. Berapa nilai rata-rata writing orang yang memiliki 
-- orangtua yang tingkat pendidikannya adalah high school / 
-- some high school? (digabung, tidak terpisah
SELECT AVG (writing_score) as rerata_writing FROM studentsperformance 
WHERE parental_level_of_education LIKE "%high%";

-- 5. lengkapi
SELECT 
	gender,
    race_or_ethnicity,
    test_preparation_course,
	AVG (math_score) AS avg_math_score,
	AVG (reading_score) AS avg_reading_score, 
	AVG (writing_score) AS avg_writing_score
FROM studentsperformance
GROUP BY gender,
    race_or_ethnicity,
    test_preparation_course
ORDER BY gender,
	race_or_ethnicity,
    test_preparation_course;
    
-- 6. Berdasarkan hasil output pada pertanyaan nomor 5, 
-- modifikasilah query tersebut untuk menunjukkan data yang 
-- memiliki nilai rata-rata matematika lebih besar dari 70!
-- (gambar di bawah adalah output yang diharapkan
SELECT 
	gender,
    race_or_ethnicity,
    test_preparation_course,
	AVG (math_score) AS avg_math_score,
	AVG (reading_score) AS avg_reading_score, 
	AVG (writing_score) AS avg_writing_score
FROM studentsperformance
GROUP BY gender,
    race_or_ethnicity,
    test_preparation_course
HAVING avg_math_score > 70
ORDER BY gender,
	race_or_ethnicity,
    test_preparation_course; 



