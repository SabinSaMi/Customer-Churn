create database Churn

use Churn


Drop table if exists CustomerChurn

CREATE TABLE CustomerChurn (
    customerID VARCHAR(50),
    gender VARCHAR(10),
    SeniorCitizen INT, -- 0 for No, 1 for Yes
    Partner VARCHAR(10), -- Yes or No
    Dependents VARCHAR(10), -- Yes or No
    tenure INT, -- Number of months the customer has stayed with the company
    PhoneService VARCHAR(10), -- Yes or No
    MultipleLines VARCHAR(20), -- Yes, No, or No phone service
    InternetService VARCHAR(20), -- DSL, Fiber optic, or No
    OnlineSecurity VARCHAR(20), -- Yes, No, or No internet service
    OnlineBackup VARCHAR(20), -- Yes, No, or No internet service
    DeviceProtection VARCHAR(20), -- Yes, No, or No internet service
    TechSupport VARCHAR(20), -- Yes, No, or No internet service
    StreamingTV VARCHAR(20), -- Yes, No, or No internet service
    StreamingMovies VARCHAR(20), -- Yes, No, or No internet service
    Contract VARCHAR(20), -- Month-to-month, One year, Two year
    PaperlessBilling VARCHAR(10), -- Yes or No
    PaymentMethod VARCHAR(50), -- Electronic check, Mailed check, Bank transfer (automatic), Credit card (automatic)
    MonthlyCharges DECIMAL(10, 2), -- Monthly charges in dollars
    TotalCharges DECIMAL(10, 2), -- Total charges in dollars
    Churn VARCHAR(10) -- Yes or No
);

--Bulk inserting the data in the table
bulk insert CustomerChurn
from 'C:\Users\cools\OneDrive\Documents\SQL Server\Churn\Telco.csv'
with (
    FORMAT = 'CSV',
    firstrow = 2,
    fieldterminator = ','    
)

select * from CustomerChurn


/*Data Cleaning */
--checking for the missing values

SELECT 
    COUNT(1) AS [Total],
    COUNT(customerID) * 1.0 / COUNT(1) AS [customerID],
    COUNT(gender) * 1.0 / COUNT(1) AS [gender],
    COUNT(SeniorCitizen) * 1.0 / COUNT(1) AS [SeniorCitizen],
    COUNT(Partner) * 1.0 / COUNT(1) AS [Partner],
    COUNT(Dependents) * 1.0 / COUNT(1) AS [Dependents],
    COUNT(tenure) * 1.0 / COUNT(1) AS [tenure],
    COUNT(PhoneService) * 1.0 / COUNT(1) AS [PhoneService],
    COUNT(MultipleLines) * 1.0 / COUNT(1) AS [MultipleLines],
    COUNT(InternetService) * 1.0 / COUNT(1) AS [InternetService],
    COUNT(OnlineSecurity) * 1.0 / COUNT(1) AS [OnlineSecurity],
    COUNT(OnlineBackup) * 1.0 / COUNT(1) AS [OnlineBackup],
    COUNT(DeviceProtection) * 1.0 / COUNT(1) AS [DeviceProtection],
    COUNT(TechSupport) * 1.0 / COUNT(1) AS [TechSupport],
    COUNT(StreamingTV) * 1.0 / COUNT(1) AS [StreamingTV],
    COUNT(StreamingMovies) * 1.0 / COUNT(1) AS [StreamingMovies],
    COUNT(Contract) * 1.0 / COUNT(1) AS [Contract],
    COUNT(PaperlessBilling) * 1.0 / COUNT(1) AS [PaperlessBilling],
    COUNT(PaymentMethod) * 1.0 / COUNT(1) AS [PaymentMethod],
    COUNT(MonthlyCharges) * 1.0 / COUNT(1) AS [MonthlyCharges],
    COUNT(TotalCharges) * 1.0 / COUNT(1) AS [TotalCharges],
    COUNT(Churn) * 1.0 / COUNT(1) AS [Churn]
FROM 
    CustomerChurn;
-- Total charges has missing values

--Checking for the NULL values
SELECT *
FROM Customerchurn
WHERE MonthlyCharges IS NULL
   OR TotalCharges IS NULL;


--Deleting NULL values from the dataset
DELETE FROM CustomerChurn
WHERE MonthlyCharges IS NULL
   OR TotalCharges IS NULL;



--  checking the outliers in numeric column
SELECT
    MIN(tenure) AS MinTenure,
    MAX(tenure) AS MaxTenure,
    AVG(tenure) AS AvgTenure,
    
    MIN(MonthlyCharges) AS MinMonthlyCharges,
    MAX(MonthlyCharges) AS MaxMonthlyCharges,
    AVG(MonthlyCharges) AS AvgMonthlyCharges,
    
    MIN(TotalCharges) AS MinTotalCharges,
    MAX(TotalCharges) AS MaxTotalCharges,
    AVG(TotalCharges) AS AvgTotalCharges
FROM 
    CustomerChurn;



