USE hrcompany;

-- 1. Pasirinkite visus darbuotojus: parašykite SQL užklausą, kuri gautų
-- visus darbuotojų įrašus iš Employees lentelės. (TIP: turi būti išvesta visa
-- visų darbuotojų informacija)

SELECT *
FROM Employees;

-- 2. Pasirinkite tam tikrus stulpelius: parodykite visus vardus ir
-- pavardes iš Employees lentelės. (TIP: turi matytis tik vardai ir pavardės,
-- bet išvesti visi darbuotojai)

SELECT firstname, lastname
FROM Employees;

-- 3. Filtruokite pagal skyrius: gaukite darbuotojų sąrašą, kurie dirba
-- HR skyriuje. (TIP: jungti su departments lentele, bet turi būti išvesta bent
-- jau darbuotojų vardai ir pavardės, kurie ir dirba šiame skyriuje)

SELECT firstname, lastname, departmentname
FROM Employees
JOIN Departments ON Employees.departmentID = Departments.departmentid
WHERE DepartmentName = 'HR';

-- 4. Surikiuokite darbuotojus: gaukite darbuotojų sąrašą, surikiuotą pagal
-- jų įdarbinimo datą didėjimo tvarka. (TIP: apie darbuotojus išveskite visą arba
-- pasirinktą informaciją, bet turi būti surikiuoti kaip pasakyta)

SELECT * 
FROM Employees
ORDER BY hiredate;

-- 5. Suskaičiuokite darbuotojus: raskite kiek iš viso įmonėje dirba darbuotojų.
-- (TIP: turi išsivesti vienas skaičiukas su darbuotojų skaičiumi)

SELECT count(*) AS `Darbuotoju kiekis` 
FROM Employees;

-- 6. Sujunkite darbuotojus su skyriais: išveskite bendrą darbuotojų sąrašą, šalia kiekvieno darbuotojo nurodant skyrių kuriame dirba. 
-- (TIP: būtų geriausia jeigu būtų pateikta bent jau darbuotojų vardai ir pavardės, bei skyrių pavadinimai, 
-- bet galite išvesti ir daugiau informacijos, netinka jei bus pateikti tik darbuotojų id)

SELECT firstname, lastname, departmentname
FROM Employees
JOIN Departments ON Employees.departmentID = Departments.departmentid;

-- 7. Apskaičiuokite vidutinį atlyginimą: 
-- suraskite koks yra vidutinis atlyginimas įmonėje tarp visų darbuotojų. 
-- (TIP: turi gautis vienas skaičius kaip atsakymas, kuriame aiškiai matytųsi visų darbuotojų bendras atlyginimo vidurkis) 
-- (TIP2: atkreipkite dėmesį kad kiekvienas darbuotojas turi kelis atlyginimus, 
-- jeigu sugebėsite ištraukti kiekvienam darbuotojai naujausią pagal datą ir tik iš jo skaičiuoti vidurkį būtų labai super 
-- bet jei nesigaus reikėtų paimti bent jau bendrą lentelės vidurkį)

SELECT avg(SalaryAmount) 
FROM Salaries
WHERE YEAR(SalaryStartDate) = 2023;

-- 8. Išfiltruokite ir suskaičiuokite: raskite kiek darbuotojų dirba IT skyriuje.
-- (TIP: turite gauti tik vieną skaičių su atsakymu, jokių darbuotojų
-- nereikia išvedinėti)

SELECT count(*)
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE DepartmentName = 'IT';

-- 9. Išrinkite unikalias reikšmes: gaukite unikalių siūlomų darbo pozicijų sąrašą iš jobpositions lentelės. 
-- (TIP: jobpositions yra darbo skelbimai, kurie nėra susiję su tikrais darbuotojais, bet tai nereiškia, kad šioje lentelėje nėra duomenų, yra, tik nereikia su niekuo jungti) 
-- (TIP2: turite gauti tik pavadinimų sąrašą)

SELECT DISTINCT PositionTitle
FROM JobPositions;

