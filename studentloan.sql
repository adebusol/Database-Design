CREATE TABLE Bank(
BankNo VARCHAR(4) NOT NULL,
RoutingNo VARCHAR(6) NOT NULL,
BankName VARCHAR(255) NOT NULL,
CONSTRAINT PKBankNo PRIMARY KEY (BankNo)
);

CREATE TABLE Institution(
InstitutionNo VARCHAR(4) NOT NULL,
InstName VARCHAR(255) NOT NULL,
InstAddress VARCHAR(255) NOT NULL,
InstCity VARCHAR(255) NOT NULL,
InstState VARCHAR(2) NOT NULL,
InstZip VARCHAR(255) NOT NULL,
CONSTRAINT PKInstitutionNo PRIMARY KEY (InstitutionNo)
);
CREATE TABLE Lender(
LenderNo VARCHAR(5) NOT NULL,
LenderName VARCHAR(255) NOT NULL,
CONSTRAINT PKLenderNo PRIMARY KEY (LenderNo)
);
CREATE TABLE Guarantor(
GuarantorNo VARCHAR(4) NOT NULL,
GuarantorName VARCHAR(255) NOT NULL,
GuaranteeFee DECIMAL(38,2),
CONSTRAINT PKGuarantorNo PRIMARY KEY (GuarantorNo)
);

CREATE TABLE ServiceProvider(
ProviderNo VARCHAR(5) NOT NULL,
ProviderName VARCHAR(255) NOT NULL,
GuarantorNo VARCHAR(4),
CONSTRAINT PKProviderNo PRIMARY KEY (ProviderNo)
);

CREATE TABLE Student(
StudentNo VARCHAR(4) NOT NULL,
StudentFName VARCHAR(255) NOT NULL,
StudentLName VARCHAR(255) NOT NULL,
DOB DATE NOT NULL,
StudentPhone VARCHAR(12) NOT NULL,
StudentAddress VARCHAR(255) NOT NULL,
StudentCity VARCHAR(255) NOT NULL,
StudentState VARCHAR (2) NOT NULL,
StudentZip NUMBER(5) NOT NULL,
GradDate DATE NOT NULL,
AccountNo VARCHAR(7) NOT NULL,
LenderNo VARCHAR(5) NOT NULL,
ProviderNo VARCHAR(5) NOT NULL,
GuarantorNo VARCHAR(4) NOT NULL,
BankNo VARCHAR(5) NOT NULL,
InstitutionNo VARCHAR(4) NOT NULL,
CONSTRAINT PKStudentNo PRIMARY KEY (StudentNo),
CONSTRAINT FKBankNo FOREIGN KEY (BankNo) REFERENCES Bank,
CONSTRAINT FKInstitutionNo FOREIGN KEY (InstitutionNo) REFERENCES Institution,
CONSTRAINT FKLenderNo FOREIGN KEY (LenderNo) REFERENCES Lender,
CONSTRAINT FKProviderNo FOREIGN KEY (ProviderNo) REFERENCES ServiceProvider
);

CREATE TABLE Loan(
LoanNo VARCHAR (4) NOT NULL,
LoanRate FLOAT(38) NOT NULL,
TotalAmt DECIMAL(38,2) NOT NULL,
Subsidized CHAR(1) NOT NULL,
Balance DECIMAL(38,2) NOT NULL,
StudentNo VARCHAR (4) NOT NULL,
CONSTRAINT PKLoan PRIMARY KEY (LoanNo),
CONSTRAINT FKStudentNo FOREIGN KEY (StudentNo) REFERENCES Student
);

CREATE TABLE DisclosureLetter(
DisclosureNo VARCHAR(6) NOT NULL,
LoanNo VARCHAR (4) NOT NULL,
AmtBorrowed DECIMAL(38,2) NOT NULL,
RepaymentStart DATE NOT NULL,
NumberOfPayments NUMBER(38) NOT NULL,
FinanceCharge DECIMAL(38,2) NOT NULL,
PaymentAmt DECIMAL(38,2),
FirstDate DATE NOT NULL,
LastDate DATE NOT NULL,
DLDate DATE NOT NULL,
InterestRate FLOAT(38) NOT NULL,
CONSTRAINT PKDisclosureNo PRIMARY KEY (DisclosureNo),
CONSTRAINT FKLoanNo FOREIGN KEY (LoanNo) REFERENCES Loan
);

CREATE TABLE LoanOriginationForm(
FormNo VARCHAR(6) NOT NULL,
LoanNo VARCHAR(4) NOT NULL,
DateCompleted DATE NOT NULL,
DisbursementMethod CHAR(3),
DisbursementDate DATE NOT NULL,
DisbursementAmt DECIMAL(38,2) NOT NULL,
OriginationFee DECIMAL(38,2) NOT NULL,
CONSTRAINT PKFormNo PRIMARY KEY (FormNo),
CONSTRAINT FKLoanONo FOREIGN KEY (LoanNo) REFERENCES Loan
);

CREATE TABLE LoanActivityReport(
ReportNo VARCHAR(6) NOT NULL,
ReportDate DATE NOT NULL,
LoanNo VARCHAR(4) NOT NULL,
BegBal DECIMAL(38,2) NOT NULL,
Principal NUMBER(38) NOT NULL,
Interest DECIMAL(38,2) NOT NULL,
EndBal DECIMAL(38,2) NOT NULL,
CONSTRAINT PKReportNo PRIMARY KEY (ReportNo),
CONSTRAINT FKARLoanNo FOREIGN KEY (LoanNo) REFERENCES Loan
);

CREATE TABLE StatementOfAccount(
StatementNo VARCHAR(6) NOT NULL,
DateSent DATE NOT NULL,
AmtDue DECIMAL(38,2) NOT NULL,
DateDue DATE NOT NULL,
PaymentMethod VARCHAR(3),
AmtEnclosed DECIMAL(38,2) NOT NULL,
OutstandingBal DECIMAL(38,2) NOT NULL,
DatePaid DATE NOT NULL,
LoanNo VARCHAR(4) NOT NULL,
CONSTRAINT PKStatementNo PRIMARY KEY (StatementNo)
);

CREATE TABLE LoanStatement (
LoanStNo VARCHAR(6) NOT NULL,
StatementNo VARCHAR(6) NOT NULL,
LoanNo VARCHAR(4) NOT NULL,
CONSTRAINT PKLoanStNo PRIMARY KEY (LoanStNo),
CONSTRAINT FKStatementNo FOREIGN KEY (StatementNo) REFERENCES StatementOfAccount,
CONSTRAINT FKLSLoanNo FOREIGN KEY (LoanNo) REFERENCES Loan
);

INSERT INTO Bank(BankNo, BankName, RoutingNo)
    VALUES ('B100', 'Any Bank USA', 'R10001');
    
INSERT INTO Bank(BankNo, BankName, RoutingNo)
    VALUES ('B200', 'BankUS', 'R20002');
    
INSERT INTO Bank(BankNo, BankName, RoutingNo)
    VALUES ('B300', 'StudentBank', 'R30003');
    
INSERT INTO Bank(BankNo, BankName, RoutingNo)
    VALUES ('B400', 'Banking for Students', 'R40004');
    
INSERT INTO Bank(BankNo, BankName, RoutingNo)
    VALUES ('B500', 'US Students', 'R50005');
    
INSERT INTO Bank(BankNo, BankName, RoutingNo)
    VALUES ('B600', 'We Bank', 'R60006');
    
INSERT INTO Bank(BankNo, BankName, RoutingNo)
    VALUES ('B700', 'We Also Bank', 'R70007');
    
INSERT INTO Bank(BankNo, BankName, RoutingNo)
    VALUES ('B800', 'Banking and Loans', 'R80008');
    
INSERT INTO Bank(BankNo, BankName, RoutingNo)
    VALUES ('B900', 'Loans for U', 'R90009');
    
INSERT INTO Bank(BankNo, BankName, RoutingNo)
    VALUES ('B000', 'Banking Experts', 'R00000');
    
INSERT INTO Institution(InstitutionNo, InstCity, InstState, InstZip, InstAddress, InstName)
    VALUES ('U100', 'Denver', 'CO', '80217','1250 14th Street, Suite 700', 'University of Colorado');
    
