CREATE TABLE Users(
    User_ID int NOT NULL,
    Name varchar(20) NOT NULL,
    Date_of_Birth date NOT NULL,
    Medical_history varchar(20),
    Street varchar(20),
    City varchar(20),
    State varchar(20),
    PRIMARY KEY(User_ID)
);

CREATE TABLE User_phone_no(
    User_ID int NOT NULL,
    phone_no varchar(15),
    FOREIGN KEY(User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE
);

CREATE TABLE Organization(
  Organization_ID int NOT NULL,
  Organization_name varchar(20) NOT NULL,
  Location varchar(20),
  Government_approved int,
  PRIMARY KEY(Organization_ID)
);

CREATE TABLE Organization_phone_no(
  Organization_ID int NOT NULL,
  Phone_no varchar(15),
  FOREIGN KEY(Organization_ID) REFERENCES Organization(Organization_ID) ON DELETE CASCADE
);

CREATE TABLE Patient(
    Patient_ID int NOT NULL,
    organ_req varchar(20) NOT NULL,
    User_ID int NOT NULL,
    FOREIGN KEY(User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE,
    PRIMARY KEY(Patient_Id)
);

CREATE TABLE Donor(
  Donor_ID int NOT NULL,
  organ_donated varchar(20) NOT NULL,
  Organization_ID int NOT NULL,
  User_ID int NOT NULL,
  FOREIGN KEY(User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE,
  FOREIGN KEY(Organization_ID) REFERENCES Organization(Organization_ID) ON DELETE CASCADE,
  PRIMARY KEY(Donor_ID)
);

CREATE TABLE Organ_available(
  Organ_ID int GENERATED ALWAYS AS IDENTITY Primary key,
  Organ_name varchar(20) NOT NULL,
  Donor_ID int NOT NULL,
  FOREIGN KEY(Donor_ID) REFERENCES Donor(Donor_ID) ON DELETE CASCADE
);

CREATE TABLE Transaction(
  Patient_ID int NOT NULL,
  Organ_ID int NOT NULL,
  Donor_ID int NOT NULL,
  Date_of_transaction date NOT NULL,
  Status int NOT NULL,
  FOREIGN KEY(Patient_ID) REFERENCES Patient(Patient_ID) ON DELETE CASCADE,
  FOREIGN KEY(Donor_ID) REFERENCES Donor(Donor_ID) ON DELETE CASCADE,
  FOREIGN KEY(Organ_ID) REFERENCES Organ_available(Organ_ID) ON DELETE CASCADE,
  PRIMARY KEY(Patient_ID,Organ_ID)
);

insert into Users values ( 1 ,'Name-1','21-Aug-1978','NIL','Street-1','New Delhi','Delhi');
insert into Users values ( 2 ,'Name-2','10-Dec-1975','NIL','Street-2','Mumbai','Maharashtra');
insert into Users values ( 3 ,'Name-3','04-Jun-1976','NIL','Street-3','Mumbai','Maharashtra');
insert into Users values ( 4 ,'Name-4','13-Oct-1985','NIL','Street-4','Ahmedabad','Gujarat');
insert into Users values ( 5 ,'Name-5','12-Oct-1983','NIL','Street-5','Kolkata','West Bengal');
insert into Users values ( 6 ,'Name-6','18-Jan-1977','NIL','Street-6','Kolkata','West Bengal');
insert into Users values ( 7 ,'Name-7','26-Feb-1976','NIL','Street-7','New Delhi','Delhi');
insert into Users values ( 8 ,'Name-8','12-Apr-1973','NIL','Street-8','Mumbai','Maharashtra');
insert into Users values ( 9 ,'Name-9','01-Nov-1976','NIL','Street-9','Mumbai','Maharashtra');
insert into Users values ( 10 ,'Name-10','18-Nov-1978','NIL','Street-10','New Delhi','Delhi');
insert into Users values ( 11 ,'Name-11','06-Jan-1975','NIL','Street-11','Mumbai','Maharashtra');
insert into Users values ( 12 ,'Name-12','01-Nov-1983','NIL','Street-12','Mumbai','Maharashtra');
insert into Users values ( 13 ,'Name-13','09-jan-1983','NIL','Street-13','New Delhi','Delhi');
insert into Users values ( 14 ,'Name-14','12-Oct-1975','NIL','Street-14','Mumbai','Maharashtra');
insert into Users values ( 15 ,'Name-15','23-Sep-1977','NIL','Street-15','Ahmedabad','Gujarat');
insert into Users values ( 16 ,'Name-16','29-Nov-1982','NIL','Street-16','New Delhi','Delhi');
insert into Users values ( 17 ,'Name-17','19-Mar-1974','NIL','Street-17','Mumbai','Maharashtra');
insert into Users values ( 18 ,'Name-18','27-Oct-1973','NIL','Street-18','New Delhi','Delhi');
insert into Users values ( 19 ,'Name-19','18-Mar-1980','NIL','Street-19','Kolkata','West Bengal');
insert into Users values ( 20 ,'Name-20','15-Aug-1978','NIL','Street-20','Kolkata','West Bengal');

select * from Users;

insert into User_phone_no values (1, '656563523');
insert into User_phone_no values (2, '2352354524');
insert into User_phone_no values (3, '768451255');
insert into User_phone_no values (4, '96385746');
insert into User_phone_no values (5, '668112746');
insert into User_phone_no values (6, '7535746746');
insert into User_phone_no values (7, '3985746746');
insert into User_phone_no values (8, '7785746746');
insert into User_phone_no values (9, '691212146');
insert into User_phone_no values (10, '694657646');
insert into User_phone_no values (11, '321746746');
insert into User_phone_no values (12, '6122334656');
insert into User_phone_no values (13, '985566746');
insert into User_phone_no values (14, '4485746746');
insert into User_phone_no values (15, '933746746');
insert into User_phone_no values (16, '985746746');
insert into User_phone_no values (17, '485746006');
insert into User_phone_no values (18, '9985746116');
insert into User_phone_no values (19, '75746746');
insert into User_phone_no values (20, '985676746');

select * from Users, User_phone_no where User_phone_no.User_ID = Users.User_ID;

insert into Organization values (1, 'Organization-1','New Delhi',1);
insert into Organization values (2, 'Organization-2','Mumbai',0);
insert into Organization values (3, 'Organization-3','Kolkata',0);
insert into Organization values (4, 'Organization-4','Kolkata',1);
insert into Organization values (5, 'Organization-5','Ahmedabad',1);
insert into Organization values (6, 'Organization-6','Kolkata',0);
insert into Organization values (7, 'Organization-7','Kolkata',0);
insert into Organization values (8, 'Organization-8','Ahmedabad',0);
insert into Organization values (9, 'Organization-9','Kolkata',1);
insert into Organization values (10, 'Organization-10','Ahmedabad',1);
insert into Organization values (11, 'Organization-11','Ahmedabad',1);
insert into Organization values (12, 'Organization-12','Mumbai',0);
insert into Organization values (13, 'Organization-13','Kolkata',0);
insert into Organization values (14, 'Organization-14','Ahmedabad',1);
insert into Organization values (15, 'Organization-15','Ahmedabad',0);

select * from Organization;

insert into Organization_phone_no values (1, '86451389');
insert into Organization_phone_no values (2, '97865431');
insert into Organization_phone_no values (3, '17684355');
insert into Organization_phone_no values (4, '786358125');
insert into Organization_phone_no values (5, '136487853');
insert into Organization_phone_no values (6, '36974185');
insert into Organization_phone_no values (7, '25874193');
insert into Organization_phone_no values (8, '25776465');
insert into Organization_phone_no values (9, '13686532');
insert into Organization_phone_no values (10, '98986575');
insert into Organization_phone_no values (11, '554879654');
insert into Organization_phone_no values (12, '546481213');
insert into Organization_phone_no values (13, '748596258');
insert into Organization_phone_no values (14, '5689731546');
insert into Organization_phone_no values (15, '445786578');

select * from Organization, Organization_phone_no where Organization_phone_no.Organization_ID = Organization.Organization_ID;

insert into Patient values (1,'Heart',2);
insert into Patient values (2,'Kidney',3);
insert into Patient values (3,'Pancreas',10);
insert into Patient values (4,'Kidney',1);
insert into Patient values (5,'Heart',4);
insert into Patient values (6,'Lung',7);
insert into Patient values (7,'Intestine',8);
insert into Patient values (8,'Intestine',5);
insert into Patient values (9,'Lung',6);
insert into Patient values (10,'Kidney',9);

select * from Users, Patient where Patient.User_ID = Users.User_ID;

create trigger ADD_DONOR
after insert or update
on Donor
for each row
begin
insert into Organ_available(Organ_name, Donor_ID) values (:new.organ_donated, :new.Donor_ID);
end;
/

create trigger REMOVE_ORGAN
after insert or update
on Transaction
for each row
begin
delete from Organ_available
where Organ_ID = :new.Organ_ID;
end;
/

insert into Donor values (1,'Heart',1,20);
insert into Donor values (2,'Pancreas',2,19);
insert into Donor values (3,'Pancreas',3,18);
insert into Donor values (4,'Intestine',4,17);
insert into Donor values (5,'Kidney',5,16);
insert into Donor values (6,'Pancreas',6,15);
insert into Donor values (7,'Kidney',7,14);
insert into Donor values (8,'Kidney',8,13);
insert into Donor values (9,'Heart',9,12);
insert into Donor values (10,'Heart',10,11);

insert into Users values (  ,'Name-1','21-Aug-1978','NIL','Street-1','New Delhi','Delhi');

select * from Organ_available;

select * from Users, Donor, Organization where Donor.User_ID = Users.User_ID and Donor.Organization_ID = Organization.Organization_ID;