-- 10. Išrinkite pagal datos rėžį: gaukite darbuotojus, kurie buvo nusamdyti tarp 2020-02-01 ir 2020-11-01. 
-- (TIP: suraskite nurodytus darbuotojus ir išveskite visą ar pasirinktą informaciją apie juos)

SELECT FirstName, LastName, HireDate
FROM Employees;

SELECT FirstName, LastName, HireDate
FROM Employees
WHERE HireDate Between '2020-02-01' AND '2020-11-01';

-- 11. Darbuotojų amžius: gaukite kiekvieno darbuotojo amžių pagal tai kada jie yra gimę. 
-- (TIP: išveskite bent jau darbuotojų vardus ir pavardes, dėl pasitikrinimo būtų gerai ir gimimo metai, bei išskaičiuotą amžiaus stulpelį)

SELECT FirstName, LastName, DateOfBirth, DateOfBirth, FLOOR(DATEDIFF(CURDATE(), DateOfBirth) / 365) AS Age
FROM Employees;

-- 12. Darbuotojų el. pašto adresų sąrašas: gaukite visų darbuotojų el. pašto adresų sąrašą abėcėline tvarka. 
-- (TIP: neišvedinėkite nieko ko neprašo užduotis, t.y. reikia tik el. pašto adresų ir daugiau nieko)

SELECT Email
FROM Employees
ORDER BY Email;

-- 13. Darbuotojų skaičius pagal skyrių: suraskite kiek kiekviename skyriuje dirba darbuotojų. 
-- (TIP: išveskite tik skyrių pavadinimus ir kiekius kiek kiekviename skyriuje dirba darbuotojų)

SELECT COUNT(DepartmentName), DepartmentName
FROM Employees
JOIN Departments ON Employees.departmentID = Departments.departmentid
GROUP BY departmentname;

-- 14. Darbštus darbuotojas: išrinkite visus darbuotojus, kurie turi 3 ar daugiau įgūdžių (skills). 
-- (TIP: turite išvesti ne tik sąsają tarp duomenų, bet ir pačių darbuotojų bent vardus su pavardėmis, 
-- galima aišku pateikti ir daugiau informacijos apie tokius darbuotojus kurie turi tiek įgūdžių)

SELECT FirstName, LastName, COUNT(SkillID) AS `SkillCount`
FROM Employees 
JOIN EmployeeSkills ON Employees.EmployeeID = EmployeeSkills.EmployeeID
GROUP BY EmployeeSkills.EmployeeID
HAVING `SkillCount` >= 3;

-- 15. Vidutinė papildomos naudos kaina: apskaičiuokite vidutines papildomų naudų išmokų (benefits lentelė) išlaidas darbuotojams. 
-- (TIP: įmonė turi siūlomų naudų paketą, raskite tiesiog vidurkį kiek vidutiniškai viena nauda kainuoja, 
-- čia jums nereikia jungti su jokiais darbuotojais ar aiškintis kokia kaina susidaro iš darbuotojų kurie yra pasirinkę šias naudas)

SELECT ROUND(AVG(Cost), 2) FROM Benefits;

-- 16. Jaunausias ir vyriausias darbuotojai: suraskite jaunausią ir vyriausią darbuotoją įmonėje. 
-- (TIP: jeigu gaunasi išveskite per vieną užklausą, jeigu ne išveskite per dvi atskiras užklausas) 
-- (TIP2: išveskite ne tik amžių ar gimimo datą, bet ir visą informaciją apie darbuotojus)

SELECT *, TIMESTAMPDIFF(YEAR, DateOfBirth, CURDATE()) AS `Age`
FROM Employees
	WHERE DateOfBirth = (SELECT MIN(DateOfBirth) FROM Employees)
	OR DateOfBirth = (SELECT MAX(DateOfBirth) FROM Employees);

-- 17. Skyrius su daugiausiai darbuotojų: suraskite kuriame skyriuje dirba daugiausiai darbuotojų. 
-- (TIP: suraskite kuriame skyriuje yra daugiausiai darbuotojų ir išveskite šio skyriaus informaciją, pvz jo pavadinimą, kiek darbuotojų jame yra ir kt.)