INSERT INTO Institution(InstitutionNo, InstCity, InstState, InstZip, InstAddress, InstName)
    VALUES ('U200', 'Lafayette', 'LA', '70504','104 E University Ave', 'University of Louisiana');
    
INSERT INTO Institution(InstitutionNo, InstCity, InstState, InstZip, InstAddress, InstName)
    VALUES ('U300', 'Baton Rouge', 'LA', '70802','3357 Highland Road', 'Louisiana State University');
    
INSERT INTO Institution(InstitutionNo, InstCity, InstState, InstZip, InstAddress, InstName)
    VALUES ('U400', 'Broussard', 'LA', '70502','3453 College Road', 'Broussard University');
    
INSERT INTO Institution(InstitutionNo, InstCity, InstState, InstZip, InstAddress, InstName)
    VALUES ('U500', 'Test Town', 'WA', '60802','3557 Test Road', 'Test University');
    
INSERT INTO Institution(InstitutionNo, InstCity, InstState, InstZip, InstAddress, InstName)
    VALUES ('U600', 'Sample', 'WA', '60102','2657 Sample Road', 'Sample State University');
    
INSERT INTO Institution(InstitutionNo, InstCity, InstState, InstZip, InstAddress, InstName)
    VALUES ('U700', 'Entry', 'LA', '70902','3357 Entry Lane', 'Entry University');
    
INSERT INTO Institution(InstitutionNo, InstCity, InstState, InstZip, InstAddress, InstName)
    VALUES ('U800', 'Eight', 'LA', '70882','8888 Test Road', 'Eight University');
       
INSERT INTO Institution(InstitutionNo, InstCity, InstState, InstZip, InstAddress, InstName)
    VALUES ('U900', 'School', 'LA', '74602','7798 School Road', 'School University');
    
INSERT INTO Institution(InstitutionNo, InstCity, InstState, InstZip, InstAddress, InstName)
    VALUES ('U000', 'Delcambre', 'LA', '70742','3357 Delcambre Road', 'Delcambre University');
       
INSERT INTO Lender(LenderNo, LenderName)
    VALUES('LE100', 'AnyLend');
    
INSERT INTO Lender(LenderNo, LenderName)
    VALUES('LE200', 'USA Lending');
    
INSERT INTO Lender(LenderNo, LenderName)
    VALUES('LE300', 'Student Lending');
    
INSERT INTO Lender(LenderNo, LenderName)
    VALUES('LE400', 'Money Lending');
    
INSERT INTO Lender(LenderNo, LenderName)
    VALUES('LE500', 'Lending Loans');
    
INSERT INTO Lender(LenderNo, LenderName)
    VALUES('LE600', 'Loaning Things');
    
INSERT INTO Lender(LenderNo, LenderName)
    VALUES('LE700', 'Lending for U');
    
INSERT INTO Lender(LenderNo, LenderName)
    VALUES('LE800', 'Money for Students');
    
INSERT INTO Lender(LenderNo, LenderName)
    VALUES('LE900', 'Test Lending');
    
INSERT INTO Lender(LenderNo, LenderName)
    VALUES('LE000', 'Sample Lending');
    
INSERT INTO Guarantor(GuarantorNo, GuarantorName, GuaranteeFee)
    VALUES('G100', 'Any Guarantor', '100.00');
    
INSERT INTO Guarantor(GuarantorNo, GuarantorName, GuaranteeFee)
    VALUES('G200', 'Guarantee USA', '100.00');
    
INSERT INTO Guarantor(GuarantorNo, GuarantorName, GuaranteeFee)
    VALUES('G300', 'Student Guarantee', '100.00');
    
INSERT INTO Guarantor(GuarantorNo, GuarantorName, GuaranteeFee)
    VALUES('G400', 'Loan Guarantee', '100.00');

INSERT INTO Guarantor(GuarantorNo, GuarantorName, GuaranteeFee)
    VALUES('G500', 'Sample Guarantee', '170.00');
    
INSERT INTO Guarantor(GuarantorNo, GuarantorName, GuaranteeFee)
    VALUES('G600', 'We Guarantee', '150.00');
    
INSERT INTO Guarantor(GuarantorNo, GuarantorName, GuaranteeFee)
    VALUES('G700', 'Guarantee for U', '100.00');
    
INSERT INTO Guarantor(GuarantorNo, GuarantorName, GuaranteeFee)
    VALUES('G800', 'Money Guaranteed', '110.00');
    
INSERT INTO Guarantor(GuarantorNo, GuarantorName, GuaranteeFee)
    VALUES('G900', 'Guarantor Inc', '100.20');
    
INSERT INTO Guarantor(GuarantorNo, GuarantorName, GuaranteeFee)
    VALUES('G000', 'Guaranteed Money', '100.00');
    
INSERT INTO ServiceProvider(ProviderNo, ProviderName, GuarantorNo)
    VALUES('SP100', 'Any Provider', 'G300');

INSERT INTO ServiceProvider(ProviderNo, ProviderName, GuarantorNo)
    VALUES('SP200', 'Student Providers', 'G100');
    
INSERT INTO ServiceProvider(ProviderNo, ProviderName, GuarantorNo)
    VALUES('SP300', 'Provider USA', 'G200');
    
INSERT INTO ServiceProvider(ProviderNo, ProviderName, GuarantorNo)
    VALUES('SP400', 'Providing Loans', 'G400');
    
INSERT INTO ServiceProvider(ProviderNo, ProviderName, GuarantorNo)
    VALUES('SP500', 'Provider of Money', 'G900');
    
INSERT INTO ServiceProvider(ProviderNo, ProviderName, GuarantorNo)
    VALUES('SP600', 'Provider for U', 'G200');
    
INSERT INTO ServiceProvider(ProviderNo, ProviderName, GuarantorNo)
    VALUES('SP700', 'USA Providing', 'G700');
    
INSERT INTO ServiceProvider(ProviderNo, ProviderName, GuarantorNo)
    VALUES('SP800', 'Loan Provider', 'G500');
    
INSERT INTO ServiceProvider(ProviderNo, ProviderName, GuarantorNo)
    VALUES('SP900', 'Provider For USA', 'G200');
    
INSERT INTO ServiceProvider(ProviderNo, ProviderName, GuarantorNo)
    VALUES('SP000', 'Provider Test', 'G100');

INSERT INTO Student(StudentFName, StudentLName, StudentNo, StudentAddress, StudentCity,
StudentState, StudentZip, StudentPhone, DOB, GradDate, BankNo, InstitutionNo, LenderNo, ProviderNo,
AccountNo, GuarantorNo)
    VALUES('Sam', 'Student', 'S100', '15400 Any Street', 'Anytown', 'CA', '00999', '341-555-2222'
    , '11-NOV-1978', '05-MAY-1998', 'B100', 'U100', 'LE100', 'SP100', 'A111000', 'G100'); 
    
INSERT INTO Student(StudentFName, StudentLName, StudentNo, StudentAddress, StudentCity,
StudentState, StudentZip, StudentPhone, DOB, GradDate, BankNo, InstitutionNo, LenderNo, ProviderNo,
AccountNo, GuarantorNo)
    VALUES('John', 'Doe', 'S200', '1279 Student Street', 'Hills', 'CO', '71984', '331-525-1522'
    , '14-FEB-1999', '05-MAY-2020', 'B300', 'U300', 'LE300', 'SP100', 'A222000', 'G200'); 
    
INSERT INTO Student(StudentFName, StudentLName, StudentNo, StudentAddress, StudentCity,
StudentState, StudentZip, StudentPhone, DOB, GradDate, BankNo, InstitutionNo, LenderNo, ProviderNo,
AccountNo, GuarantorNo)
    VALUES('Jane', 'Doe', 'S300', '1279 Student Street', 'Hills', 'CO', '71984', '331-525-3312'
    , '18-MAR-2000', '05-MAY-2021', 'B300', 'U200', 'LE100', 'SP300', 'A333000', 'G300');
    
INSERT INTO Student(StudentFName, StudentLName, StudentNo, StudentAddress, StudentCity,
StudentState, StudentZip, StudentPhone, DOB, GradDate, BankNo, InstitutionNo, LenderNo, ProviderNo,
AccountNo, GuarantorNo)
    VALUES('Jack', 'Student', 'S400', '17936 University Avenue', 'Lafayette', 'LA', '70504', '333-729-2882'
    , '11-MAY-1978', '05-MAY-1998', 'B200', 'U200', 'LE200', 'SP200', 'A444000', 'G100'); 
    
