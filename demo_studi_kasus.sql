-- membuat database data scientis job 
create database ds;
-- mengecek tabel yang di input
select * from ds_salaries;

-- 1. apakah data ada yang NULL 
SELECT * FROM ds_salaries 
WHERE work_year IS NULL
OR experience_level IS NULL
OR employment_type IS NULL
OR job_title IS NULL
OR salary IS NULL
OR salary_currency IS NULL
OR salary_in_usd IS NULL
OR employee_residence IS NULL
OR remote_ratio IS NULL
OR company_location IS NULL
OR company_size IS NULL;

-- 2. list job title yang ada
SELECT DISTINCT job_title
FROM ds_salaries
ORDER BY job_title;

-- 3. job title apa saja yang berkaitan dengan data analis
SELECT DISTINCT job_title
FROM ds_salaries
WHERE job_title LIKE '%Data Analyst%'
ORDER BY job_title;

-- 4. rata - rata gaji data analyst 
SELECT (AVG(salary_in_usd) * 18000 / 12) AS avg_salary_rp_monthly
FROM ds_salaries;

-- 4.1 berapa rata rata gaji analis berdasarkan experience
SELECT experience_level, 
	(AVG(salary_in_usd) * 18000) /12 AS avg_salary_rp_monthly
FROM ds_salaries 
GROUP BY experience_level;

-- 4.2 berapa rata rata gaji analis berdasarkan experience berdasarkan tipe pegawai
SELECT experience_level, 
	employment_type,
	(AVG(salary_in_usd) * 18000) /12 AS avg_salary_rp_monthly
FROM ds_salaries 
GROUP BY experience_level, employment_type
ORDER BY experience_level, employment_type;

-- 5. Negara dengan gaji menarik untuk posisi data analyst, full time
SELECT company_location,
	AVG(salary_in_usd) AS avg_sal_in_usd
FROM ds_salaries
WHERE job_title LIKE '%data analyst%'
	AND employment_type = 'FT'
	AND experience_level IN ('MI', 'EN')
GROUP BY company_location
HAVING avg_sal_in_usd >= 20000;
-- ORDER BY company_location;
			
-- 6. di tahun berapa kenaikan gaji dari mid ke senior itu memiliki kenaikan gaji tertinggi
-- (untuk pekerjaan yang berkaitan dengan data analyst penuh waktu)

WITH ds_1 AS (
	SELECT work_year,
		AVG(salary_in_usd) AS avg_sal_ex_usd
	FROM ds_salaries
    WHERE 
		employment_type = 'FT'
		AND experience_level = 'EX'
        AND job_title LIKE '%data analyst%'
	GROUP BY work_year
), ds_2 AS (
	SELECT work_year,
		AVG(salary_in_usd) AS avg_sal_mi_usd
	FROM ds_salaries
    WHERE 
		employment_type = 'FT'
		AND experience_level = 'MI'
        AND job_title LIKE '%data analyst%'
	GROUP BY work_year
), t_year AS (
	SELECT DISTINCT work_year
    FROM ds_salaries
) SELECT t_year.work_year,
	ds_1.avg_sal_ex_usd,
    ds_2.avg_sal_mi_usd,
    ds_1.avg_sal_ex_usd - ds_2.avg_sal_mi_usd differences 
FROM t_year
LEFT JOIN ds_1 ON ds_1.work_year = t_year.work_year
LEFT JOIN ds_2 ON ds_2.work_year = t_year.work_year;
    
