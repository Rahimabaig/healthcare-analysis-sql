-- average day spend by patient across each medical condition

SELECT `Medical Condition`,
	AVG(DATE_DIFF(`Discharge Date`,`Date of Admission`,DAY)) AS `Days Spend`
FROM `medicaldataset.patient_healtcare_records`
GROUP BY `Medical Condition`;