INSERT INTO Student(StudentFName, StudentLName, StudentNo, StudentAddress, StudentCity,
StudentState, StudentZip, StudentPhone, DOB, GradDate, BankNo, InstitutionNo, LenderNo, ProviderNo,
AccountNo, GuarantorNo)
    VALUES('Simone', 'Doe', 'S500', '1573 Student Road', 'Baton Rouge', 'LA', '70802', '331-545-7832'
    , '11-NOV-1988', '05-MAY-1999', 'B300', 'U300', 'LE100', 'SP200','A555000','G200'); 
    
INSERT INTO Student(StudentFName, StudentLName, StudentNo, StudentAddress, StudentCity,
StudentState, StudentZip, StudentPhone, DOB, GradDate, BankNo, InstitutionNo, LenderNo, ProviderNo,
AccountNo, GuarantorNo)
    VALUES('Taylor', 'Student', 'S600', '1543 University Drive', 'Anytown', 'LA', '00929', '321-573-2222'
    , '15-DEC-1978', '05-MAY-1998', 'B200', 'U200', 'LE300', 'SP100','A666000','G300');
    
INSERT INTO Student(StudentFName, StudentLName, StudentNo, StudentAddress, StudentCity,
StudentState, StudentZip, StudentPhone, DOB, GradDate, BankNo, InstitutionNo, LenderNo, ProviderNo,
AccountNo, GuarantorNo)
    VALUES('Sam', 'Doe', 'S700', '1234 Any Street', 'Studenttown', 'LA', '70802', '331-546-8902'
    , '11-NOV-1978', '05-MAY-1998', 'B300', 'U300', 'LE100', 'SP300','A777000', 'G100');
    
INSERT INTO Student(StudentFName, StudentLName, StudentNo, StudentAddress, StudentCity,
StudentState, StudentZip, StudentPhone, DOB, GradDate, BankNo, InstitutionNo, LenderNo, ProviderNo,
AccountNo, GuarantorNo)
    VALUES('Miles', 'Morales', 'S800', '15430 AnyStreet', 'Anytown', 'CO', '06799', '241-355-9012'
    , '11-DEC-1978', '05-MAY-1998', 'B200', 'U100', 'LE300', 'SP200', 'A888000', 'G200');
    
INSERT INTO Student(StudentFName, StudentLName, StudentNo, StudentAddress, StudentCity,
StudentState, StudentZip, StudentPhone, DOB, GradDate, BankNo, InstitutionNo, LenderNo, ProviderNo,
AccountNo, GuarantorNo)
    VALUES('Gwen', 'Stacy', 'S900', '15420 Student Street', 'Anytown', 'LA', '70503', '337-521-3322'
    , '12-JAN-1978', '05-MAY-1998', 'B200', 'U300', 'LE300', 'SP200', 'A999000', 'G300');
    
INSERT INTO Student(StudentFName, StudentLName, StudentNo, StudentAddress, StudentCity,
StudentState, StudentZip, StudentPhone, DOB, GradDate, BankNo, InstitutionNo, LenderNo, ProviderNo,
AccountNo, GuarantorNo)
    VALUES('Spider', 'Noir', 'S000', '15410 Student Street', 'Anytown', 'LA', '70503', '337-581-3652'
    , '12-JAN-1990', '05-MAY-1998', 'B100', 'U000', 'LE300', 'SP300', 'A000000', 'G300'); 
    
INSERT INTO Student(StudentFName, StudentLName, StudentNo, StudentAddress, StudentCity,
StudentState, StudentZip, StudentPhone, DOB, GradDate, BankNo, InstitutionNo, LenderNo, ProviderNo,
AccountNo, GuarantorNo)
    VALUES('Peter', 'Parker', 'S010', '1253 University Ave', 'Lafayette', 'LA', '70503', '335-541-1472'
    , '21-AUG-1999', '05-MAY-2024', 'B300', 'U700', 'LE800', 'SP300', 'A000111', 'G300'); 

INSERT INTO Student(StudentFName, StudentLName, StudentNo, StudentAddress, StudentCity,
StudentState, StudentZip, StudentPhone, DOB, GradDate, BankNo, InstitutionNo, LenderNo, ProviderNo,
AccountNo, GuarantorNo)
    VALUES('Mary', 'Jane', 'S020', '1825 Any Street', 'Lafayette', 'LA', '70503', '335-845-1462'
    , '21-AUG-2000', '05-MAY-2023', 'B900', 'U400', 'LE600', 'SP800', 'A000222', 'G800'); 

INSERT INTO Student(StudentFName, StudentLName, StudentNo, StudentAddress, StudentCity,
StudentState, StudentZip, StudentPhone, DOB, GradDate, BankNo, InstitutionNo, LenderNo, ProviderNo,
AccountNo, GuarantorNo)
    VALUES('Otto', 'Octavius', 'S030', '1215 Any Street', 'Lafayette', 'LA', '70503', '335-635-1922'
    , '21-AUG-1998', '05-MAY-2019', 'B000', 'U900', 'LE500', 'SP400', 'A000333', 'G700'); 

INSERT INTO Student(StudentFName, StudentLName, StudentNo, StudentAddress, StudentCity,
StudentState, StudentZip, StudentPhone, DOB, GradDate, BankNo, InstitutionNo, LenderNo, ProviderNo,
AccountNo, GuarantorNo)
    VALUES('Ben', 'Reilly', 'S040', '1115 Any Street', 'Lafayette', 'LA', '70503', '335-735-1922'
    , '21-AUG-1999', '05-MAY-2020', 'B600', 'U000', 'LE000', 'SP000', 'A000444', 'G000');

INSERT INTO Student(StudentFName, StudentLName, StudentNo, StudentAddress, StudentCity,
StudentState, StudentZip, StudentPhone, DOB, GradDate, BankNo, InstitutionNo, LenderNo, ProviderNo,
AccountNo, GuarantorNo)
    VALUES('Norman', 'Osbourne', 'S050', '1215 Any Street', 'Lafayette', 'LA', '70503', '335-735-1452'
    , '31-OCT-2000', '05-MAY-2023', 'B000', 'U600', 'LE500', 'SP900', 'A000555', 'G800');
    
INSERT INTO Student(StudentFName, StudentLName, StudentNo, StudentAddress, StudentCity,
StudentState, StudentZip, StudentPhone, DOB, GradDate, BankNo, InstitutionNo, LenderNo, ProviderNo,
AccountNo, GuarantorNo)
    VALUES('Wanda', 'Maximoff', 'S060', '1325 Student Street', 'Hills', 'CO', '50430', '225-365-1452'
    , '31-OCT-2000', '05-MAY-2023', 'B600', 'U000', 'LE000', 'SP000', 'A000666', 'G000'); 
    
INSERT INTO Student(StudentFName, StudentLName, StudentNo, StudentAddress, StudentCity,
StudentState, StudentZip, StudentPhone, DOB, GradDate, BankNo, InstitutionNo, LenderNo, ProviderNo,
AccountNo, GuarantorNo)
    VALUES('Steve', 'Rogers', 'S070', '1675 Student Street', 'Hills', 'CO', '50430', '225-872-6252'
    , '14-NOV-2000', '05-MAY-2023', 'B300', 'U700', 'LE500', 'SP800', 'A000777', 'G900');    

INSERT INTO Student(StudentFName, StudentLName, StudentNo, StudentAddress, StudentCity,
StudentState, StudentZip, StudentPhone, DOB, GradDate, BankNo, InstitutionNo, LenderNo, ProviderNo,
AccountNo, GuarantorNo)
    VALUES('Anthony', 'Stark', 'S080', '1255 Student Street', 'Hills', 'CO', '50430', '225-112-8352'
    , '21-MAY-2000', '05-MAY-2023', 'B700', 'U800', 'LE600', 'SP900', 'A000888', 'G800');
    
