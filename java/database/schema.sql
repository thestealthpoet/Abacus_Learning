BEGIN TRANSACTION;

DROP TABLE IF EXISTS course_users;
DROP TABLE IF EXISTS grades;
DROP TABLE IF EXISTS assignments;
DROP TABLE IF EXISTS topics;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS users;

DROP SEQUENCE IF EXISTS seq_user_id;
DROP SEQUENCE IF EXISTS seq_course_id;
DROP SEQUENCE IF EXISTS seq_topic_id;
DROP SEQUENCE IF EXISTS seq_assignment_id;


CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE SEQUENCE seq_course_id
  INCREMENT BY 1
  START WITH 1001
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE SEQUENCE seq_topic_id
  INCREMENT BY 1
  START WITH 2001
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE SEQUENCE seq_assignment_id
  INCREMENT BY 1
  START WITH 3001
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE TABLE users (
        user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
        name varchar(50) NOT NULL,
        email_address varchar(50) NOT NULL,	    
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE courses (
        course_id int DEFAULT nextval ('seq_course_id'::regclass) NOT NULL,
        course_name varchar(75) NOT NULL,
        course_teacher int,
        description varchar(300) NOT NULL,
        difficulty_level varchar(20) NOT NULL,
        class_time TIMESTAMP NOT NULL,                                           
        CONSTRAINT PK_course PRIMARY KEY (course_id),
        CONSTRAINT FK_course_teacher_user FOREIGN KEY (course_teacher) REFERENCES users (user_id)
);

CREATE TABLE topics (
        topic_id int DEFAULT nextval('seq_topic_id'::regclass) NOT NULL,
        course_id int,
        topic_name varchar(50) NOT NULL,
        description varchar(200),
        topic_due_date TIMESTAMP NOT NULL,
        topic_teach_date TIMESTAMP,
        CONSTRAINT PK_topic PRIMARY KEY (topic_id),
        CONSTRAINT FK_topic_course FOREIGN KEY (course_id) REFERENCES courses (course_id)
);

CREATE TABLE assignments (
        assignment_id int DEFAULT nextval('seq_assignment_id'::regclass) NOT NULL,
        topic_id int,
        assignment_name varchar(50) NOT NULL,
        due_date TIMESTAMP,
        assignment_type varchar(50) NOT NULL,
        CONSTRAINT PK_assignment PRIMARY KEY (assignment_id),
        CONSTRAINT FK_assignment_topic FOREIGN KEY (topic_id) REFERENCES topics (topic_id)
);

CREATE TABLE grades (
        user_id int,
        assignment_id int,
        is_complete BOOLEAN,
        time_turned_in TIMESTAMP,
        grade DECIMAL(5,2),
        CONSTRAINT FK_grade_user FOREIGN KEY (user_id) REFERENCES users (user_id),
        CONSTRAINT FK_grade_assignment FOREIGN KEY (assignment_id) REFERENCES assignments (assignment_id),
        CONSTRAINT CHK_grade CHECK (grade<100.00 AND grade>0.00)        
);

CREATE TABLE course_users (
        user_id int,
        class_id int,
        CONSTRAINT PK_course_user PRIMARY KEY (user_id, class_id),
        CONSTRAINT FK_course_user_user FOREIGN KEY (user_id) REFERENCES users (user_id),
        CONSTRAINT FK_course_user_course FOREIGN KEY (class_id) REFERENCES courses (course_id)
);

--USERS
INSERT INTO users (name,email_address,username,password_hash,role) VALUES ('Test User','useremail@email.com','user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (name,email_address,username,password_hash,role) VALUES ('Test Admin', 'adminemail@email.com','admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (name,email_address,username,password_hash,role) VALUES ('Sally Test', 'testMeFindOut@test.com','missTest','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (name,email_address,username,password_hash,role) VALUES ('Naomi Johnson','n.johnson@test.com','user4','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (name,email_address,username,password_hash,role) VALUES ('Ken Anthony','k.anthony@test.com','user5','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (name,email_address,username,password_hash,role) VALUES ('Crystal Smith','c.smith@test.com','user6','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (name,email_address,username,password_hash,role) VALUES ('Jessica Stark','j.stark@test.com','user7','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (name,email_address,username,password_hash,role) VALUES ('Travis Diaz','t.diaz@test.com','user8','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (name,email_address,username,password_hash,role) VALUES ('Zola Lewis','z.lewis@test.com','user9','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (name,email_address,username,password_hash,role) VALUES ('Alex Harrison','a.harrison@test.com','user10','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (name,email_address,username,password_hash,role) VALUES ('Cierra Taylor','c.taylor@test.com','user11','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (name,email_address,username,password_hash,role) VALUES ('George Noble','g.noble@test.com','user12','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (name,email_address,username,password_hash,role) VALUES ('Roberto Garcia','r.garcia@test.com','user13','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');

--COURSES
INSERT INTO courses (course_id, course_name, course_teacher, description, difficulty_level, class_time) VALUES (1001, 'Game Show Mythology and Western Ego', 2, 'An exploration of the personalities behind the most popular game shows, informed by David Foster Wallace''s story Little Expressionless Animals.', 'Medium', '2021-12-12 10:00:00');
INSERT INTO courses (course_id, course_name, course_teacher, description, difficulty_level, class_time) VALUES (1002, 'Introduction to SQL Queries', 2, 'Come prepared with your caps lock, a large computer screen, and a penchant for key-making.', 'Medium', '2021-11-12 12:00:00');
INSERT INTO courses (course_id, course_name, course_teacher, description, difficulty_level, class_time) VALUES (1003, 'How to Win Friends and Influence People', 3, 'The text for this course has been in publication since 1936 and has sold over 15 million copies. Maybe you''ll be number 16 million.','Novice', '2021-10-04 09:00:00');
INSERT INTO courses (course_id, course_name, course_teacher, description, difficulty_level, class_time) VALUES (1004, 'Pokemon 101', 3, 'For those late to this party, we have all of your basics: from cards, to animations, to tournaments.','Experienced', '2021-10-04 11:00:00');
INSERT INTO courses (course_id, course_name, course_teacher, description, difficulty_level, class_time) VALUES (1005, 'Underwater Basket Weaving', 3, 'Step by step course on basics of weaving baskets underwater.','Novice', '2021-10-04 13:00:00');
INSERT INTO courses (course_id, course_name, course_teacher, description, difficulty_level, class_time) VALUES (1006, 'Demystifying Wine Terminology', 4, 'We''ll focus on some classics: garrigue, petrol, and barnyard, and work our way into modern oenological phenomena.', 'Novice', '2021-10-21 13:00:00');
INSERT INTO courses (course_id, course_name, course_teacher, description, difficulty_level, class_time) VALUES (1007, 'Crosswording for Beginners', 5, 'We''ll go through the NYT crossword every Monday through Wednesday to cover puns, famous people and places commonly used in crosswords, the importance of uncovering the theme quickly.', 'Novice', '2021-10-15 14:00:00');


--COURSE_USERS
INSERT INTO course_users (class_id, user_id) VALUES (1001, 1);
INSERT INTO course_users (class_id, user_id) VALUES (1001, 4);
INSERT INTO course_users (class_id, user_id) VALUES (1002, 5);
INSERT INTO course_users (class_id, user_id) VALUES (1002, 6);
INSERT INTO course_users (class_id, user_id) VALUES (1003, 7);
INSERT INTO course_users (class_id, user_id) VALUES (1003, 8);
INSERT INTO course_users (class_id, user_id) VALUES (1003, 9);
INSERT INTO course_users (class_id, user_id) VALUES (1003, 10);
INSERT INTO course_users (class_id, user_id) VALUES (1004, 11);
INSERT INTO course_users (class_id, user_id) VALUES (1004, 12);
INSERT INTO course_users (class_id, user_id) VALUES (1005, 13);
INSERT INTO course_users (class_id, user_id) VALUES (1006, 3);
INSERT INTO course_users (class_id, user_id) VALUES (1005, 11);
INSERT INTO course_users (class_id, user_id) VALUES (1007, 4);
INSERT INTO course_users (class_id, user_id) VALUES (1007, 8);

--TOPICS
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2001, 1001, 'Pat Sajack', 'He has held his position at Wheel of Fortune since 1981: what we know, and don''t know about him.', '2021-12-12 11:59:00', '2021-12-04 10:00:00');
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2002, 1001, 'Alex Trebeck', 'He is, and will continue to be missed. The legend, and the inspiration for ''Tiny Expresionless Animals''', '2021-12-12 11:59:00', '2021-12-04 10:00:00');
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2003, 1004, 'Pokemon Types', 'Deep dive into the 18 Pokemon types', '2021-10-11 09:00:00', '2021-10-04 09:00:00');
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2004, 1004, 'Pokemon Abilities', 'Deep dive into the 100s of Pokemon abilities', '2021-10-18 09:00:00', '2021-10-1 09:00:00');
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2005, 1004, 'Pokemon Evolution', 'Methods and nuances of Pokemon evolution', '2021-10-25 09:00:00', '2021-10-18 09:00:00');
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2006, 1005, 'Safety', 'Best safety practices when weaving baskets underwater', '2021-10-11 13:00:00', '2021-10-04 13:00:00');
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2007, 1002, 'How to Use Select *', 'Definitely not a best practice, but generally quicker than typing column names', '2021-10-14 13:00:00', '2021-10-7 13:00:00' );


--ASSIGNMENTS
INSERT INTO assignments (assignment_id, topic_id, assignment_name, due_date, assignment_type) VALUES (3001, 2004, 'Pokemon101: Type Chart Homework', '2021-10-11 09:00:00', 'Homework');
INSERT INTO assignments (assignment_id, topic_id, assignment_name, due_date, assignment_type) VALUES (3002, 2005, 'Pokemon101: Pokemon Evolution Quiz', '2021-10-15 09:00:00', 'Quiz');
INSERT INTO assignments (assignment_id, topic_id, assignment_name, due_date, assignment_type) VALUES (3003, 2003, 'Pokemon101: Pokemon Types Homework', '2021-10-07 9:00:00', 'Homework');

--GRADES


COMMIT TRANSACTION;




