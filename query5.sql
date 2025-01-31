--- disease outbreak in 2024 with male and female percentage ratio

WITH disease_count_24 AS(
SELECT 
    `Medical Condition`, 
        COUNT(`Medical Condition`) AS `Medical Count 24`,
        COUNT(CASE
		WHEN `Gender` = 'Male' THEN 1 ELSE NULL END) AS `Male Count`,
	COUNT(CASE
		WHEN `Gender` = 'Female' THEN 1 ELSE NULL END) AS `Female Count`			

FROM `medicaldataset.patient_healtcare_records`
WHERE Extract(Year FROM `Date of Admission`) = 2024
GROUP BY `Medical Condition`),

rank_disease AS(
	SELECT `Medical Condition`, `Medical Count 24`,
	rank() OVER (ORDER BY `Medical Count 24` DESC) AS `RANK`,
	ROUND(`Male Count`* 100.0 / `Medical Count 24`, 2) AS `Male`,
	ROUND(`Female Count` * 100.0 / `Medical Count 24`, 2) AS `Female`
FROM disease_count_24
)

SELECT `Medical Condition`, `Male`, `Female`
FROM rank_disease
WHERE RANK = 1;