INSERT INTO Student(StudentFName, StudentLName, StudentNo, StudentAddress, StudentCity,
StudentState, StudentZip, StudentPhone, DOB, GradDate, BankNo, InstitutionNo, LenderNo, ProviderNo,
AccountNo, GuarantorNo)
    VALUES('Natasha', 'Romanoff', 'S090', '1145 Student Street', 'Hills', 'CO', '50430', '225-312-9052'
    , '14-SEP-1999', '05-MAY-2022', 'B900', 'U500', 'LE700', 'SP000', 'A000999', 'G000');    

INSERT INTO Student(StudentFName, StudentLName, StudentNo, StudentAddress, StudentCity,
StudentState, StudentZip, StudentPhone, DOB, GradDate, BankNo, InstitutionNo, LenderNo, ProviderNo,
AccountNo, GuarantorNo)
    VALUES('Sam', 'Wilson', 'S111', '1145 Student Street', 'Hills', 'CO', '50430', '225-002-0052'
    , '07-JAN-2000', '05-MAY-2024', 'B300', 'U200', 'LE800', 'SP900', 'A111111', 'G600');

INSERT INTO Loan(Balance, LoanNo, LoanRate, StudentNo, Subsidized,
TotalAmt)
    VALUES('10000.00', 'L100', '8.5', 'S100', 'N', '31000.00');

INSERT INTO Loan(Balance, LoanNo, LoanRate, StudentNo, Subsidized,
TotalAmt)
    VALUES('13000.00', 'L200', '6.5', 'S200', 'Y', '26000.00');
    
    INSERT INTO Loan(Balance, LoanNo, LoanRate, StudentNo, Subsidized,
TotalAmt)
    VALUES('26000.00', 'L300', '6.5', 'S300', 'N', '26000.00');
    
INSERT INTO Loan(Balance, LoanNo, LoanRate, StudentNo, Subsidized,
TotalAmt)
    VALUES('15000.00', 'L400', '7.2', 'S400', 'N', '32000.00');

INSERT INTO Loan(Balance, LoanNo, LoanRate, StudentNo, Subsidized,
TotalAmt)
    VALUES('13000.00', 'L500', '8.3', 'S500', 'Y', '26000.00');
    
INSERT INTO Loan(Balance, LoanNo, LoanRate, StudentNo, Subsidized,
TotalAmt)
    VALUES('15000.00', 'L510', '7.3', 'S500', 'N', '18000.00');    
    
INSERT INTO Loan(Balance, LoanNo, LoanRate, StudentNo, Subsidized,
TotalAmt)
    VALUES('12000.00', 'L600', '6.5', 'S600', 'N', '28000.00');

INSERT INTO Loan(Balance, LoanNo, LoanRate, StudentNo, Subsidized,
TotalAmt)
    VALUES('20000.00', 'L700', '5.5', 'S700', 'N', '26000.00');
    
INSERT INTO Loan(Balance, LoanNo, LoanRate, StudentNo, Subsidized,
TotalAmt)
    VALUES('13000.00', 'L800', '6.5', 'S800', 'Y', '26000.00');

INSERT INTO Loan(Balance, LoanNo, LoanRate, StudentNo, Subsidized,
TotalAmt)
    VALUES('15000.00', 'L900', '6.5', 'S900', 'Y', '26000.00');
   
INSERT INTO Loan(Balance, LoanNo, LoanRate, StudentNo, Subsidized,
TotalAmt)
    VALUES('15000.00', 'L000', '5.5', 'S000', 'N', '21000.17');   
    
INSERT INTO Loan(Balance, LoanNo, LoanRate, StudentNo, Subsidized,
TotalAmt)
    VALUES('13000.00', 'L010', '7.5', 'S010', 'N', '21050.00');
    
INSERT INTO Loan(Balance, LoanNo, LoanRate, StudentNo, Subsidized,
TotalAmt)
    VALUES('17000.00', 'L020', '5.5', 'S020', 'N', '24000.00');  
    
INSERT INTO Loan(Balance, LoanNo, LoanRate, StudentNo, Subsidized,
TotalAmt)
    VALUES('14000.00', 'L030', '6.5', 'S030', 'Y', '18000.00');     
    
INSERT INTO Loan(Balance, LoanNo, LoanRate, StudentNo, Subsidized,
TotalAmt)
    VALUES('12000.00', 'L031', '5.5', 'S030', 'N', '12000.00'); 
    
INSERT INTO Loan(Balance, LoanNo, LoanRate, StudentNo, Subsidized,
TotalAmt)
    VALUES('28000.00', 'L040', '7.5', 'S040', 'Y', '30000.00');     
  
INSERT INTO Loan(Balance, LoanNo, LoanRate, StudentNo, Subsidized,
TotalAmt)
    VALUES('22000.00', 'L050', '6.5', 'S050', 'Y', '26000.00');    
    
INSERT INTO Loan(Balance, LoanNo, LoanRate, StudentNo, Subsidized,
TotalAmt)
    VALUES('20000.00', 'L060', '5.5', 'S060', 'N', '25000.00'); 
    
INSERT INTO Loan(Balance, LoanNo, LoanRate, StudentNo, Subsidized,
TotalAmt)
    VALUES('190050.00', 'L070', '7.5', 'S070', 'N', '28000.00');  
    
INSERT INTO Loan(Balance, LoanNo, LoanRate, StudentNo, Subsidized,
TotalAmt)
    VALUES('130000.00', 'L080', '6.5', 'S080', 'Y', '22000.00');   
    
INSERT INTO Loan(Balance, LoanNo, LoanRate, StudentNo, Subsidized,
TotalAmt)
    VALUES('110000.00', 'L090', '6.5', 'S090', 'Y', '20000.00');   
    
INSERT INTO Loan(Balance, LoanNo, LoanRate, StudentNo, Subsidized,
TotalAmt)
    VALUES('140000.00', 'L111', '5.5', 'S111', 'N', '24000.00');      

INSERT INTO LoanActivityReport(BegBal, EndBal, LoanNo, Interest, Principal, ReportDate, ReportNo)
    VALUES('10000.00', '9839.40', 'L100','211.37', '160.00', '01-FEB-1999', 'LAR100');
    
INSERT INTO LoanActivityReport(BegBal, EndBal, LoanNo, Interest, Principal, ReportDate, ReportNo)
    VALUES('12000.00', '9230.42', 'L200','201.37', '160.20', '01-FEB-2000', 'LAR200');
    
INSERT INTO LoanActivityReport(BegBal, EndBal, LoanNo, Interest, Principal, ReportDate, ReportNo)
    VALUES('18000.00', '7539.00', 'L300','211.37', '160.00', '01-MAR-2001', 'LAR300');
    
INSERT INTO LoanActivityReport(BegBal, EndBal, LoanNo, Interest, Principal, ReportDate, ReportNo)
    VALUES('16000.00', '9039.40', 'L400','211.37', '160.00', '01-JAN-1999', 'LAR400');
    
INSERT INTO LoanActivityReport(BegBal, EndBal, LoanNo, Interest, Principal, ReportDate, ReportNo)
    VALUES('18070.00', '9839.40', 'L500','211.37', '160.00', '01-MAY-2020', 'LAR500');
 
INSERT INTO LoanActivityReport(BegBal, EndBal, LoanNo, Interest, Principal, ReportDate, ReportNo)
    VALUES('14000.00', '3439.40', 'L510','211.37', '160.00', '03-MAY-2020', 'LAR510');
    
INSERT INTO LoanActivityReport(BegBal, EndBal, LoanNo, Interest, Principal, ReportDate, ReportNo)
    VALUES('10000.00', '9839.40', 'L600','211.37', '160.00', '01-MAR-2022', 'LAR600');
    
INSERT INTO LoanActivityReport(BegBal, EndBal, LoanNo, Interest, Principal, ReportDate, ReportNo)
    VALUES('1500.00', '9429.40', 'L700','211.37', '160.00', '01-DEC-2022', 'LAR700');
    
INSERT INTO LoanActivityReport(BegBal, EndBal, LoanNo, Interest, Principal, ReportDate, ReportNo)
    VALUES('1800.00', '9009.40', 'L800','211.37', '160.00', '01-DEC-2022', 'LAR800');
    
INSERT INTO LoanActivityReport(BegBal, EndBal, LoanNo, Interest, Principal, ReportDate, ReportNo)
    VALUES('1400.00', '9509.40', 'L900','211.37', '160.00', '15-JAN-2021', 'LAR900');
    
