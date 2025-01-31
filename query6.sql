-- recovery rate on basis of age-group and gender

SELECT 
Case
	WHEN Age between 1 and 12 Then 'Child'
	WHEN Age between 13 and 19 Then 'Teenage'
	WHEN Age between 20 and 35 Then 'Young Adults'
	WHEN Age between 36 and 60 Then 'Middle Aged'
	ELSE 'SENIOR' 
  END AS AGE_DISTRIBUTION,Gender,
	ROUND(AVG(DATE_DIFF(`Discharge Date`,`Date of Admission`,DAY)),2) as recovery_rate
FROM `medicaldataset.patient_healtcare_records`
group by 1,2;