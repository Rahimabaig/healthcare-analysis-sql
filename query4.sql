-- most preffered insurance provider

SELECT `Insurance Provider`,
        COUNT(*) AS `Total Admission`,
        ABS(ROUND(MIN(`Billing Amount`),2)) AS min_billing_amount,
        ROUND(Max(`Billing Amount`),2) AS max_billing_amount,
FROM `medicaldataset.patient_healtcare_records`
GROUP BY `Insurance Provider`
ORDER BY  max_billing_amount;