INSERT INTO LoanActivityReport(BegBal, EndBal, LoanNo, Interest, Principal, ReportDate, ReportNo)
    VALUES('1400.00', '9509.40', 'L000','211.37', '170.00', '15-JAN-2020', 'LAR000');    
 
INSERT INTO LoanActivityReport(BegBal, EndBal, LoanNo, Interest, Principal, ReportDate, ReportNo)
    VALUES('1300.00', '5009.40', 'L010','210.50', '130.00', '15-JAN-2024', 'LAR010');
  
INSERT INTO LoanActivityReport(BegBal, EndBal, LoanNo, Interest, Principal, ReportDate, ReportNo)
    VALUES('1300.00', '5009.40', 'L010','210.50', '130.00', '15-JAN-2025', 'LAR011');  
    
INSERT INTO LoanActivityReport(BegBal, EndBal, LoanNo, Interest, Principal, ReportDate, ReportNo)
    VALUES('1600.00', '5009.40', 'L030','210.50', '140.00', '15-JAN-2020', 'LAR030');
    
INSERT INTO LoanActivityReport(BegBal, EndBal, LoanNo, Interest, Principal, ReportDate, ReportNo)
    VALUES('1400.00', '5009.40', 'L031','210.50', '140.00', '15-JAN-2023', 'LAR031'); 
    
INSERT INTO LoanActivityReport(BegBal, EndBal, LoanNo, Interest, Principal, ReportDate, ReportNo)
    VALUES('1600.00', '5009.40', 'L030','210.50', '140.00', '15-JAN-2020', 'LAR030');
    
INSERT INTO LoanActivityReport(BegBal, EndBal, LoanNo, Interest, Principal, ReportDate, ReportNo)
    VALUES('2000.00', '5509.00', 'L040','210.50', '150.00', '15-JAN-2020', 'LAR040');     

INSERT INTO LoanActivityReport(BegBal, EndBal, LoanNo, Interest, Principal, ReportDate, ReportNo)
    VALUES('2200.00', '5509.00', 'L050','210.50', '150.00', '15-JAN-2024', 'LAR050'); 
   
INSERT INTO LoanActivityReport(BegBal, EndBal, LoanNo, Interest, Principal, ReportDate, ReportNo)
    VALUES('2000.00', '5200.00', 'L060','210.00', '140.00', '15-MAR-2023', 'LAR060'); 
 
INSERT INTO LoanActivityReport(BegBal, EndBal, LoanNo, Interest, Principal, ReportDate, ReportNo)
    VALUES('2000.00', '5200.00', 'L060','210.00', '140.00', '15-MAR-2024', 'LAR061');  
    
INSERT INTO LoanActivityReport(BegBal, EndBal, LoanNo, Interest, Principal, ReportDate, ReportNo)
    VALUES('2500.00', '5700.00', 'L070','210.00', '170.15', '15-MAR-2024', 'LAR070');    
   
INSERT INTO LoanActivityReport(BegBal, EndBal, LoanNo, Interest, Principal, ReportDate, ReportNo)
    VALUES('2200.00', '4300.00', 'L080','210.00', '170.15', '15-OCT-2024', 'LAR080');   
 
INSERT INTO LoanActivityReport(BegBal, EndBal, LoanNo, Interest, Principal, ReportDate, ReportNo)
    VALUES('2000.00', '3900.00', 'L090','230.00', '150.10', '15-OCT-2025', 'LAR090');  
 
INSERT INTO LoanActivityReport(BegBal, EndBal, LoanNo, Interest, Principal, ReportDate, ReportNo)
    VALUES('2000.00', '3900.00', 'L090','230.00', '150.10', '15-OCT-2026', 'LAR091'); 
 
INSERT INTO LoanActivityReport(BegBal, EndBal, LoanNo, Interest, Principal, ReportDate, ReportNo)
    VALUES('2400.00', '4000.00', 'L111','240.00', '130.10', '13-NOV-2025', 'LAR111');   
   
INSERT INTO DisclosureLetter(DLDate, LoanNo, RepaymentStart, AmtBorrowed,
NumberOfPayments, InterestRate, FinanceCharge, FirstDate, PaymentAmt, LastDate, DisclosureNo)
    VALUES('01-JUL-1998', 'L100','01-SEP-1999', '10000', '120', '8.5', '4877.96', 
    '01-OCT-1998', '246.37', '01-SEP-2008', 'DL100');

INSERT INTO DisclosureLetter(DLDate, LoanNo, RepaymentStart, AmtBorrowed,
NumberOfPayments, InterestRate, FinanceCharge, FirstDate, PaymentAmt, LastDate, DisclosureNo)
    VALUES('01-JUL-2020', 'L200','01-SEP-2020', '15000', '125', '6.5', '4825.96', 
    '01-OCT-2020', '246.37', '01-SEP-2030', 'DL200');
    
INSERT INTO DisclosureLetter(DLDate, LoanNo, RepaymentStart, AmtBorrowed,
NumberOfPayments, InterestRate, FinanceCharge, FirstDate, PaymentAmt, LastDate, DisclosureNo)
    VALUES('01-JUL-2021', 'L300', '01-SEP-2021', '12000', '120', '6.5', '4877.96', 
    '01-OCT-2021', '246.37', '01-SEP-2031', 'DL300'); 
    
INSERT INTO DisclosureLetter(DLDate, LoanNo, RepaymentStart, AmtBorrowed,
NumberOfPayments, InterestRate, FinanceCharge, FirstDate, PaymentAmt, LastDate, DisclosureNo)
    VALUES('01-JUL-1998', 'L400', '01-SEP-1998', '13000', '120', '7.2', '4837.96', 
    '01-OCT-1998', '246.37', '01-SEP-2008', 'DL400');

INSERT INTO DisclosureLetter(DLDate, LoanNo, RepaymentStart, AmtBorrowed,
NumberOfPayments, InterestRate, FinanceCharge, FirstDate, PaymentAmt, LastDate, DisclosureNo)
    VALUES('01-JUL-1999', 'L500', '01-SEP-1999', '20000', '125', '8.3', '4877.96', 
    '01-OCT-1999', '246.37', '01-SEP-2009', 'DL500');
    
INSERT INTO DisclosureLetter(DLDate, LoanNo, RepaymentStart, AmtBorrowed,
NumberOfPayments, InterestRate, FinanceCharge, FirstDate, PaymentAmt, LastDate, DisclosureNo)
    VALUES('01-JUL-2000', 'L510', '01-SEP-2000', '18000', '123', '7.3', '3277.96', 
    '01-OCT-2000', '246.37', '01-SEP-2010', 'DL510');    
    
INSERT INTO DisclosureLetter(DLDate, LoanNo, RepaymentStart, AmtBorrowed,
NumberOfPayments, InterestRate, FinanceCharge, FirstDate, PaymentAmt, LastDate, DisclosureNo)
    VALUES('01-JUL-1998', 'L600', '01-SEP-1998', '12000', '122', '6.5', '4427.96', 
    '01-OCT-1998', '246.37', '01-SEP-2008', 'DL600');
    
INSERT INTO DisclosureLetter(DLDate, LoanNo, RepaymentStart, AmtBorrowed,
NumberOfPayments, InterestRate, FinanceCharge, FirstDate, PaymentAmt, LastDate, DisclosureNo)
    VALUES('01-JUL-1998', 'L700', '01-SEP-1999', '19000', '130', '5.5', '4027.93', 
    '01-OCT-1998', '246.37', '01-SEP-2010', 'DL700');
    
INSERT INTO DisclosureLetter(DLDate, LoanNo, RepaymentStart, AmtBorrowed,
NumberOfPayments, InterestRate, FinanceCharge, FirstDate, PaymentAmt, LastDate, DisclosureNo)
    VALUES('01-JUL-1998', 'L800', '01-SEP-1999', '13000', '123', '6.5', '4877.96', 
    '01-OCT-1998', '206.12', '01-SEP-2008', 'DL800');
    