SELECT DepartmentName, COUNT(*) AS `Darbuotoju kiekis` FROM Employees
JOIN Departments ON Departments.DepartmentID = Employees.DepartmentID
GROUP BY DepartmentName
HAVING `Darbuotoju kiekis` = 
	(SELECT MAX(`Darbuotoju kiekis`) FROM (SELECT COUNT(*) as `Darbuotoju kiekis`
    FROM Employees
    GROUP BY DepartmentID) AS kiekis);
	
-- 18. Tekstinė paieška: suraskite visus darbuotojus su žodžiu "excellent"
-- jų darbo atsiliepime (performancereviews lentelė). (TIP: jeigu gaunasi tai
-- išveskite darbuotojų kurie turi tokius aprašymus informaciją, o jeigu
-- nesigauna tai bent jau tuos atsiliepimus kurie atitinka sąlygą)

SELECT FirstName, LastName, DateOfBirth, Gender, Email, Phone, Address, HireDate, ReviewDate, ReviewText, Rating
FROM PerformanceReviews 
JOIN Employees ON Employees.EmployeeID = PerformanceReviews.EmployeeID
WHERE ReviewText LIKE "%excellent%";

-- 19. Darbuotojų telefono numeriai: išveskite visų darbuotojų ID su jų
-- telefono numeriais. (TIP: čia reikia išveskite tik ID ir jų telefono numerius,
-- jokia kita informacija nereikalinga)

SELECT EmployeeID, Phone FROM Employees;

-- 20. Darbuotojų samdymo mėnesis: suraskite kurį mėnesį buvo nusamdyta
-- daugiausiai darbuotojų. (TIP: jums reikia išvesti tik mėnesio numerį arba
-- pavadinimą kuris atitiko duotą sąlygą, bei kiek darbuotojų tą mėnesį buvo
-- įdarbinta, neišvedinėkite viso sąrašo ir neieškokite konkrečių darbuotojų)

SELECT MONTHNAME(HireDate) AS `Samdomiausias_menuo`, COUNT(*) AS `Pasamdyta` FROM Employees
GROUP BY MONTHNAME(HireDate)
HAVING `Pasamdyta` = 
	(SELECT MAX(`Pasamdyta`) FROM (SELECT COUNT(*) as `Pasamdyta`
    FROM Employees
    GROUP BY MONTHNAME(HireDate)) AS kiekis);

-- 21. Darbuotojų įgūdžiai: išveskite visus darbuotojus, kurie turi įgūdį
-- "Communication". (TIP: jeigu galite išveskite ir šių darbuotojų informaciją,
-- tokią kaip vardas ar pavardė, bet jei nesigauna tai bent šių darbuotojų ID)

SELECT FirstName, LastName, SkillName
FROM Employees
JOIN EmployeeSkills ON Employees.EmployeeID = EmployeeSkills.EmployeeID
JOIN Skills ON Skills.SkillID = EmployeeSkills.SkillID
WHERE SkillName = "Communication";

-- 22. Sub-užklausos: suraskite kuris darbuotojas įmonėje uždirba daugiausiai
-- ir išveskite visą jo informaciją. (TIP: turi matytis tokio darbuotojo informacija,
-- o ne tik surastas didžiausias atlyginimas)

SELECT DISTINCT(Employees.EmployeeID), FirstName, LastName, DateOfBirth, Gender, Email, Phone, Address, HireDate, DepartmentID, SalaryAmount
FROM Salaries
JOIN Employees ON Employees.EmployeeID = Salaries.EmployeeID
WHERE SalaryAmount = (SELECT MAX(SalaryAmount) FROM Salaries);

-- 23. Grupavimas ir agregacija: apskaičiuokite visas įmonės išmokų (benefits
-- lentelė) išlaidas. (TIP: suskaičiuokite kiek iš viso įmonė išleidžia dėl visų
-- papildomų naudų, turi gautis vienas ir bendras skaičius, įvertinant, kad vieni
-- darbuotojai turi daugiau naudų, kiti mažiau, vieni)

