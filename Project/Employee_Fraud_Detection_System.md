# Employee Fraud Detection System

# Introduction

Employee fraud poses a significant threat to organizations worldwide, leading to financial losses, reputational damage, and compromised integrity. Detecting and preventing such fraudulent activities is crucial for maintaining organizational security and trust. In response to this challenge, our project proposes the development of an Employee Fraud Detection System. This system harnesses advanced data analytics, data mining techniques, robust systems development methodologies, and cybersecurity measures to identify suspicious activities and potential instances of fraud within the organization.

**Project Description:** The project aims to develop an employee fraud detection system using Knowledge from what I learned in the following categories:

- Networking and Cybersecurity(CIDM 6356 & CIDM 6340)

- Data Analytics (CIDM 5310)

- Data Management (CIDM 6350 & CIDM 6355)

- System Development (CIDM 6303)

The system will analyze employee behavioral data, financial transactions, and access logs to identify suspicious activities and potential instances of fraud within the organization.

**Data Collection and Integration**

I got the whole idea from CIDS 6356 to detect fraud in a company. The plan involves generating synthetic data, as discussed in CIDM 6356, to simulate financial transactions, access control systems, and HR databases. Here is the [link](https://colab.research.google.com/drive/19tvWCtN1lWTZddB8RDBThGfwwkEvzuc7#scrollTo=UgY7rzoTk9_G) to the code for making fake data. Since each time the result would be different Please find the database [here](https://drive.google.com/file/d/1m7Fv_hIkJsBPsNvckV2Rykx0ZvH9uo_w/view?usp=sharing).


# Data Management

I employed the same approach utilized for the project in CIDM 6355 and CIDM 6355 for this section.

### Data Management Problems

The primary obstacle organizations face in combating employee fraud is the management and analysis of vast amounts of heterogeneous data. Employee activity logs, financial transactions, access control systems, and human resources databases all contain valuable information that, when integrated and analyzed effectively, can reveal patterns indicative of fraudulent behavior. However, the complexity and volume of this data present significant challenges in terms of collection, integration, preprocessing, and analysis.

### Motivation for Our Database Solution

The motivation behind our database solution stems from the urgent need for organizations to proactively detect and mitigate employee fraud risks. Traditional methods of fraud detection often rely on manual processes and rule-based systems, which are limited in their ability to adapt to evolving fraud schemes and detect subtle anomalies. By leveraging advanced data analytics, machine learning algorithms, and robust system architectures, our solution aims to provide organizations with a proactive and scalable approach to fraud detection.


### Potential Benefits

The implementation of our Employee Fraud Detection System offers several potential benefits to organizations:

**1. Early Detection:** By continuously analyzing employee behavioral data, financial transactions, and access logs, the system can identify suspicious activities at an early stage, allowing organizations to intervene before significant losses occur.

**2. Actionable Insights:** Through the application of data analytics and mining techniques, the system can extract actionable insights and patterns indicative of fraudulent behavior, enabling organizations to make informed decisions and implement targeted interventions.

**3. Enhanced Security:** By integrating robust networking and cybersecurity measures, the system ensures the secure transmission and storage of sensitive employee data and transaction records, safeguarding organizational integrity.

**4. Operational Efficiency:** The development of user-friendly interfaces, dashboards, and reporting tools streamlines the detection and investigation process, enhancing operational efficiency and reducing response times.

### Potential Users

The Employee Fraud Detection System is designed to cater to a wide range of users within organizations, including:

**1.	Risk Management Professionals:** Responsible for identifying and mitigating fraud risks, risk management professionals can leverage the system to proactively detect and prevent fraudulent activities.

**2.	Financial Analysts:** By analyzing financial transactions and uncovering suspicious patterns, financial analysts can use the system to assess fraud risks and inform decision-making processes.

**3.	Compliance Officers:** Charged with ensuring regulatory compliance and adherence to internal policies, compliance officers can utilize the system to monitor employee behavior and detect compliance violations.

**4.	Executive Leadership:** Senior executives and board members can benefit from the system's insights and analytics to gain a comprehensive understanding of fraud risks and take appropriate strategic actions.

### Forensic objectives:

• perform an audit to find any potential fraud in customer returns

• perform an audit to find any improper procedure violations in customer returns. Improper procedure violations are when the employee did not follow the Company Policy Regarding Customer Returns but are not necessarily fraudulent.  

### Business Rules Regarding Customer Returns:

1. Customers may return products for a return of the funds onto their debit/credit card or receive a gift card as follows.
   
2. For all returns, Employees shall manually record the customers ‘name, street address, city, state, and phone number into the return POS software.
   
3. If a receipt is present, the employee scans the receipt which causes the computer to record the return date and return price amount automatically.
   
4. If a receipt is present, the customer may choose to receive the funds as a gift card or to be returned to a credit/debit card.

   a. If the customer chooses a gift card, the employee scans the gift card. The POS software records the gift card number and puts the return price onto the gift card automatically. 

   b. If the customer chooses to have the funds returned to their debit/credit card, the employee swipes the debit/credit card. The computer records the debit/credit card number and expiration date and transfers the return price to the debit/credit card automatically.
  	
5. If the receipt is not present, the employee shall do the following:
    
   a. Returns without receipts must be issued a gift card for store credit and shall not receive funds on a debit/credit card.
  	
   b. Employee scans the UPC barcode on the returned item. The POS software records the return price and records today’s date as the return date.
  	
   c. The employee scans the gift card. The POS software records the gift card number and puts the return price onto the card automatically.

## Enhanced Entity-Relationship Diagram (EERD)

![image](https://github.com/wtamu-babb/CIDM6395-Spring2024-FarzanehNoroozi/assets/125631781/646bab71-9f83-451a-90f2-4f6fcf304ed3)



# Data Analytics & System Development

I employed the same approach utilized for the project in CIDM 5310 and CIDM 6303 for this section. The integrity of the database file, **myDB.db**, was meticulously verified using the SHA256 hash algorithm. The calculated hash number is **32912B9F25B591B92454BC4FA2CF146C275715CADEDA24DC85AA7E5A29A3D8FC**

![image](https://github.com/wtamu-babb/CIDM6395-Spring2024-FarzanehNoroozi/assets/125631781/184d1e9c-3579-404c-a0f2-7d316da5fd47)
Image 1: Verification of Hash and File Information

**Returns Processed by the Same Employee without a Receipt**

```
SELECT E.EmployeeID, E.Name AS EmployeeName, COUNT(*) AS NumReturns
FROM Return R
JOIN Employee E ON R.EmployeeID = E.EmployeeID
WHERE R.IsReceiptPresent = 0
GROUP BY R.EmployeeID, E.Name
HAVING NumReturns > 1;
```

![image](https://github.com/wtamu-babb/CIDM6395-Spring2024-FarzanehNoroozi/assets/125631781/796040b1-8db2-4dc0-96a9-2c2777a82d10)
Table 1: Returns Processed by the Same Employee without a Receipt

The average number of returns processed by an employee without a receipt is 29.04, with a standard deviation of 8.33, indicating the variability in this process across employees. To identify outliers, employees whose number of returns without a receipt significantly deviates from the average, considering a deviation of more than one standard deviation, are examined. Notably, Steven Curtis (EmployeeID: 79023) processed 46 returns without a receipt, followed by George Stevens (EmployeeID: 52272) with 40 returns, Angela Diaz (EmployeeID: 29733) with 38 returns, Dr. Thomas Weiss PhD (EmployeeID: 27935) with 36 returns, and Chad Dawson (EmployeeID: 61373) with 35 returns. These individuals demonstrate a significantly higher-than-average volume of returns processed without a receipt, suggesting a need for further investigation to understand the underlying reasons and ensure adherence to company policies regarding return procedures.

**Returns with Debit/Credit Card Refund and No Original Receipt**

```
SELECT E.EmployeeID, E.Name AS EmployeeName, COUNT(*) AS NumReturnsWithoutReceipt
FROM Return R
JOIN Employee E ON R.EmployeeID = E.EmployeeID
JOIN Customer C ON R.CustomerID = C.CustomerID
WHERE R.IsReceiptPresent = 0 AND C.CreditCardNum IS NOT NULL
GROUP BY E.EmployeeID, E.Name;
```

![image](https://github.com/wtamu-babb/CIDM6395-Spring2024-FarzanehNoroozi/assets/125631781/b3499462-0182-47e8-bf4c-240564bfd9e2)
Table 2: The count of returns without receipts processed by each employee

The analysis examines returns processed by each employee where credit/debit cards were used for refunds without original receipts. Steven Curtis leads with 46 returns, followed closely by George Stevens with 40 and Angela Diaz with 38. The distribution highlights varying levels of adherence to return policies, prompting the need for further investigation into why original receipts are missing in these transactions. To address this, regular training sessions and system improvements to prompt receipt verification are recommended to ensure compliance and minimize potential errors or fraud in return processing procedures.

**Returns Processed by each employee without Receipts and with Credit Card Transactions**

```
SELECT E.EmployeeID, E.Name, 
       SUM(CASE WHEN R.IsReceiptPresent = 'False' THEN 1 ELSE 0 END) AS ReturnsWithoutReceipts,
       SUM(CASE WHEN C.CreditCardNum IS NOT NULL THEN 1 ELSE 0 END) AS CreditCardTransactions
FROM Employee E
LEFT JOIN Return R ON E.EmployeeID = R.EmployeeID
LEFT JOIN Customer C ON R.CustomerID = C.CustomerID
GROUP BY E.EmployeeID, E.Name;
```
![image](https://github.com/wtamu-babb/CIDM6395-Spring2024-FarzanehNoroozi/assets/125631781/b1e1d74b-fb55-4874-b21d-1c59cc3216ac)
Table 3: Employee without Receipts and with Credit Card Transactions

we can observe that each employee has successfully processed credit card transactions, with varying numbers of such transactions. Additionally, none of the employees have processed returns without receipts. This indicates a high level of adherence to company policies regarding return procedures and suggests efficient handling of credit card transactions across the board.
This data could be used to assess employee performance in terms of adherence to company policies regarding returns and credit card transactions. It also provides insights into areas where further training or guidance may be needed, such as ensuring consistent compliance with return policies or optimizing credit card transaction processes.

**Returns Processed with Different Employee IDs but Same Customer Information**

```
SELECT C.CustomerName, C.Street, C.City, C.State, C.CustomerPhone, COUNT(DISTINCT R.EmployeeID) AS NumEmployees
FROM Return R
JOIN Customer C ON R.CustomerID = C.CustomerID
GROUP BY C.CustomerName, C.Street, C.City, C.State, C.CustomerPhone
HAVING NumEmployees > 1;
```

The query identifies instances where returns are processed with different employee IDs but share the same customer information. By grouping returns based on customer details and counting distinct employee IDs, it detects potential inconsistencies in handling returns for the same customer. However, the result reveals no such occurrences, indicating that the return process maintains consistency in associating each customer with a single employee, ensuring accuracy and preventing redundancy in customer service interactions.

**Returns Processed with Unusually High Return Price**

```
SELECT ReturnId, ReturnPrice
FROM Return
WHERE ReturnPrice > (SELECT AVG(ReturnPrice) * 2 FROM Return);
```
![image](https://github.com/wtamu-babb/CIDM6395-Spring2024-FarzanehNoroozi/assets/125631781/a30ad296-57b8-4d86-8dfa-fd0ba053d473)

Table 4: Returns Processed with Unusually High Return Price

The query reveals 135 returns flagged for unusually high prices. The highest return price, at 1290690993, indicates a significant outlier. Even the lowest return price, 131529198, remains notably high. To enhance security, implementing a rule in company policies to audit such high-value returns could be beneficial.

**Returns Processed with Unusually High Number of Transactions per Employee**

```
SELECT EmployeeID, COUNT(*) AS NumTransactions
FROM Return
GROUP BY EmployeeID
HAVING COUNT(*) > (SELECT AVG(NumTransactions) * 2 FROM (SELECT EmployeeID, COUNT(*) AS NumTransactions FROM Return GROUP BY EmployeeID) AS T);
```

The query confirms that there are no occurrences of returns processed with an unusually high number of transactions per employee. By analyzing each employee's transaction count and comparing it to double the average count, it ensures consistency across the board. This finding reflects a stable and controlled environment for return processing, where no employee demonstrates an abnormal surge in transactions, ensuring operational integrity.

# Networking and Cybersecurity Measures

I employed the same approach utilized for the homework in CIDM 6340 for this section. To ensure the security and integrity of our Employee Fraud Detection System, we could implement the following networking and cybersecurity measures:

**Secure Data Transmission Protocols:** All communication within the system, including data transmission between the frontend interface, backend servers, and database, could be encrypted using HTTPS (HTTP over SSL/TLS) protocols. This ensures that sensitive data exchanged over networks is protected from interception or tampering by unauthorized parties.

**Encryption Methods:** We could employ strong encryption algorithms, such as AES (Advanced Encryption Standard), to encrypt sensitive employee data and transaction records stored in our database (at rest). Additionally, SSL/TLS encryption will be utilized to encrypt data transmitted over networks (in transit), ensuring end-to-end encryption and safeguarding the confidentiality of data.

**Access Control Mechanisms:** Robust access control mechanisms, including role-based access control (RBAC) and attribute-based access control (ABAC), could be implemented to regulate access to sensitive data within the system. Only authorized users with appropriate permissions will be granted access to view or modify sensitive information, thereby preventing unauthorized access.

**Multi-Factor Authentication (MFA):** To enhance security, we could implement multi-factor authentication (MFA) mechanisms requiring users to provide multiple forms of verification before accessing the system. This includes passwords, biometrics, or one-time passcodes, adding an extra layer of security and mitigating the risk of unauthorized access.

**Intrusion Detection and Prevention Systems (IDPS):** We could deploy intrusion detection and prevention systems (IDPS) to monitor network traffic in real-time and detect suspicious activities or potential security breaches. Intrusion detection systems (IDS) will be utilized to identify unauthorized access attempts or anomalous behavior within the system, enabling prompt response and mitigation of security threats.

**Regular Security Audits and Penetration Testing:** Regular security audits and penetration testing could be conducted to identify vulnerabilities within the system and address them proactively. Various cyber threats and attacks, including SQL injection, cross-site scripting (XSS), and data breaches, will be simulated to assess the system's resilience and security posture.

**Data Masking and Anonymization:** Personally identifiable information (PII), such as employee names, addresses, and credit card numbers, will be masked or anonymized to prevent unauthorized access or disclosure. This ensures that sensitive information remains protected from identity theft or data leakage.

**Secure Backup and Disaster Recovery:** We could implement secure backup and disaster recovery procedures to ensure the availability and integrity of data in case of system failures, natural disasters, or cyber attacks. Critical data will be regularly backed up and stored in encrypted, geographically redundant locations, facilitating timely recovery and continuity of operations.

By integrating one or all of these networking and cybersecurity measures into our Employee Fraud Detection System, we aim to safeguard sensitive employee data and transaction records, ensuring confidentiality, integrity, and availability throughout the system's lifecycle.