INSERT INTO DisclosureLetter(DLDate, LoanNo, RepaymentStart, AmtBorrowed,
NumberOfPayments, InterestRate, FinanceCharge, FirstDate, PaymentAmt, LastDate, DisclosureNo)
    VALUES('01-JUL-1998', 'L900', '01-SEP-1999', '15030', '130', '6.5', '4877.96', 
    '01-OCT-1998', '246.37', '01-SEP-2008', 'DL900');
    
INSERT INTO DisclosureLetter(DLDate, LoanNo, RepaymentStart, AmtBorrowed,
NumberOfPayments, InterestRate, FinanceCharge, FirstDate, PaymentAmt, LastDate, DisclosureNo)
    VALUES('01-JUL-2020', 'L000', '01-SEP-2020', '1702.50', '140', '6.5', '4877.96', 
    '01-OCT-2020', '246.37', '01-SEP-2020', 'DL000'); 

INSERT INTO DisclosureLetter(DLDate, LoanNo, RepaymentStart, AmtBorrowed,
NumberOfPayments, InterestRate, FinanceCharge, FirstDate, PaymentAmt, LastDate, DisclosureNo)
    VALUES('01-JUL-2021', 'L010','01-SEP-2021', '21050', '122', '7.5', '1300.96', 
    '01-OCT-2021', '246.37', '01-SEP-2031', 'DL010');    
    
INSERT INTO DisclosureLetter(DLDate, LoanNo, RepaymentStart, AmtBorrowed,
NumberOfPayments, InterestRate, FinanceCharge, FirstDate, PaymentAmt, LastDate, DisclosureNo)
    VALUES('01-JUL-2023', 'L020','01-SEP-2023', '21053', '130', '7.5', '1300.96', 
    '01-OCT-2023', '250.00', '01-SEP-2033', 'DL020'); 
    
INSERT INTO DisclosureLetter(DLDate, LoanNo, RepaymentStart, AmtBorrowed,
NumberOfPayments, InterestRate, FinanceCharge, FirstDate, PaymentAmt, LastDate, DisclosureNo)
    VALUES('01-JUL-2023', 'L030','01-SEP-2023', '21053', '130', '7.5', '1300.96', 
    '01-OCT-2023', '250.00', '01-SEP-2033', 'DL030');     
    
INSERT INTO DisclosureLetter(DLDate, LoanNo, RepaymentStart, AmtBorrowed,
NumberOfPayments, InterestRate, FinanceCharge, FirstDate, PaymentAmt, LastDate, DisclosureNo)
    VALUES('01-JUL-2023', 'L031','01-SEP-2023', '21053', '130', '7.5', '1300.96', 
    '01-OCT-2023', '250.00', '01-SEP-2033', 'DL031');   
    
INSERT INTO DisclosureLetter(DLDate, LoanNo, RepaymentStart, AmtBorrowed,
NumberOfPayments, InterestRate, FinanceCharge, FirstDate, PaymentAmt, LastDate, DisclosureNo)
    VALUES('01-JUL-2021', 'L040','01-SEP-2021', '23100', '130', '7.5', '1300.96', 
    '01-OCT-2021', '250.00', '01-SEP-2033', 'DL040'); 
    
INSERT INTO DisclosureLetter(DLDate, LoanNo, RepaymentStart, AmtBorrowed,
NumberOfPayments, InterestRate, FinanceCharge, FirstDate, PaymentAmt, LastDate, DisclosureNo)
    VALUES('01-JUL-2024', 'L050','01-SEP-2024', '24000', '130', '6.5', '1300.96', 
    '01-OCT-2024', '250.00', '01-SEP-2034', 'DL050');    
 
INSERT INTO DisclosureLetter(DLDate, LoanNo, RepaymentStart, AmtBorrowed,
NumberOfPayments, InterestRate, FinanceCharge, FirstDate, PaymentAmt, LastDate, DisclosureNo)
    VALUES('01-JAN-2023', 'L060','01-NOV-2023', '23000', '130', '5.5', '1200.96', 
    '01-OCT-2023', '250.00', '01-DEC-2033', 'DL060'); 
    
INSERT INTO DisclosureLetter(DLDate, LoanNo, RepaymentStart, AmtBorrowed,
NumberOfPayments, InterestRate, FinanceCharge, FirstDate, PaymentAmt, LastDate, DisclosureNo)
    VALUES('01-JAN-2025', 'L070','01-NOV-2025', '25000', '130', '7.5', '1100.50', 
    '01-OCT-2025', '270.00', '01-DEC-2035', 'DL070');     
    
INSERT INTO DisclosureLetter(DLDate, LoanNo, RepaymentStart, AmtBorrowed,
NumberOfPayments, InterestRate, FinanceCharge, FirstDate, PaymentAmt, LastDate, DisclosureNo)
    VALUES('05-JAN-2023', 'L080','01-NOV-2023', '22000', '130', '6.5', '1300.30', 
    '01-OCT-2024', '230.00', '01-DEC-2034', 'DL080');    
    
INSERT INTO DisclosureLetter(DLDate, LoanNo, RepaymentStart, AmtBorrowed,
NumberOfPayments, InterestRate, FinanceCharge, FirstDate, PaymentAmt, LastDate, DisclosureNo)
    VALUES('10-JAN-2024', 'L090','01-NOV-2024', '20000', '127', '6.5', '1200.00', 
    '01-OCT-2024', '250.00', '01-OCT-2034', 'DL090'); 
    
INSERT INTO DisclosureLetter(DLDate, LoanNo, RepaymentStart, AmtBorrowed,
NumberOfPayments, InterestRate, FinanceCharge, FirstDate, PaymentAmt, LastDate, DisclosureNo)
    VALUES('10-MAR-2024', 'L111','01-JUN-2024', '24000', '130', '5.5', '2340.00', 
    '01-JUN-2024', '250.00', '01-OCT-2034', 'DL111');     
    
INSERT INTO LoanOriginationForm(DateCompleted, DisbursementMethod,
DisbursementAmt, DisbursementDate, FormNo, LoanNo, OriginationFee)
    VALUES('06-SEP-1996', 'EFT', '3200.00', '30-SEP-1996','LOF100', 'L100', '100.00');
    
INSERT INTO LoanOriginationForm(DateCompleted, DisbursementMethod,
DisbursementAmt, DisbursementDate, FormNo, LoanNo, OriginationFee)
    VALUES('06-SEP-1996', 'EFT', '2500.00', '30-SEP-1996','LOF200','L200','100.00');
    
INSERT INTO LoanOriginationForm(DateCompleted, DisbursementMethod,
DisbursementAmt, DisbursementDate, FormNo, LoanNo, OriginationFee)
    VALUES('06-SEP-2020', '', '250.00', '05-MAY-2021','LOF300', 'L300', '100.00');  
    
INSERT INTO LoanOriginationForm(DateCompleted, DisbursementMethod,
DisbursementAmt, DisbursementDate, FormNo, LoanNo, OriginationFee)
    VALUES('06-SEP-2020', '', '250.00', '05-MAY-2021','LOF400', 'L400', '100.00'); 
    
INSERT INTO LoanOriginationForm(DateCompleted, DisbursementMethod,
DisbursementAmt, DisbursementDate, FormNo, LoanNo, OriginationFee)
    VALUES('06-SEP-1994', 'EFT', '250.00', '05-MAY-1998','LOF500', 'L500', '100.00'); 
    
INSERT INTO LoanOriginationForm(DateCompleted, DisbursementMethod,
DisbursementAmt, DisbursementDate, FormNo, LoanNo, OriginationFee)
    VALUES('06-SEP-2000', '', '250.00', '05-MAY-2000','LOF510', 'L510', '100.00');
    
INSERT INTO LoanOriginationForm(DateCompleted, DisbursementMethod,
DisbursementAmt, DisbursementDate, FormNo, LoanNo, OriginationFee)
    VALUES('06-SEP-1994', 'EFT', '250.00', '05-MAY-1998','LOF600', 'L600', '100.00'); 
    
INSERT INTO LoanOriginationForm(DateCompleted, DisbursementMethod,
DisbursementAmt, DisbursementDate, FormNo, LoanNo, OriginationFee)
    VALUES('06-SEP-1996', '', '250.00', '05-MAY-1998','LOF700', 'L700', '100.00'); 
    
