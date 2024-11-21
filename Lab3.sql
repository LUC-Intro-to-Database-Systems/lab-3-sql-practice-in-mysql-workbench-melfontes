-- Inserting data into the database --
INSERT INTO CLIENT (clientID, client_name, client_address, client_age) 
VALUES 
(1, 'James Clark', '1001 Plymouth Ave', 38),
(2, 'Leah Nicole', '2401 Chicago Ave. #212', 36),
(3, 'Silas Alexander', '5012 Humboldt Lane', 22),
(4, 'Noah Charles', '501 College Ave.', 25),
(5, 'Chris Isaac', '228 e, 149th st.', 37),
(6, 'Noah Charles', '501 College Ave.', 25),
(7, 'Brittney Owens', '321 Thursday Ave.', 42),
(8, 'Kurt Douglas', '123 Mt. Glenwood', 58),
(9, 'Areta Farries', '789 Touy Ave.', 62),
(10, 'Jessica Daniel', '698 Featherstone', 47),
(11, 'Gary Moore', '698 Featherstone', 48),
(12, 'Elnora Daniel', '698 Featherstone', 61),
(13, 'Daniel Moore', '698 Featherstone', 22),
(14, 'Cheryl Pearson', '228 e, 149th st.', 67);

INSERT INTO POLICY (policyID, policyType, policyTerm, policyLimits) 
VALUES 
(1, 'Home', 'yearly', '$100,000'),
(2, 'Home', 'yearly', '$250,000'),
(3, 'Home', 'yearly', '$500,000'),
(4, 'Home', 'yearly', '$1,000,000'),
(5, 'Home', '6-month', '$100,000'),
(6, 'Home', '6-month', '$250,000'),
(7, 'Home', '6-month', '$500,000'),
(8, 'Home', '6-month', '$1,000,000'),
(9, 'Car', 'yearly', '$60,000'),
(10, 'Car', 'yearly', '$120,000'),
(11, 'Car', '6-month', '$60,000'),
(12, 'Car', '6-month', '$120,000');

INSERT INTO POLICY_LIST (CLIENT_clientID, POLICY_policyID) 
VALUES 
(2, 1),
(9, 1),
(13, 1),
(2, 4),
(5, 4),
(8, 5),
(14, 6),
(11, 7),
(1, 8),
(3, 8),
(7, 9),
(1, 10),
(3, 10),
(7, 10),
(10, 10),
(6, 11),
(4, 12);

UPDATE POLICY
SET policyLimits = REPLACE(REPLACE(policyLimits, '$', ''), ',', '');

SET SQL_SAFE_UPDATES = 0;

SELECT * 
	FROM POLICY;

-- 1. Write the SQL command to list all clients and all the columns pertaining to a client. The intended output is below. --
SELECT * 
	FROM CLIENT;

-- 2. Write the SQL command to change client Chris Isaac to Chris Pearson. No output for this command --
UPDATE CLIENT
	SET client_name = 'Chris Pearson'
	WHERE client_name = 'Chris Isaac';

-- 3. Write the SQL command to display all policies that have a policy type of Home--
SELECT *
	FROM POLICY
    WHERE policyType = "Home";
    
-- 4. Write the SQL command to display all columns for policies that have yearly terms --
SELECT *
	FROM POLICY
    WHERE policyTerm = "yearly";

-- 5.  Write the SQL command that displays the client name, address, and age sorted by age in descending order in the figure below --
SELECT client_name, client_address, client_age
	FROM CLIENT
	ORDER BY client_age DESC;
    
-- 6. Write the SQL command that calculates the average age of all clients --
SELECT AVG(client_age) AS "Average Age"
	FROM CLIENT;
    
-- Write the SQL command that lists the name and age of clients who are between the ages of 22 and 40 --
SELECT 
    client_name, client_age
FROM
    CLIENT
WHERE
    client_age > 21 AND client_age < 41;
    
-- 8. Write the SQL command that lists all home policies that have a policy limit less than or equal to $250,000. --
SELECT *
	FROM POLICY
    WHERE policyType = "Home" AND  policyLimits <= 250000;

-- 9. Write the SQL command that lists the client's name and address for all addresses that contain 'Featherstone' and order by age in ascending order. --
SELECT 
    client_name, client_address
FROM
    CLIENT
WHERE client_address LIKE '%Featherstone%'
ORDER BY client_age ASC;

-- 10. Write the SQL command that lists the name, address, and age of clients who are age 35 and above and whose address contains the number 8 --
SELECT 
    client_name, client_address, client_age
FROM CLIENT
WHERE client_age >35 AND client_address LIKE '%8%'; 


-- 11. Write the SQL command that returns the total # of policies offered --
SELECT COUNT(*) AS 'Total Count'
FROM POLICY;

-- 12. Write the SQL command that returns the policy type and the total count of policies by type --
SELECT policyType, COUNT(*) AS 'Count of Policies'
FROM POLICY
GROUP BY policyType;

-- 13. Write the SQL command that returns the youngest and oldest client --
SELECT MIN(client_age) AS "Youngest Client" , MAX(client_age) AS "Oldest Client"
FROM CLIENT;

-- 14. Write the SQL command that lists all clients that have a home insurance policy --
SELECT clientID, Client_name, client_address, client_age, CLIENT_clientID, POLICY_policyID
FROM CLIENT
JOIN POLICY_LIST ON CLIENT.clientID = POLICY_LIST.CLIENT_clientID
JOIN POLICY ON POLICY_LIST.POLICY_policyID = POLICY.policyID 
WHERE POLICY.policyType = 'Home'
ORDER BY clientID ASC;

--  15: Returns all instances of a policy where the client ID is equal to #2
SELECT 	CLIENT.clientID, CLIENT.client_name, CLIENT.client_address, CLIENT.client_age, POLICY_LIST.CLIENT_clientID, POLICY.policyID
FROM CLIENT
JOIN POLICY_LIST ON CLIENT.clientID = POLICY_LIST.CLIENT_clientID
JOIN POLICY ON POLICY_LIST.POLICY_policyID = POLICY.policyID
WHERE CLIENT.clientID = "2";


-- Extra Credit --
SELECT CLIENT.clientID, CLIENT.client_name, CLIENT.client_address, CLIENT.client_age, POLICY_LIST.CLIENT_clientID, POLICY_LIST.POLICY_policyID, POLICY.policyID, POLICY.policyType, POLICY.policyTerm, POLICY.policyLimits
FROM CLIENT 
JOIN POLICY_LIST  ON CLIENT.clientID = POLICY_LIST.CLIENT_clientID
JOIN POLICY ON POLICY_LIST.POLICY_policyID = POLICY.policyID;
