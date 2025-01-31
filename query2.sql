--- top revenue generated hospitals 

SELECT Hospital,
      CEIL((Sum(`Billing Amount`))) AS revenue 
FROM `medicaldataset.patient_healtcare_records`
GROUP BY Hospital
ORDER BY revenue DESC
limit 10; --- can limit upto 10  