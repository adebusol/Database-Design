--create tables
CREATE TABLE family (
    family_id number(10) NOT NULL,
    family_name VARCHAR2(50) NOT NULL,
    total_hours_worked number(10),
    CONSTRAINT family_id_pk PRIMARY KEY (family_id)
    
);

CREATE TABLE Area (
    area_id number(10) NOT NULL,
    area_name VARCHAR(50) NOT NULL,
    group_no number(10),
    family_id  number(10),
    CONSTRAINT area_id_pk PRIMARY KEY (area_id),
    CONSTRAINT family_id_fk
    FOREIGN KEY (family_id) REFERENCES family(family_id)
);

alter table
   Area
modify
(
   group_no    varchar2(30)
);

alter table
   Area
rename column
   group_no
TO
   control_group;
   
CREATE TABLE Event (
    event_id number(10) NOT NULL,
    event_name VARCHAR(50) NOT NULL,
    start_date DATE,
    end_date DATE,
    start_time DATE,
    end_time DATE,
    volunteers_needed number(10),
    area_id number(10),
    CONSTRAINT event_pk PRIMARY KEY (event_id),
    CONSTRAINT area_fk
    FOREIGN KEY (area_id) REFERENCES area(area_id)

);

alter table
 event
modify
(
   start_date    timestamp,
   end_date timestamp
);

alter table
   Event
drop
   (start_time, end_time);

CREATE TABLE Person (
    person_id number(10) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    street_address VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    zip_code VARCHAR(10),
    phone_number VARCHAR(20),
    email VARCHAR(255),
    family_id number(10) NOT NULL,
    CONSTRAINT person_pk PRIMARY KEY (person_id),
    CONSTRAINT family_fk
    FOREIGN KEY (family_id) REFERENCES Family(family_id)
);

CREATE TABLE VolunteerCase (
    volunteer_id INT NOT NULL,
    date_worked DATE,
    hours_worked number(10),
    location VARCHAR(255),
    person_id number(10) NOT NULL,
    family_id number(10) NOT NULL,
    event_id number(10) NOT NULL,
    CONSTRAINT volunteercase_pk PRIMARY KEY (volunteer_id),
    CONSTRAINT person_fk
    FOREIGN KEY (person_id) REFERENCES Person(person_id),
    CONSTRAINT fk_family
    FOREIGN KEY (family_id) REFERENCES Family(Family_id),
    CONSTRAINT event_fk
    FOREIGN KEY (event_id) REFERENCES Event(event_id)  
    
);

alter table
    VolunteerCase
modify
(
   hours_worked   number(10,2)
);


--alter session set DDL_LOCK_TIMEOUT = 30;

--insert statements
  
INSERT INTO family(family_id, family_name,total_hours_worked)
    WITH p AS(
    SELECT 001, 'Stout', NULL FROM dual UNION ALL
    SELECT 002, 'Branch', NULL FROM dual UNION ALL
    SELECT 003, 'Yates', NULL FROM dual UNION ALL
    SELECT 004, 'Elliott', NULL FROM dual UNION ALL
    SELECT 005, 'Haynes', NULL FROM dual UNION ALL
    SELECT 006, 'Morrow', NULL FROM dual UNION ALL
    SELECT 007, 'Bailey', NULL FROM dual UNION ALL
    SELECT 008, 'Hayes', NULL FROM dual UNION ALL
    SELECT 009, 'Shepard', NULL FROM dual UNION ALL
    SELECT 010, 'Boyle', NULL FROM dual UNION ALL
    SELECT 011, 'Fowler', NULL FROM dual UNION ALL
    SELECT 012, 'Castillo', NULL FROM dual UNION ALL
    SELECT 013, 'Holt', NULL FROM dual UNION ALL
    SELECT 014, 'Bradley', NULL FROM dual UNION ALL
    SELECT 015, 'Malone', NULL FROM dual UNION ALL
    SELECT 016, 'Arnold', NULL FROM dual UNION ALL
    SELECT 017, 'Drake', NULL FROM dual UNION ALL
    SELECT 018, 'Mathis', NULL FROM dual UNION ALL
    SELECT 019, 'Rowe', NULL FROM dual UNION ALL
    SELECT 020, 'Alvarado', NULL FROM dual 
    )
