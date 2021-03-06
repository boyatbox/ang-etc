Drop table Portfolio_VS_Map
Drop table VS_CI_Application_Map
Drop table Portfolio
Drop table ValueStream
Drop table CI_Application

CREATE TABLE Portfolio (
        Portfolio_ID INT IDENTITY PRIMARY KEY,
        Portfolio_Name VARCHAR(255) NOT NULL,
);
go
CREATE TABLE ValueStream (
        ValueStream_ID INT IDENTITY PRIMARY KEY,
        ValueStream_Name VARCHAR(255) NOT NULL,
);
go
CREATE TABLE CI_Application (
        CI_Application_ID INT IDENTITY PRIMARY KEY,
        CI_Application_Name VARCHAR(255) NOT NULL,
);
go
CREATE TABLE Portfolio_VS_Map (
        Portfolio_VS_Map_ID INT IDENTITY PRIMARY KEY,
        Portfolio_ID INT NOT NULL,
		ValueStream_ID INT NOT NULL
);
go
ALTER TABLE Portfolio_VS_Map
ADD CONSTRAINT FK_Portfolio_ID FOREIGN KEY (Portfolio_ID) REFERENCES Portfolio(Portfolio_ID)
ALTER TABLE Portfolio_VS_Map
ADD CONSTRAINT FK_ValueStream_ID FOREIGN KEY (ValueStream_ID) REFERENCES ValueStream(ValueStream_ID)
go
CREATE TABLE VS_CI_Application_Map (
        VS_CI_Application_Map_ID INT IDENTITY PRIMARY KEY,
		ValueStream_ID INT NOT NULL,
		CI_Application_ID INT NOT NULL
);
go
ALTER TABLE VS_CI_Application_Map
ADD CONSTRAINT FK_VS_CI_Application_Map FOREIGN KEY (CI_Application_ID) REFERENCES CI_Application(CI_Application_ID)
ALTER TABLE VS_CI_Application_Map
ADD CONSTRAINT FK_VS_CI_Application_Map_ValueStream_ID FOREIGN KEY (ValueStream_ID) REFERENCES ValueStream(ValueStream_ID)
---------------------------------------------------------------------------------------------------------------------------
INSERT INTO Portfolio(Portfolio_Name)
VALUES ('Portfolio-A'), ('Portfolio-B');
Select * from Portfolio

INSERT INTO ValueStream(ValueStream_Name)
VALUES ('ValueStream-AA'), ('ValueStream-AB'), ('ValueStream-AC'), ('ValueStream-BA'), ('ValueStream-BB'), ('ValueStream-BC');
Select * from ValueStream

INSERT INTO CI_Application(CI_Application_Name)
VALUES 
('CIApplication-AAA'),('CIApplication-AAB'),('CIApplication-AAC'),('CIApplication-AAD'),('CIApplication-AAE'), 
('CIApplication-ABA'),('CIApplication-ABB'),('CIApplication-ABC'),('CIApplication-ABD'),('CIApplication-ABE'),
('CIApplication-ACA'),('CIApplication-ACB'),('CIApplication-ACC'),('CIApplication-ACD'),('CIApplication-ACE'), 
('CIApplication-BAA'),('CIApplication-BAB'),('CIApplication-BAC'),('CIApplication-BAD'),('CIApplication-BAE'), 
('CIApplication-BBA'),('CIApplication-BBB'),('CIApplication-BBC'),('CIApplication-BBD'),('CIApplication-BBE'),
('CIApplication-BCA'),('CIApplication-BCB'),('CIApplication-BCC'),('CIApplication-BCD'),('CIApplication-BCE')
;
Select * from CI_Application

INSERT INTO Portfolio_VS_Map(Portfolio_ID,ValueStream_ID)
VALUES 
(1,1),(1,2),(1,3),
(2,4),(2,5),(2,6)
;
Select * from Portfolio_VS_Map

INSERT INTO VS_CI_Application_Map(ValueStream_ID,CI_Application_ID)
VALUES 
(1,1),(1,2),(1,3),(1,4),(1,5),
(2,6),(2,7),(2,8),(2,9),(2,10),
(3,11),(3,12),(3,13),(3,14),(3,15),
(4,16),(4,17),(4,18),(4,19),(4,10),
(5,21),(5,22),(5,23),(5,24),(5,25),
(6,26),(6,27),(6,28),(6,29),(6,30)
;
Select * from VS_CI_Application_Map

--Portfolio_VS_Map , VS_CI_Application_Map
SELECT p.Portfolio_Name,pvm.ValueStream_ID FROM Portfolio p
FULL OUTER JOIN Portfolio_VS_Map pvm ON p.Portfolio_ID = pvm.ValueStream_ID 

SELECT a.CI_Application_Name,v.ValueStream_Name,p.Portfolio_Name FROM CI_Application a
LEFT JOIN ValueStream v on a.CI_Application_ID=v.ValueStream_ID
LEFT JOIN Portfolio p ON v.ValueStream_ID=p.Portfolio_ID;