SELECT SUM(COST) AS "Bendra_Benefits_Suma" FROM Benefits
JOIN EmployeeBenefits ON EmployeeBenefits.BenefitID = Benefits.BenefitID;

-- 24. Parodykite visus galimus įgūdžius. (TIP: turite parodyti tik įgūdžių pavadinimus,
-- su darbuotojais jungti nereikia)

SELECT SkillNAme FROM Skills;

-- 25. Atostogų užklausos: išveskite sąrašą atostogų prašymų (leaverequests),
-- kurie laukia patvirtinimo. (TIP: turite išvesti tik tokius prašymus, kurie
-- atitinka nurodytą sąlygą, darbuotojų išvedinėti nereikia)

SELECT * FROM LeaveRequests
WHERE Status = "Pending";

-- 26. Darbo atsiliepimas: išveskite darbuotojus, kurie darbo atsiliepime yra gavę 5 balus. 
-- (TIP: užduotyje parašyta išvesti darbuotojus, vadinasi, reikia surasti ne tik tokius atsiliepimus, bet ir sujungti su darbuotojais, 
-- bei išvesti bent jau jų vardus ir pavardes)

SELECT DISTINCT(CONCAT(FirstName, " ", LastName)) AS `Name and Surname`, Rating FROM PerformanceReviews
JOIN Employees ON Employees.EmployeeID = PerformanceReviews.EmployeeID
WHERE Rating = 5;

-- 27. Papildomų naudų registracijos: išveskite visus darbuotojus, kurie yra
-- užsiregistravę į "Health Insurance" papildomą naudą (benefits lentelė).
-- (TIP: turite sujungti su darbuotojais ir išvesti bent jau jų vardus ir
-- pavardes, kurie atitinka nurodytą sąlygą)

SELECT FirstName, LastName, BenefitName FROM EmployeeBenefits
JOIN Benefits ON Benefits.BenefitID = EmployeeBenefits.BenefitID
JOIN Employees ON EmployeeBenefits.EmployeeID = Employees.EmployeeID
WHERE BenefitName = "Health Insurance";

-- 28. Atlyginimų pakėlimas: parodykite kaip atrodytų atlyginimai darbuotojų, dirbančių "Finance" skyriuje, 
-- jeigu jų atlyginimus pakeltume 10 %. 
-- (TIP: turite parodyti bent šiek tiek darbuotojų informacijos, pvz vardus pavardes, jų atlyginimus, ir pakeltus atlyginimus, 
-- o kad žinoti kurie darbuotojai tinka, reikės jungti su departments lentele)

SELECT DISTINCT(CONCAT(FirstName, " ", LastName)) AS `Name/Surname`, s.SalaryStartDate, s.SalaryAmount AS `Latest Salary`, s.SalaryAmount * 1.1 AS `Increased Salary` 
FROM Departments
JOIN Employees ON Departments.DepartmentID = Employees.DepartmentID
JOIN Salaries s ON s.EmployeeID = Employees.EmployeeID
WHERE DepartmentName = "Finance" 
	AND s.SalaryStartDate = 
		(SELECT MAX(SalaryStartDate)
		FROM Salaries
		WHERE Salaries.EmployeeID = s.EmployeeID);
	
-- 29. Efektyviausi darbuotojai: raskite 5 darbuotojus, kurie turi didžiausią darbo vertinimo (performance lentelė) reitingą. 
-- (TIP: jei nesigauna išveskite bent tuos atsiliepimus, bet būtų geriau jei pavyktų išvesti ir pačių darbuotojų informaciją)

SELECT FirstName, LastName, Rating, ReviewText
FROM PerformanceReviews
JOIN Employees ON Employees.EmployeeID = PerformanceReviews.EmployeeID
WHERE Rating = 5
LIMIT 5;

