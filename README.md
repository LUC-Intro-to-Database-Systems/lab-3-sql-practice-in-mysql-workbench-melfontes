**Lab 3 - SQL Practice in MySQL Workbench  - Melline Fontes Noronha**<br>
---------------------------------------- <br>
<br>
### Deliverable 1 - Data Definition Language <br>
<br> SQL commands to create the database are available on the **Lab3-CreateTable.sql** 
<br> ER diagram (Melline): <br>
<img src="https://github.com/user-attachments/assets/e52c91fa-120d-4400-a1c9-cb6255d21d64" width="550" alt="ER Diagram - Melline"/><br>
### Deliverable 2 - Data Manipulation Language 
<br> SQL commands are available on the **Lab3.sql** 
<br> Notes: 
<br> - I had to use the UPDATE command to remove the "$" signal from the original data provided - useful for future analysis.
<br> - I had to use the command SET SQL_SAFE_UPDATES = 0 to be able to update the table on Exercise 2.
<br> P.s. Both codes are included into Lab3.sql file.
<br>
<br> Outputs: <br>
<br>1. Write the SQL command to list all clients and all the columns pertaining to a client. The intended output is below.
<br> Command: SELECT * FROM CLIENT (line 63 - Lab3.sql)<br>
<img src="https://github.com/user-attachments/assets/ff5fa4e8-ed51-4c29-a0ec-142a71cfa469" width="450" alt="Ex1 - Melline"/>
<br>
<br>2. Write the SQL command to change client Chris Isaac to Chris Pearson. No output for this command.
<br> Command: UPDATE CLIENT SET client_name = 'Chris Pearson' WHERE client_name = 'Chris Isaac' (line 67 - Lab3.sql)
<br>
<br>3. Write the SQL command to display all policies that have a policy type of 'Home'.
<br> Command: SELECT * FROM POLICY WHERE policyType = "Home" (line 72 - Lab3.sql)<br>
<img src="https://github.com/user-attachments/assets/8d7e9170-5947-46a7-829d-8259325d8b38" width="350" alt="Ex3 - Melline"/>
<br>
<br> 4. Write the SQL command to display all columns for policies that have yearly terms. 
<br> Command: SELECT * FROM POLICY WHERE policyTerm = "yearly" (line 77 - Lab3.sql)<br>
<img src="https://github.com/user-attachments/assets/446aa034-3405-4ada-a883-03d9b805d9c7" width="350" alt="Ex4 - Melline"/>
<br>
<br>5.  Write the SQL command that displays the client name, address, and age sorted by age in descending order in the figure below.
<br> Command: SELECT client_name, client_address, client_age FROM CLIENT ORDER BY client_age DESC (line 82 - Lab3.sql)<br>
<img src="https://github.com/user-attachments/assets/7113b08f-b7f5-4d92-b125-497808ffc3dc" width="350" alt="Ex5 - Melline"/>
<br>
<br> 6. Write the SQL command that calculates the average age of all clients 
<br> Command: SELECT AVG(client_age) AS "Average Age" FROM CLIENT (line 87 - Lab3.sql)<br>
<img src="https://github.com/user-attachments/assets/334e13f6-a11b-4367-b9d7-655625d73462" width="200" alt="Ex6 - Melline"/>
<br>
<br> 7. Write the SQL command that lists the name and age of clients who are between the ages of 22 and 40.
<br> Command: SELECT client_name, client_age FROM CLIENT WHERE client_age > 21 AND client_age < 41 (line 91 - Lab3.sql)<br>
<img src="https://github.com/user-attachments/assets/d98eb88a-f8f0-4990-9708-6677e3b49a04" width="250" alt="Ex7 - Melline"/>
<br>
<br> 8. Write the SQL command that lists all home policies that have a policy limit less than or equal to $250,000.
<br> Command: SELECT * FROM POLICY WHERE policyType = "Home" AND  policyLimits <= 250000 (line 99 - Lab3.sql)<br>
<img src="https://github.com/user-attachments/assets/e99e067a-c75d-49bd-9b52-0da17d075913" width="300" alt="Ex8 - Melline"/>
<br>
<br> 9. Write the SQL command that lists the client's name and address for all addresses that contain 'Featherstone' and order by age in ascending order. 
<br> Command: SELECT client_name, client_address FROM CLIENT WHERE client_address LIKE '%Featherstone%' ORDER BY client_age ASC (line 104 - Lab3.sql)<br>
<img src="https://github.com/user-attachments/assets/f18f1c54-6642-4287-8216-7741fca86c41" width="300" alt="Ex9 - Melline"/>
<br>
<br> 10. Write the SQL command that lists the name, address, and age of clients who are age 35 and above and whose address contains the number 8.
<br> Command: SELECT client_name, client_address, client_age FROM CLIENT WHERE client_age >35 AND client_address LIKE '%8%' (line 112 - Lab3.sql)<br>
<img src="https://github.com/user-attachments/assets/61770762-18b0-467a-84a1-012597827adb" width="300" alt="Ex10 - Melline"/>
<br>
<br> 11. Write the SQL command that returns the total # of policies offered.
<br> Command: SELECT COUNT(*) AS 'Total Count' FROM POLICY (line 119 - Lab3.sql)<br>
<img src="https://github.com/user-attachments/assets/2d0b209b-a8aa-47c8-a747-d0da9767b77b" width="200" alt="Ex11 - Melline"/>
<br>
<br> 12. Write the SQL command that returns the policy type and the total count of policies by type.
<br> Command: SELECT policyType, COUNT(*) AS 'Count of Policies' FROM POLICY GROUP BY policyType (line 123 - Lab3.sql)<br>
<img src="https://github.com/user-attachments/assets/c3018b41-46a1-4a42-ae2f-39de9a3c05b4" width="200" alt="Ex12 - Melline"/>
<br>
<br> 13. Write the SQL command that returns the youngest and oldest client.
<br> Command: SELECT MIN(client_age) AS "Youngest Client" , MAX(client_age) AS "Oldest Client" FROM CLIENT (line 128 - Lab3.sql)<br>
<img src="https://github.com/user-attachments/assets/4c6b9bbc-33f3-4dba-a214-0a3155121421" width="200" alt="Ex13 - Melline"/>
<br>
<br> 14. Write the SQL command that lists all clients that have a home insurance policy
<br> Command: SELECT clientID, Client_name, client_address, client_age, CLIENT_clientID, POLICY_policyID FROM CLIENT<br>
JOIN POLICY_LIST ON CLIENT.clientID = POLICY_LIST.CLIENT_clientID <br>
JOIN POLICY ON POLICY_LIST.POLICY_policyID = POLICY.policyID <br>
WHERE POLICY.policyType = 'Home' ORDER BY clientID ASC (line 132 - Lab3.sql)<br>
<img src="https://github.com/user-attachments/assets/cd58fddf-04a1-468a-b958-68853881dbe5" width="500" alt="Ex14 - Melline"/>
<br>
<br> 15. Returns all instances of a policy where the client ID is equal to #2.
<br> Command: SELECT 	CLIENT.clientID, CLIENT.client_name, CLIENT.client_address, CLIENT.client_age, POLICY_LIST.CLIENT_clientID, POLICY.policyID FROM CLIENT <br>
JOIN POLICY_LIST ON CLIENT.clientID = POLICY_LIST.CLIENT_clientID <br>
JOIN POLICY ON POLICY_LIST.POLICY_policyID = POLICY.policyID <br>
WHERE CLIENT.clientID = "2" (line 140 - Lab3.sql)<br>
<img src="https://github.com/user-attachments/assets/3d06fd74-325a-43c3-99d3-6833f62cb7cf" width="200" alt="Ex15 - Melline"/>
<br>
<br> -- Extra Credit --
<br> Command: SELECT CLIENT.clientID, CLIENT.client_name, CLIENT.client_address, CLIENT.client_age, POLICY_LIST.CLIENT_clientID, POLICY_LIST.POLICY_policyID, POLICY.policyID, POLICY.policyType, POLICY.policyTerm, POLICY.policyLimits <br>
FROM CLIENT <br>
JOIN POLICY_LIST  ON CLIENT.clientID = POLICY_LIST.CLIENT_clientID <br>
JOIN POLICY ON POLICY_LIST.POLICY_policyID = POLICY.policyID (line 148 - Lab3.sql)<br>
<img src="https://github.com/user-attachments/assets/2ab8baa5-27dd-4c8f-867b-e26ee3393c5a" width="500" alt="Extra - Melline"/>



