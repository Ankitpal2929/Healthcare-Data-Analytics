--CATEGORY 1:DEMOGRAPHIC (Age, Gender)--
--1.Gender wise patient count--
Select Gender,count(*) As total_patient
from cleanedhealthcare_dataset
Group by Gender;

--2.Age group wise patients
Select 
case
When age < 18 Then 'Child'
When age Between 18 And 60 Then 'Adult'
Else 'Senior'
End AS Age_Group,
Count(*) As Total_Patients
From cleanedhealthcare_dataset
GROUP BY
CASE
  WHEN Age < 18 THEN 'Child'
  WHEN Age BETWEEN 18 AND 60 THEN 'Adult'
  ELSE 'Senior'
END;

--CATEGORY 2:MEDICAL CATEGORY
--1 Medical Condition Analysis
Select `Medical Condition`, COUNT(*) AS patient_count
From cleanedhealthcare_dataset
GROUP BY `Medical Condition`;

--2.Medical Condition Bill wise 
Select `Medical Condition`, Sum(`Billing Amount`) As Total_Billing
From cleanedhealthcare_dataset
Group by `Medical Condition`;

--CATEGORY 3: Hospital & Doctor Performance
--1.Hospital-wise patient load
Select Hospital,Count(*) As Total_Patient
From cleanedhealthcare_dataset
Group by Hospital;

--2.Doctor wise patient distribution
Select Doctor, COUNT(*) AS Total_Patients
From cleanedhealthcare_dataset
GROUP BY Doctor;

--CATEGORY 4: Insurance Analysis
Select `Insurance Provider`, COUNT(*) AS Total_Patients
From cleanedhealthcare_dataset
GROUP BY `Insurance Provider`;

--CATEGORY 5: Admission & Stay Analysis
Select `Admission Type`, COUNT(*) AS Total_Patients
From cleanedhealthcare_dataset
GROUP BY `Admission Type`;

--CATEGORY 6: Billing Segmentation (Advance Thinking)
SELECT
CASE
  WHEN `Billing Amount` > 25000 THEN 'High Cost'
  WHEN `Billing Amount` BETWEEN 10000 AND 25000 THEN 'Medium Cost'
  ELSE 'Low Cost'
END AS Billing_Category,
COUNT(*) AS Total_Patients
FROM cleanedhealthcare_dataset
GROUP BY
CASE
  WHEN `Billing Amount` > 25000 THEN 'High Cost'
  WHEN `Billing Amount` BETWEEN 10000 AND 25000 THEN 'Medium Cost'
  ELSE 'Low Cost'
END;

--CATEGORY 7: Time-Based Analysis
--1.Year-wise patient inflow
SELECT YEAR(`Date of Admission`) AS year, COUNT(*) AS Total_Patients
FROM cleanedhealthcare_dataset
GROUP BY YEAR(`Date of Admission`)
ORDER BY year;

