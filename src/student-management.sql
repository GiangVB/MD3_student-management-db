create database quanlysinhvien;
use quanlysinhvien;

create table class(
    ClassID int not null primary key auto_increment,
    ClassName varchar(60) not null ,
    StartDate datetime not null ,
    Status bit
);

create table student(
    StudentID int not null primary key auto_increment,
    StudentName varchar(30) not null ,
    Address varchar(50),
    Phone varchar(20),
    Status bit,
    ClassID int not null ,
    FOREIGN KEY (ClassID) REFERENCES class(ClassID)
);

create table subject(
    SubID int not null primary key auto_increment,
    SubName varchar(30) not null ,
    Credit tinyint not null default 1 check (Credit >= 1),
    Status bit default 1
);

create table mark(
    MarkID int not null primary key auto_increment,
    SubID int not null ,
    StudentID int not null ,
    Mark float default 1 check (Mark between 0 and 100),
    ExamTimes tinyint default 1,
    unique (SubID,StudentID),
    foreign key (SubID) references subject(SubID),
    foreign key (StudentID) references student(StudentID)
);

INSERT INTO Class VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class VALUES (3, 'B3', current_date, 0);

INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (StudentName, Address, Status, ClassId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);

INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);

SELECT *
FROM Student;

SELECT *
FROM Student
WHERE Status = true;

SELECT *
FROM Subject
WHERE Credit < 10;

SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID
WHERE C.ClassName = 'A1';

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';

SELECT *
FROM student WHERE StudentName LIKE 'H%';

SELECT *
FROM class WHERE StartDate >= '2008-12-01' AND StartDate <= '2008-12-31';

SELECT *
FROM subject WHERE Credit BETWEEN 3 AND 5;

UPDATE student SET ClassID = 2 WHERE StudentName = 'Hung';

SELECT S.StudentName, Sub.SubName, M.Mark
FROM student S join  Mark M ON S.StudentID = M.StudentID join Subject Sub on M.SubID = Sub.SubID
ORDER BY M.Mark DESC;