CREATE DATABASE student;
SELECT * FROM StudentsPerformance;

--  Bagaimana query untuk mendapatkan seluruh data dari tabel?
select * from StudentsPerformance;

--  Ada grup race/ethnicity apa saja pada dataset tersebut?
select distinct race_or_ethnicity from StudentsPerformance;
select * from StudentsPerformance;
-- Orang dengan grup apa yang memiliki nilai math sama dengan 0?
select * from StudentsPerformance where math_score = 0;

-- Berapa nilai writing terkecil orang yang memiliki orangtua dengan tingkat pendidikan associate's degree?
select * from StudentsPerformance where parental_level_of_education = "associate's degree" order by writing_score ASC;

-- 5. Jika nilai writing terendah orang di grup A dijumlahkan dengan nilai writing 
-- terendah orang di grup B, maka hasilnya adalah…
select * from StudentsPerformance where race_or_ethnicity in ("group A", "group B") order by writing_score ASC;

-- 6. Berapa orang yang memiliki nilai math kurang dari 65 namun memiliki nilai 
-- writing lebih besar dari 80?
select * from StudentsPerformance where math_score <65 and writing_score >80;

-- 7. Jika data di-filter dengan nilai reading lebih dari 10 namun kurang dari 25, 
-- tingkat pendidikan orangtua apa saja yang termasuk ke dalam data tersebut?
select * from StudentsPerformance where reading_score >10 and reading_score <25;

-- jawaban 8 apa perbedaan kedua query ini.
-- Query A
SELECT * FROM StudentsPerformance
WHERE parental_level_of_education LIKE '%high%' AND race_or_ethnicity NOT IN ('group A', 'group B') AND reading_score < 35;

-- Query B
SELECT * FROM StudentsPerformance
WHERE parental_level_of_education LIKE 'high%' AND race_or_ethnicity NOT IN ('group A', 'group B') AND reading_score < 35;