-- 30. Atostogų užklausų istorija: gaukite visą atostogų užklausų istoriją (leaverequests lentelė) darbuotojo, kurio id yra 1. 
-- (TIP: išveskite visą informaciją apie tokius šio darbuotojo prašymus, paties darbuotojo nereikia)

SELECT * FROM LeaveRequests
WHERE EmployeeID = 1;

-- 31. Atlyginimų diapozono analizė: nustatykite atlyginimo diapazoną (minimalų ir maksimalų) kiekvienai darbo pozicijai. 
-- (TIP: nemaišykit su jobspositions nes ten yra skelbimų lenta ir ji su darbuotojais nėra susijus) 
-- (TIP2: turite išvesti skyriaus pavadinimą, kokia mažiausia alga jame yra, ir kokia didžiausia alga)
-- (TIP3: būtų geriausia jei imtumėt vėliausias datas, o ne bet kurias pasitaikusias)

SELECT DepartmentName, MIN(SalaryAmount), MAX(SalaryAmount) FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
JOIN Salaries s ON s.EmployeeID = Employees.EmployeeID
WHERE s.SalaryStartDate = 
		(SELECT MAX(SalaryStartDate)
		FROM Salaries
		WHERE Salaries.EmployeeID = s.EmployeeID)
GROUP BY DepartmentName;

-- 32. Darbo atsiliepimo istorija: gaukite visą istoriją apie darbo atsiliepimus
-- (performancereviews lentelė), darbuotojo, kurio id yra 2. (TIP: išveskite visą
-- tokių atsiliepimų informaciją, paties darbuotojo informacijos nereikia)

SELECT * FROM PerformanceReviews
WHERE EmployeeID = 2 OR ReviewerID = 2;

-- 33. Papildomos naudos kaina vienam darbuotojui: apskaičiuokite bendras papildomų naudų išmokų išlaidas vienam darbuotojui (benefits lentelė). 
-- (TIP: turite gauti vieną skaičių kaip galutinį atsakymą, šis skaičius yra bendras vidurkis kiek yra vidutiniškai išleidžiama ant vieno darbuotojo per jo naudas)

SELECT ROUND(AVG(Cost), 2)
FROM (SELECT SUM(Cost) AS Cost FROM Benefits
JOIN EmployeeBenefits ON Benefits.BenefitID = EmployeeBenefits.BenefitID
GROUP BY EmployeeID) AS Suma;

-- 34. Geriausi įgūdžiai pagal skyrių: išvardykite dažniausiai pasitaikančius įgūdžius kiekviename skyriuje. 
-- (TIP: turite išvesti skyrių pavadinimus, o šalia jų koks įgūdis jame pasitaikė dažniausiai, 
-- o jei taip sutraukti nesigauna tai bent išvesti kiekvieną skyrių, jo įgūdį ir kiek kartų kartojasi jame 
-- ir surikiuoti kad matytųsi bent pagal dažnumą)

WITH DepartmentSkillCounts AS (
SELECT d.DepartmentName, s.SkillName, COUNT(*) AS SkillCount,
	ROW_NUMBER() OVER (PARTITION BY d.DepartmentName ORDER BY COUNT(*) DESC) as rn,
	MAX(COUNT(*)) OVER (PARTITION BY d.DepartmentName) as max_count
FROM Departments d
    JOIN Employees e ON d.DepartmentID = e.DepartmentID
    JOIN EmployeeSkills es ON e.EmployeeID = es.EmployeeID
    JOIN Skills s ON es.SkillID = s.SkillID
    GROUP BY d.DepartmentName, s.SkillName ),
MostFrequentSkills AS (
    SELECT DepartmentName, SkillName, SkillCount
    FROM DepartmentSkillCounts
    WHERE SkillCount = max_count)
SELECT DepartmentName, GROUP_CONCAT(SkillName) as MostFrequentSkills, MAX(SkillCount) as SkillCount
	FROM MostFrequentSkills
	GROUP BY DepartmentName;