INSERT INTO LoanOriginationForm(DateCompleted, DisbursementMethod,
DisbursementAmt, DisbursementDate, FormNo, LoanNo, OriginationFee)
    VALUES('06-SEP-1996', '', '250.00', '05-MAY-1998','LOF800', 'L800', '100.00'); 
    
INSERT INTO LoanOriginationForm(DateCompleted, DisbursementMethod,
DisbursementAmt, DisbursementDate, FormNo, LoanNo, OriginationFee)
    VALUES('06-SEP-1996', '', '250.00', '05-MAY-1998','LOF900', 'L900', '100.00'); 
    
INSERT INTO LoanOriginationForm(DateCompleted, DisbursementMethod,
DisbursementAmt, DisbursementDate, FormNo, LoanNo, OriginationFee)
    VALUES('06-SEP-2020', '', '250.00', '05-MAY-2020','LOF000', 'L000', '100.00');     

INSERT INTO LoanOriginationForm(DateCompleted, DisbursementMethod,
DisbursementAmt, DisbursementDate, FormNo, LoanNo, OriginationFee)
    VALUES('06-SEP-2020', '', '2100.00', '15-SEP-2020','LOF010', 'L010', '100.00');
    
INSERT INTO LoanOriginationForm(DateCompleted, DisbursementMethod,
DisbursementAmt, DisbursementDate, FormNo, LoanNo, OriginationFee)
    VALUES('06-SEP-2020', 'EFT', '1800.00', '20-SEP-2023','LOF020', 'L020', '100.00'); 

INSERT INTO LoanOriginationForm(DateCompleted, DisbursementMethod,
DisbursementAmt, DisbursementDate, FormNo, LoanNo, OriginationFee)
    VALUES('06-SEP-2019', 'EFT', '1800.00', '23-SEP-2020','LOF030', 'L030', '100.00'); 
    
INSERT INTO LoanOriginationForm(DateCompleted, DisbursementMethod,
DisbursementAmt, DisbursementDate, FormNo, LoanNo, OriginationFee)
    VALUES('06-SEP-2020', 'EFT', '1400.00', '24-SEP-2023','LOF031', 'L031', '100.00');     

INSERT INTO LoanOriginationForm(DateCompleted, DisbursementMethod,
DisbursementAmt, DisbursementDate, FormNo, LoanNo, OriginationFee)
    VALUES('06-SEP-2020', 'EFT', '1400.00', '24-SEP-2022','LOF040', 'L040', '100.00');  

INSERT INTO LoanOriginationForm(DateCompleted, DisbursementMethod,
DisbursementAmt, DisbursementDate, FormNo, LoanNo, OriginationFee)
    VALUES('06-SEP-2020', '', '1400.00', '24-SEP-2024','LOF050', 'L050', '100.00');  

INSERT INTO LoanOriginationForm(DateCompleted, DisbursementMethod,
DisbursementAmt, DisbursementDate, FormNo, LoanNo, OriginationFee)
    VALUES('06-SEP-2021', 'EFT', '1300.00', '24-SEP-2023','LOF060', 'L060', '100.00'); 

INSERT INTO LoanOriginationForm(DateCompleted, DisbursementMethod,
DisbursementAmt, DisbursementDate, FormNo, LoanNo, OriginationFee)
    VALUES('06-SEP-2022', 'EFT', '1200.00', '24-SEP-2022','LOF070', 'L070', '100.00');

INSERT INTO LoanOriginationForm(DateCompleted, DisbursementMethod,
DisbursementAmt, DisbursementDate, FormNo, LoanNo, OriginationFee)
    VALUES('06-JAN-2020', 'EFT', '1300.00', '25-SEP-2024','LOF080', 'L080', '100.00');

INSERT INTO LoanOriginationForm(DateCompleted, DisbursementMethod,
DisbursementAmt, DisbursementDate, FormNo, LoanNo, OriginationFee)
    VALUES('06-AUG-2020', '', '1200.00', '25-SEP-2024','LOF090', 'L090', '120.00');

INSERT INTO LoanOriginationForm(DateCompleted, DisbursementMethod,
DisbursementAmt, DisbursementDate, FormNo, LoanNo, OriginationFee)
    VALUES('06-AUG-2021', '', '1300.00', '25-MAR-2024','LOF111', 'L111', '140.00');

INSERT INTO StatementOfAccount(AmtDue, AmtEnclosed, DateDue, DatePaid, DateSent, 
OutstandingBal, PaymentMethod, StatementNo, LoanNo)
    VALUES('246.37', '246.37', '31-OCT-1998', '01-OCT-1998','01-OCT-1998', '10000', '', 
'SA100', 'L100');
    
INSERT INTO StatementOfAccount(AmtDue, AmtEnclosed, DateDue, DatePaid, DateSent, 
OutstandingBal, PaymentMethod, StatementNo, LoanNo)
    VALUES('250.57', '250.57', '31-OCT-1998', '01-OCT-1998','01-OCT-1998', '10000',
    'EFT', 'SA200', 'L200');
    
INSERT INTO StatementOfAccount(AmtDue, AmtEnclosed, DateDue, DatePaid, DateSent, 
OutstandingBal, PaymentMethod, StatementNo, LoanNo)
    VALUES('300.57', '300.57', '31-OCT-1998', '01-OCT-1998','01-OCT-1998', '10000',
    'EFT', 'SA300', 'L300');
    
INSERT INTO StatementOfAccount(AmtDue, AmtEnclosed, DateDue, DatePaid, DateSent,
OutstandingBal, PaymentMethod, StatementNo, LoanNo)
    VALUES('250.57', '250.57', '31-OCT-1998', '01-OCT-1998','01-OCT-1998', '10000',
    '', 'SA400', 'L400');
    
INSERT INTO StatementOfAccount(AmtDue, AmtEnclosed, DateDue, DatePaid, DateSent, 
OutstandingBal, PaymentMethod, StatementNo, LoanNo)
    VALUES('250.57', '250.57', '31-OCT-1988', '01-OCT-1998','01-OCT-1988', '10000',
    'EFT', 'SA500', 'L500');

INSERT INTO StatementOfAccount(AmtDue, AmtEnclosed, DateDue, DatePaid, DateSent, 
OutstandingBal, PaymentMethod, StatementNo, LoanNo)
    VALUES('250.57', '250.57', '26-NOV-1988', '26-NOV-1998','26-NOV-1988', '10000',
    'EFT', 'SA520', 'L500');
  
INSERT INTO StatementOfAccount(AmtDue, AmtEnclosed, DateDue, DatePaid, DateSent, 
OutstandingBal, PaymentMethod, StatementNo, LoanNo)
    VALUES('250.57', '250.57', '31-OCT-2000', '01-OCT-2000','01-OCT-2000', '10000',
    '', 'SA510', 'L510');    
    
INSERT INTO StatementOfAccount(AmtDue, AmtEnclosed, DateDue, DatePaid, DateSent,
 OutstandingBal, PaymentMethod, StatementNo, LoanNo)
    VALUES('250.57', '250.57', '21-JAN-1978', '01-JAN-1978','01-OCT-1978', '10000',
    '', 'SA600', 'L600');
    
INSERT INTO StatementOfAccount(AmtDue, AmtEnclosed, DateDue, DatePaid, DateSent,
OutstandingBal, PaymentMethod, StatementNo, LoanNo)
    VALUES('250.57', '250.57', '21-JAN-1978', '01-JAN-1978','01-OCT-1978', '10000',
    '', 'SA700', 'L700');
    
INSERT INTO StatementOfAccount(AmtDue, AmtEnclosed, DateDue, DatePaid, DateSent,
 OutstandingBal, PaymentMethod, StatementNo, LoanNo)
    VALUES('250.57', '250.57', '21-JAN-1978', '01-JAN-1978','01-OCT-1978', '10000',
    '', 'SA800', 'L800');
    
INSERT INTO StatementOfAccount(AmtDue, AmtEnclosed, DateDue, DatePaid, DateSent,
OutstandingBal, PaymentMethod, StatementNo, LoanNo)
    VALUES('250.57', '250.57', '21-JAN-1978', '01-JAN-1978','01-OCT-1978', '10000',
    '', 'SA900', 'L900');
    
INSERT INTO StatementOfAccount(AmtDue, AmtEnclosed, DateDue, DatePaid, DateSent,
OutstandingBal, PaymentMethod, StatementNo, LoanNo)
    VALUES('250.57', '250.57', '21-JAN-2020', '01-JAN-2020','01-OCT-2020', '10000',
    '', 'SA000', 'L000'); 

