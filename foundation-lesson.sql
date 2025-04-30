-- SELECT * FROM airports

SELECT 
ps.PatientId
,ps.Hospital
,ps.Ward
,DATEADD(WEEK, -12, ps.AdmittedDate) as Reminderdate
,ps.AdmittedDate 
,ps.DischargeDate
, DATEDIFF(DAY, ps.AdmittedDate, ps.DischargeDate) AS LengthOfStay
,ps.Tariff 
,ps.Ethnicity
FROM PatientStay ps
WHERE ps.Hospital  in ('PRUH', 'Oxleas')
and ps.Ward LIKE '%Surgery'
--AND ps.AdmittedDate >= '2024-02-27'
--AND ps.AdmittedDate <= '2024-03-01'
--AND ps.AdmittedDate between '2024-02-27' and '2024-03-01'
ORDER BY ps.AdmittedDate DESC, ps.PatientId DESC

---AGG Function 
SELECT 
ps.Hospital
,ps.Ward
,count(*) as  NumberOfPatient
,sum(ps.Tariff) as Tariff
,avg(ps.Tariff ) as Avg
,max(ps.Tariff) as MaxTariff
,Min(ps.Tariff) as MinTariff
FROM PatientStay ps
GROUP BY  ps.Hospital
,ps.Ward
ORDER BY NumberOfPatient DESC

-- Joins Table

SELECT
    ps.PatientId
    ,ps.AdmittedDate
    ,ps.Hospital
    ,dh.HospitalSize
    ,dh.HospitalType
FROM
    PatientStay ps INNER JOIN DimHospital dh ON ps.hospital = dh.Hospital
    WHERE dh.HospitalType IS NULL
   

SELECT * FROM DimHospitalBad
    