-- 35. Atlyginimo augimas: apskaičiuokite procentinį atlyginimo padidėjimą kiekvienam darbuotojui, lyginant su praėjusiais metais. 
-- (TIP: turi matytis darbuotojų informacija, pvz vardai ir pavardės, 
-- taip pat kiek procentų atlyginimas paaugo, 
-- o jei nepaaugo rašyti 0 procentų)

SELECT FirstName, LastName, 
	MAX(CASE WHEN YEAR(s.SalaryStartDate) = 2022 THEN s.SalaryAmount END) AS LastYearSalary, 
	MAX(CASE WHEN YEAR(s.SalaryStartDate) = 2023 THEN s.SalaryAmount END) AS CurrentSalary, 
	CONCAT(ROUND((
		MAX(CASE WHEN YEAR(s.SalaryStartDate) = 2023 THEN s.SalaryAmount END) / 
        MAX(CASE WHEN YEAR(s.SalaryStartDate) = 2022 THEN s.SalaryAmount END) *
        100), 2) - 100, '%') AS SalaryIncrease
FROM Employees e
	JOIN Salaries s ON s.EmployeeID = e.EmployeeID
	GROUP BY e.EmployeeID;

-- 36. Darbuotojų išlaikymas: raskite darbuotojus, kurie įmonėje dirba daugiau nei 5 metai ir kuriems per tą laiką nebuvo pakeltas atlyginimas. 
-- (TIP: išveskite tokių darbuotojų informaciją, o ne tik id)

SELECT FirstName, LastName, HireDate
FROM Employees e
JOIN Salaries s ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
HAVING 
    MAX(CASE WHEN YEAR(s.SalaryStartDate) = 2022 THEN s.SalaryAmount END) =
    MAX(CASE WHEN YEAR(s.SalaryStartDate) = 2023 THEN s.SalaryAmount END)
AND DATEDIFF(CURDATE(), e.HireDate) / 365 > 5;

-- 37. Darbuotojų atlyginimų analizė: suraskite kiekvieno darbuotojo atlygį
-- (atlyginimas (salaries lentelė) + išmokos už papildomas naudas (benefits lentelė))
-- surikiuokite darbuotojus pagal bendrą atlyginimą mažėjimo tvarka. 
-- (TIP: turi matytis ir darbuotojo informacija ir jo atlyginimas, ir jo naudų bendra vertė)

WITH TotalBenefits AS (
SELECT eb.EmployeeID, SUM(Cost) AS TotalBenefits
FROM EmployeeBenefits eb 
JOIN Benefits b ON b.BenefitID = eb.BenefitID
GROUP BY eb.EmployeeID),
LatestSalary AS (
SELECT e.EmployeeID, s.SalaryAmount AS LatestSalary
FROM Employees e
JOIN Salaries s ON s.EmployeeID =  e.EmployeeID
WHERE YEAR(s.SalaryStartDate) = 2023)
SELECT FirstName, LastName, TotalBenefits + LatestSalary AS TotalPay
FROM Employees e
JOIN TotalBenefits ON e.EmployeeID = TotalBenefits.EmployeeID
JOIN LatestSalary ON e.EmployeeID = LatestSalary.EmployeeID;

-- 38. Darbuotojų darbo atsiliepimų tendencijos: išveskite kiekvieno darbuotojo vardą
-- ir pavardę, nurodant ar jo darbo atsiliepimas (performancereviews lentelė)
-- pagerėjo ar sumažėjo. (TIP: turi matytis kiekvienas darbuotojas, jo informacija ir
-- vertinimas ar pagerėjo ar ne)

SELECT e.FirstName, e.LastName, r1.Rating AS PreviousRating, r2.Rating AS LatestRating,
CASE
	WHEN r2.Rating > r1.Rating THEN 'Increased'
	WHEN r2.Rating < r1.Rating THEN 'Decreased'
	ELSE 'Stayed the Same'
END AS Trend
FROM Employees e
JOIN PerformanceReviews r1 ON e.EmployeeID = r1.EmployeeID
JOIN PerformanceReviews r2 ON e.EmployeeID = r2.EmployeeID
WHERE r1.ReviewDate < r2.ReviewDate;