INSERT INTO StatementOfAccount(AmtDue, AmtEnclosed, DateDue, DatePaid, DateSent, 
OutstandingBal, PaymentMethod, StatementNo, LoanNo)
    VALUES('246.37', '240.57', '31-OCT-2021', '01-OCT-2021','01-OCT-2021', '12000', '', 
'SA010', 'L010');   

INSERT INTO StatementOfAccount(AmtDue, AmtEnclosed, DateDue, DatePaid, DateSent, 
OutstandingBal, PaymentMethod, StatementNo, LoanNo)
    VALUES('246.37', '240.57', '31-OCT-2023', '01-OCT-2023','01-OCT-2023', '18000', '', 
'SA020', 'L020'); 
 
 INSERT INTO StatementOfAccount(AmtDue, AmtEnclosed, DateDue, DatePaid, DateSent, 
OutstandingBal, PaymentMethod, StatementNo, LoanNo)
    VALUES('246.37', '246.57', '22-NOV-2023', '19-NOV-2023','19-NOV-2023', '18000', '', 
'SA021', 'L020'); 

INSERT INTO StatementOfAccount(AmtDue, AmtEnclosed, DateDue, DatePaid, DateSent, 
OutstandingBal, PaymentMethod, StatementNo, LoanNo)
    VALUES('246.17', '246.17', '31-OCT-2021', '01-OCT-2021','01-OCT-2021', '10000', '', 
'SA100', 'L100');

 INSERT INTO StatementOfAccount(AmtDue, AmtEnclosed, DateDue, DatePaid, DateSent, 
OutstandingBal, PaymentMethod, StatementNo, LoanNo)
    VALUES('246.37', '246.57', '22-NOV-2020', '19-NOV-2020','19-NOV-2020', '18000', '', 
'SA030', 'L030'); 

 INSERT INTO StatementOfAccount(AmtDue, AmtEnclosed, DateDue, DatePaid, DateSent, 
OutstandingBal, PaymentMethod, StatementNo, LoanNo)
    VALUES('246.37', '246.57', '22-NOV-2021', '19-NOV-2021','19-NOV-2021', '18000', '', 
'SA031', 'L031'); 
    
 INSERT INTO StatementOfAccount(AmtDue, AmtEnclosed, DateDue, DatePaid, DateSent, 
OutstandingBal, PaymentMethod, StatementNo, LoanNo)
    VALUES('250.27', '250.27', '22-NOV-2021', '19-NOV-2021','19-NOV-2021', '18000', 'EFT', 
'SA040', 'L040');   

 INSERT INTO StatementOfAccount(AmtDue, AmtEnclosed, DateDue, DatePaid, DateSent, 
OutstandingBal, PaymentMethod, StatementNo, LoanNo)
    VALUES('240.00', '240.00', '23-AUG-2024', '19-NOV-2024','19-NOV-2024', '18000', 'EFT', 
'SA050', 'L050'); 

 INSERT INTO StatementOfAccount(AmtDue, AmtEnclosed, DateDue, DatePaid, DateSent, 
OutstandingBal, PaymentMethod, StatementNo, LoanNo)
    VALUES('230.27', '230.27', '23-AUG-2024', '19-NOV-2024','19-NOV-2024', '12000', 'EFT', 
'SA060', 'L060'); 

 INSERT INTO StatementOfAccount(AmtDue, AmtEnclosed, DateDue, DatePaid, DateSent, 
OutstandingBal, PaymentMethod, StatementNo, LoanNo)
    VALUES('250.12', '250.12', '23-AUG-2022', '19-NOV-2022','19-NOV-2022', '18000', 'EFT', 
'SA070', 'L070'); 

 INSERT INTO StatementOfAccount(AmtDue, AmtEnclosed, DateDue, DatePaid, DateSent, 
OutstandingBal, PaymentMethod, StatementNo, LoanNo)
    VALUES('240.12', '240.12', '23-AUG-2024', '19-NOV-2024','19-NOV-2024', '13000', 'EFT', 
'SA080', 'L080'); 
    
 INSERT INTO StatementOfAccount(AmtDue, AmtEnclosed, DateDue, DatePaid, DateSent, 
OutstandingBal, PaymentMethod, StatementNo, LoanNo)
    VALUES('250.00', '250.00', '23-MAR-2025', '25-MAR-2025','25-MAR-2025', '10000', '', 
'SA090', 'L090');     

 INSERT INTO StatementOfAccount(AmtDue, AmtEnclosed, DateDue, DatePaid, DateSent, 
OutstandingBal, PaymentMethod, StatementNo, LoanNo)
    VALUES('250.00', '250.00', '23-AUG-2025', '25-AUG-2025','25-AUG-2025', '20000', 'EFT', 
'SA111', 'L111'); 
    
INSERT INTO LoanStatement(LoanNo, LoanStNo, StatementNo)
    VALUES('L100','LST100', 'SA100');
    
INSERT INTO LoanStatement(LoanNo, LoanStNo, StatementNo)
    VALUES('L200','LST200', 'SA200');
    
INSERT INTO LoanStatement(LoanNo, LoanStNo, StatementNo)
    VALUES('L300','LST300', 'SA300');
    
INSERT INTO LoanStatement(LoanNo, LoanStNo, StatementNo)
    VALUES('L400','LST400', 'SA400');
    
INSERT INTO LoanStatement(LoanNo, LoanStNo, StatementNo)
    VALUES('L500','LST500', 'SA500');
    
INSERT INTO LoanStatement(LoanNo, LoanStNo, StatementNo)
    VALUES('L500','LST520', 'SA520');   
    
INSERT INTO LoanStatement(LoanNo, LoanStNo, StatementNo)
    VALUES('L510','LST510', 'SA510');    
    
INSERT INTO LoanStatement(LoanNo, LoanStNo, StatementNo)
    VALUES('L600','LST600', 'SA600');
    
INSERT INTO LoanStatement(LoanNo, LoanStNo, StatementNo)
    VALUES('L700','LST700', 'SA700');
    
INSERT INTO LoanStatement(LoanNo, LoanStNo, StatementNo)
    VALUES('L800','LST800', 'SA800');
    
INSERT INTO LoanStatement(LoanNo, LoanStNo, StatementNo)
    VALUES('L900','LST900', 'SA900');
    
INSERT INTO LoanStatement(LoanNo, LoanStNo, StatementNo)
    VALUES('L000','LST000', 'SA000');

INSERT INTO LoanStatement(LoanNo, LoanStNo, StatementNo)
    VALUES('L010','LST010', 'SA010');
    
INSERT INTO LoanStatement(LoanNo, LoanStNo, StatementNo)
    VALUES('L020','LST020', 'SA020');
    
INSERT INTO LoanStatement(LoanNo, LoanStNo, StatementNo)
    VALUES('L020','LST021', 'SA021');
    
INSERT INTO LoanStatement(LoanNo, LoanStNo, StatementNo)
    VALUES('L030','LST030', 'SA030');   
    
INSERT INTO LoanStatement(LoanNo, LoanStNo, StatementNo)
    VALUES('L031','LST031', 'SA031');
    
INSERT INTO LoanStatement(LoanNo, LoanStNo, StatementNo)
    VALUES('L040','LST040', 'SA040'); 
    
INSERT INTO LoanStatement(LoanNo, LoanStNo, StatementNo)
    VALUES('L050','LST050', 'SA050'); 
       
    
INSERT INTO LoanStatement(LoanNo, LoanStNo, StatementNo)
    VALUES('L060','LST060', 'SA060');  
    
INSERT INTO LoanStatement(LoanNo, LoanStNo, StatementNo)
    VALUES('L070','LST070', 'SA070');   
    
INSERT INTO LoanStatement(LoanNo, LoanStNo, StatementNo)
    VALUES('L080','LST080', 'SA080');     

INSERT INTO LoanStatement(LoanNo, LoanStNo, StatementNo)
    VALUES('L090','LST090', 'SA090');  
    
INSERT INTO LoanStatement(LoanNo, LoanStNo, StatementNo)
    VALUES('L111','LST111', 'SA111');     
