-- SELECT * FROM airports

SELECT 
ps.PatientId
,ps.Hospital
,ps.Ward
--,'Reminderdate' as ReminderDate
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
AND ps.AdmittedDate between '2024-02-27' and '2024-03-01'



