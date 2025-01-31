--- patient admission in each season
WITH format_table AS(
SELECT 
     Hospital,
    `Date of Admission`,
    `Medical Condition`,
    CASE 
        WHEN EXTRACT(MONTH FROM `Date of Admission`) IN (12, 1, 2) THEN 'Winter'
        WHEN EXTRACT(MONTH FROM `Date of Admission`) IN (3, 4, 5) THEN 'Spring'
        WHEN EXTRACT(MONTH FROM `Date of Admission`) IN (6, 7, 8) THEN 'Summer'
        WHEN EXTRACT(MONTH FROM `Date of Admission`) IN (9, 10, 11) THEN 'Fall'
    END AS Season
FROM `medicaldataset.patient_healtcare_records`)

Select Season,
	COUNT(*) AS `Admit Count`,
FROM  format_table
GROUP BY Season
ORDER BY `Admit Count` DESC;