SELECT * FROM p;


SELECT * FROM family;

INSERT INTO Area(area_id, area_name, control_group,family_id)
    WITH p AS(
    SELECT 100, ' Classroom help', 'Parent teacher association',008 FROM dual UNION ALL
    SELECT 101, 'Lunchroom', 'faculty', 015 FROM dual UNION ALL
    SELECT 102, 'Traffic', 'Parent teacher association', 001 FROM dual UNION ALL
    SELECT 103, 'Front desk', 'faculty', 020 FROM dual UNION ALL
    SELECT 104, 'Work day', 'senate', 005 FROM dual 
    )
SELECT * FROM p;
SELECT * FROM area;



INSERT INTO Event (event_id, event_name, start_date, end_date,volunteers_needed, area_id)
    
    WITH p AS(
    
    SELECT 501,'WCA_1', TO_TIMESTAMP('2022-01-03 9:00:00',  'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-01-05 14:30:00',  'YYYY-MM-DD HH24:MI:SS')
    ,15, 100 
    FROM dual UNION ALL
    
    SELECT 502,'WCA_2', TO_TIMESTAMP('2022-02-05 7:00:00',  'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-02-15 9:30:00',  'YYYY-MM-DD HH24:MI:SS'), 
    12, 102 FROM dual UNION ALL
    
    SELECT 503,'WCA_3', TO_TIMESTAMP('2022-01-10 11:00:00','YYYY-MM-DD HH24:MI:SS' ), TO_TIMESTAMP('2022-01-25 12:30:00', 'YYYY-MM-DD HH24:MI:SS')
    , 10, 101 FROM dual UNION ALL
    
    SELECT 504,'WCA_4', TO_TIMESTAMP('2022-03-15 8:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-03-16 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 
    30, 104 FROM dual UNION ALL
    
    SELECT 505,'WCA_5', TO_TIMESTAMP('2022-03-01 9:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-03-31 16:30:00', 'YYYY-MM-DD HH24:MI:SS')
    , 25, 104 FROM dual UNION ALL
    
    SELECT 506,'WCA_6', TO_TIMESTAMP('2022-04-01 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-04-15 16:30:00', 'YYYY-MM-DD HH24:MI:SS')
    , 13, 102 FROM dual UNION ALL
    
    SELECT 507,'WCA_7', TO_TIMESTAMP('2022-08-16 7:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-08-30 14:30:00', 'YYYY-MM-DD HH24:MI:SS')
    , 22, 103 FROM dual UNION ALL
    
    SELECT 508,'WCA_8', TO_TIMESTAMP('2022-02-09 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-02-28 14:45:00', 'YYYY-MM-DD HH24:MI:SS')
    , 45, 104 FROM dual UNION ALL
    
    SELECT 509,'WCA_9', TO_TIMESTAMP('2022-09-02 13:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-09-17 15:15:00', 'YYYY-MM-DD HH24:MI:SS')
    , 5, 100 FROM dual UNION ALL
    
    SELECT 510,'WCA_10', TO_TIMESTAMP('2022-05-01 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-06-01 12:30:00','YYYY-MM-DD HH24:MI:SS')
    ,14, 101 FROM dual 
    )
SELECT * FROM p;

SELECT * FROM event;


INSERT INTO Person (person_id, first_name,last_name, street_address, city, state, zip_code, phone_number, email, family_id)
    WITH p AS(
    SELECT 1000, 'Armani','Begley', 'Walnut Boulevard',	'Maurice',	'LA', '70555','(200) 976-0104','paul44@yahoo.com', 007 
    FROM dual UNION ALL
    SELECT 1001, 'Keshaun',	'Beckman', 'Poplar Route',	'Carencro',	'LA',	'70520','(391) 241-4877','willy78@yahoo.com', 012
    FROM dual UNION ALL
    SELECT 1002, 'Zackery','Gilman', 'Station Avenue St', 'Martinville', 'LA', '70582', '(444) 295-2544', 'felicia.goodwin14@hotmail.com',003
    FROM dual UNION ALL
    SELECT 1003, 'Anjelica', 'Slaughter', 'Hazelnut Row',	'Broussard',	'LA',	'70518','(436) 245-6555', 'macey56@gmail.com',009
    FROM dual UNION ALL
    SELECT 1004, 'Ashley','Alvarrado', 'Cannon Avenue',	'Youngsville',	'LA',	'70592','(422) 531-0264','annamae69@gmail.com',020
    FROM dual UNION ALL
    SELECT 1005, 'Blaine','Rowe', 'Law Lane','Lafayette',	'LA','70596','(405) 917-3382', 'sid_hammes26@yahoo.com',019
    FROM dual UNION ALL
    SELECT 1006, 'Yazmin','Mathis', 'Butcher Passage',	'Youngsville',	'LA',	'70592','(399) 252-8886','Juanita.herzog@gmail.com',018
    FROM dual UNION ALL
    SELECT 1007, 'Tariq','Drake', 'Mandarin Avenue',	'Lafayette',	'LA',	'70596','(428) 591-5463','christelle.wilkinson@hotmail.com',017
    FROM dual UNION ALL
    SELECT 1008, 'Trsitin','Arnold', 'Mandarin Avenue',	'Lafayette',	'LA',	'70596','(438) 206-4548', 'brycen.kertzmann@yahoo.com',016
    FROM dual UNION ALL
    SELECT 1009, 'Violet','Kamren','Hazelnut Row',	'Broussard',	'LA',	'70518','(393) 228-2765','orville.corwin@hotmail.com',015
    FROM dual UNION ALL
    SELECT 1010, 'Hayli', 'Malone', 'Revolution Street',	'Breaux Bridge',	'LA',	'70517','(449) 232-9817','willie.okon@yahoo.com',015
    FROM dual UNION ALL
    SELECT 1011, 'Brook', 'Bradley', 'Poplar Route',	'Carencro',	'LA',	'70520','(500) 645-7605','dianna65@hotmail.com',014
    FROM dual UNION ALL
    SELECT 1012, 'Darrin', 'Holt', 'Wellness Lane',	'Cankton',	'LA',	'70584','(471) 215-9530', 'aidan.runolfsdottir@hotmail.com',013
    FROM dual UNION ALL
    SELECT 1013, 'Anya', 'Castillo', 'Law Lane',	'Lafayette',	'LA',	'70596','(470) 902-2585', 'porter20@gmail.com',012
    FROM dual UNION ALL
    SELECT 1014, 'Jerod', 'Fowler', 'Poplar Passage',	'Carencro',	'LA',	'70520','(469) 242-4506','ernest22@gmail.com',011
    FROM dual UNION ALL
    SELECT 1015, 'Stefan', 'Boyle', 'Snowflake Route St', 'Martinville',	'LA',	'70582','(461) 928-9048', 'rodolfo_bogisich3@hotmail.com',010
    FROM dual UNION ALL
    SELECT 1016, 'Mia', 'Shepard', 'Cannon Avenue',	'Youngsville',	'LA',	'70592','(452) 627-0920', 'claudia.koss@yahoo.com',009
    FROM dual UNION ALL
    SELECT 1017, 'Robyn', 'Stout', 'Ashland Row',	'Youngsville',	'LA',	'70592','(378) 595-9622', 'cheyanne.veum40@hotmail.com',001
    FROM dual UNION ALL
    SELECT 1018, 'Juanita', 'Branch', 'Mandarin Avenue', 'Lafayette',	'LA', '70596','(381) 472-8144', 'dante.murray@yahoo.com',002
    FROM dual UNION ALL
    SELECT 1019, 'Graciela','Yates',  'Royalty Street', 'Breaux Bridge',	'LA',	'70517', '(516) 703-1806', 'albertha_stracke83@gmail.com',003
    FROM dual UNION ALL
    SELECT 1020, 'Alijah', 'Elliot', 'Mandarin Avenue',	'Lafayette',	'LA',	'70596','(515) 443-5514', 'sadie_gerhold@yahoo.com',004
    FROM dual UNION ALL
    SELECT 1021, 'Marcelo', 'Haynes', 'Emerald Street',	'Broussard',	'LA',	'70518','(513) 573-1053', 'cecil32@gmail.com',005
    FROM dual UNION ALL
    SELECT 1022, 'Marisol', 'Morrow', 'Globe Route',	'Broussard',	'LA',	'70518','(512) 202-1277', 'evans80@yahoo.com',006
    FROM dual UNION ALL
    SELECT 1023, 'Edith', 'Bailey', 'Butcher Passage',	'Youngsville',	'LA',	'70592','(411) 519-4934','Zechhy97@yahoo.com',007
    FROM dual UNION ALL
    SELECT 1024, 'Susana','Hayes', 'Prince Row',	'Breaux Bridge',	'LA',	'70517','(359) 842-9324','kristin11@gmail.com',008
    FROM dual UNION ALL
    SELECT 1025, 'kamden', 'Alvarado', 'Hazelnut Row',	'Broussard',	'LA',	'70518','(330) 537-3386','markus_hills@hotmail.com',020
    FROM dual UNION ALL
    SELECT 1026, 'Anne', 'Rowe', 'Butcher Avenue',	'Youngsville',	'LA',	'70592', '(317)650-9985','nella.ruecker@hotmail.com',019
    FROM dual UNION ALL
    SELECT 1027, 'Jalen', 'Mathis','Station Avenue St', 'Martinville',	'LA',	'70582', '(297) 958-7271','jaquelin89@yahoo.com',018
    FROM dual UNION ALL
    SELECT 1028, 'Finley', 'Drake', 'Marble Street',	'Lafayette',	'LA',	'70503', '(266) 968-7143','rex.kirlin@gmail.com',017
    FROM dual UNION ALL
    SELECT 1029, 'Ruben', 'Arnold', 'Boulder Way',	'Youngsville',	'LA',	'70592','(221) 710-8290','alvena.hagenes35@hotmail.com',016
    FROM dual UNION ALL
    SELECT 1030, 'Vanessa', 'Malone', 'Revolution Street',	'Breaux Bridge',	'LA',	'70517','(389) 222-6264','carli_goodwin6@yahoo.com',015
    FROM dual UNION ALL
    SELECT 1031, 'Niko', 'Bradley', 'Poplar Route',	'Carencro',	'LA',	'70520','(217) 812-0300','saul15@yahoo.com',014
    FROM dual UNION ALL
    SELECT 1032, 'Eva', 'Holt', 'Wellness Lane',	'Cankton',	'LA',	'70584', '(350) 435-5628','maximo.abbott58@gmail.com',013
    FROM dual UNION ALL
    SELECT 1033, 'Kameron', 'Castillo', 'Law Lane',	'Lafayette',	'LA',	'70596','(375) 774-0416','lennie_raynor@hotmail.com',012
    FROM dual UNION ALL
    SELECT 1034, 'Aliya', 'Fowler', 'Poplar Passage',	'Carencro',	'LA',	'70520','(340) 286-7337','creola15@gmail.com',011
    FROM dual UNION ALL
    SELECT 1035, 'Damari', 'Boyle', 'Snowflake Route	St' ,'Martinville',	'LA',	'70582',  '(296) 229-2529','danyka_dare@gmail.com',010
    FROM dual UNION ALL
    SELECT 1036, 'Iris','Shepard', 'Cannon Avenue',	'Youngsville',	'LA',	'70592','(350) 435-5628','carlos11@gmail.com',009
    FROM dual UNION ALL
    SELECT 1037, 'Axel', 'Hayes', 'Prince Row',	'Breaux Bridge',	'LA',	'70517','(246) 457-9499','patrick28@gmail.com',008
    FROM dual UNION ALL
    SELECT 1038, 'Reyna', 'Bailey', 'Butcher Passage',	'Youngsville',	'LA',	'70592','(359) 866-0561','stefanie34@gmail.com',007
    FROM dual UNION ALL
    SELECT 1039, 'Kason','Morrow', 'Globe Route',	'Broussard',	'LA',	'70518','(291) 631-9922','myrtis.jerde@gmail.com',006
    FROM dual UNION ALL
    SELECT 1040, 'Noelle', 'Haynes', 'Emerald Street',	'Broussard',	'LA',	'70518', '(285) 461-8475','lia65@gmail.com',005
    FROM dual UNION ALL
    SELECT 1041, 'Braylon', 'Elliot', 'Mandarin Avenue',	'Lafayette',	'LA',	'70596','(217) 812-0300','orville44@yahoo.com',004
    FROM dual UNION ALL
    SELECT 1042, 'Luisa', 'Yates', 'Royalty Street',	'Breaux Bridge',	'LA',	'70517','(215) 771-2953','jay.kreiger@gmail.com',003
    FROM dual UNION ALL
    SELECT 1043, 'Callahan', 'Branch', 'Mandarin Avenue',	'Lafayette',	'LA',	'70596','(211) 871-8898','daisha_collier60@gmail.com',002
    FROM dual UNION ALL
    SELECT 1044, 'Winter', 'Stout', 'Ashland Row',	'Youngsville',	'LA',	'70592','(211) 512-9875','glenna_murray37@yahoo.com',001
    FROM dual 
)
SELECT * FROM p;

SELECT * FROM Person;


INSERT INTO VolunteerCase(Volunteer_id, date_worked,hours_worked,location,person_id,family_id, event_id)
    WITH p AS(
    SELECT 8400, TO_DATE('2022-01-09', 'yyyy/mm/dd'), 2.30, 'classroom',1020, 014, 501 
    FROM dual UNION ALL
    SELECT 8401, TO_DATE('2022-03-08', 'yyyy/mm/dd'),1.30, 'Cafetaria',1044, 020, 507
    FROM dual UNION ALL
    SELECT 8402, TO_DATE('2022-04-16', 'yyyy/mm/dd'),2.00, 'Parking lot',1036, 007, 502
    FROM dual UNION ALL
    SELECT 8403, TO_DATE('2022-04-16', 'yyyy/mm/dd'),2.00, 'Parking lot',1036, 011, 506
    FROM dual UNION ALL
    SELECT 8404, TO_DATE('2022-02-22', 'yyyy/mm/dd'),2.00, 'Parking lot',1036, 003, 506
    FROM dual UNION ALL
    SELECT 8405, TO_DATE('2022-02-09', 'yyyy/mm/dd'),1.30, 'gym',1020, 018, 501 
    FROM dual UNION ALL
    SELECT 8406, TO_DATE('2022-05-29', 'yyyy/mm/dd'),3.00, 'Parking lot',1036, 001, 502
    FROM dual UNION ALL
    SELECT 8407, TO_DATE('2022-01-11', 'yyyy/mm/dd'),2.00, 'field',1018, 020, 505
    FROM dual UNION ALL
    SELECT 8408, TO_DATE('2022-06-01', 'yyyy/mm/dd'),4.30, 'Office',1036, 014, 504
    FROM dual UNION ALL
    SELECT 8409, TO_DATE('2022-03-29', 'yyyy/mm/dd'),1.40, 'classroom',1020, 004, 509
    FROM dual UNION ALL
    SELECT 8410, TO_DATE('2022-05-29', 'yyyy/mm/dd'),3.00, 'Cafetaria',1036, 020, 507
    FROM dual
)
SELECT * FROM p;

SELECT * FROM VolunteerCase;

/*DELETE FROM Event;
DELETE FROM Area;
DELETE FROM Person;
DELETE FROM Family;
DELETE FROM VolunteerCase;*/


    
SELECT * FROM area;
SELECT * FROM event;
SELECT * FROM family;
SELECT * FROM person;
SELECT * FROM volunteercase;







-- reports

SELECT DISTINCT a.volunteer_id, a.family_id, b.first_name, b.last_name, b.person_id, c.family_name
FROM volunteercase a
JOIN Person b ON a.person_id = b.person_id
JOIN family c ON c.family_id= a.family_id
WHERE c.family_id= 020;




SELECT a.family_id, SUM(a.hours_worked) as total_hours_worked, b.family_name
FROM volunteercase a
JOIN family b ON a.family_id = b.family_id
GROUP BY a.family_id, b.family_name
HAVING a.family_id = 014;




SELECT a.volunteer_id, a.event_id, a.date_worked, b.first_name, b.last_name
FROM volunteercase a
JOIN person b ON a.family_id = b.family_id
WHERE a.event_id = 506;















