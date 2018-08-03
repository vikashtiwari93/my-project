
create table aadhar
(
    aadhar_id int not null primary key auto_increment,
    aadhar_no char(12) not null unique
);

create table enduser
(
    uid int not null primary key auto_increment,
    uname varchar(50) not null,
    aadhar_id int not null unique,
    foreign key fk_aadhar_id(aadhar_id)
    references aadhar(aadhar_id)
);

insert into aadhar (aadhar_no) values("111122223333");
insert into aadhar (aadhar_no) values("111133332222");
insert into aadhar (aadhar_no) values("444422223333");
insert into aadhar (aadhar_no) values("333322221111");
insert into aadhar (aadhar_no) values("222211113333");

insert into enduser (uname,aadhar_id) values("Raj",3);
insert into enduser (uname,aadhar_id) values("John",1);
insert into enduser (uname,aadhar_id) values("Kaif",2);
insert into enduser (uname,aadhar_id) values("Suresh",5);
insert into enduser (uname,aadhar_id) values("Ramesh",4);
# Below queries throw error
insert into enduser (uname,aadhar_id) values("Joseph",5);
insert into enduser (uname,aadhar_id) values("Sundar",4);
insert into enduser (uname,aadhar_id) values("Kumar",10);
insert into enduser (uname,aadhar_id) values("Manoj",6);

# below query throw error as aadhar_id 2 is used by enduser 3
delete from aadhar where aadhar_id = 2;

delete from enduser where aadhar_id = 2;
delete from aadhar where aadhar_id = 2;

select e.uname,a.aadhar_no,a.aadhar_id
from enduser as e
inner join aadhar as a
on e.aadhar_id = a.aadhar_id;

select e.uname,a.aadhar_no,a.aadhar_id
from enduser as e
inner join aadhar as a
on e.aadhar_id = a.aadhar_id
where e.aadhar_id = 4;

select * from aadhar;
select * from enduser;

################################
# One to many relationship
################################

create table mobile
(
    mobile_id int not null primary key auto_increment,
    mobile_no char(10) not null unique
);

create table enduser1
(
    id int not null primary key auto_increment,
    uid int not null,
    uname varchar(50) not null,    
    mobile_id int not null unique,
    foreign key fk_mobile_id(mobile_id)
    references mobile(mobile_id)
);

insert into mobile (mobile_no) values("9393939934");
insert into mobile (mobile_no) values("8393939934");
insert into mobile (mobile_no) values("7393939934");
insert into mobile (mobile_no) values("9393938834");
insert into mobile (mobile_no) values("9343939934");
insert into mobile (mobile_no) values("9399939934");
insert into mobile (mobile_no) values("8393955534");
insert into mobile (mobile_no) values("7393259934");
insert into mobile (mobile_no) values("8883938834");
insert into mobile (mobile_no) values("9343939111");

insert into enduser1(uid,uname,mobile_id) values(1,"Raj",3);
insert into enduser1(uid,uname,mobile_id) values(2,"Manoj",1);
insert into enduser1(uid,uname,mobile_id) values(3,"Suresh",6);
insert into enduser1(uid,uname,mobile_id) values(1,"Raj",5);
insert into enduser1(uid,uname,mobile_id) values(3,"Suresh",10);
insert into enduser1(uid,uname,mobile_id) values(4,"Ramesh",8);
insert into enduser1(uid,uname,mobile_id) values(2,"Manoj",2);
insert into enduser1(uid,uname,mobile_id) values(4,"Ramesh",9);
insert into enduser1(uid,uname,mobile_id) values(1,"Raj",4);
insert into enduser1(uid,uname,mobile_id) values(2,"Manoj",7);

select e.uname,m.mobile_no 
from enduser1 as e
inner join mobile as m
on e.mobile_id = m.mobile_id;

delete from mobile where mobile_id = 3;

