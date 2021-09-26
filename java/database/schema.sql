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
        course_name varchar(50) NOT NULL,
        course_teacher int,
        description varchar(75) NOT NULL,
        difficulty_level varchar(20) NOT NULL,
        class_time TIMESTAMP NOT NULL,                                           
        CONSTRAINT PK_course PRIMARY KEY (course_id),
        CONSTRAINT FK_course_teacher_user FOREIGN KEY (course_teacher) REFERENCES users (user_id)
);

CREATE TABLE topics (
        topic_id int DEFAULT nextval('seq_topic_id'::regclass) NOT NULL,
        course_id int,
        topic_name varchar(50) NOT NULL,
        description varchar(75),
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
INSERT INTO courses (course_id, course_name, course_teacher, description, difficulty_level, class_time) VALUES (1001, 'Math', 2, 'Basic Mathematics', 'Medium', '2021-12-12 10:00:00');
INSERT INTO courses (course_id, course_name, course_teacher, description, difficulty_level, class_time) VALUES (1002, 'Biology', 2, 'Study of living organisms', 'Medium', '2021-11-12 12:00:00');
INSERT INTO courses (course_id, course_name, course_teacher, description, difficulty_level, class_time) VALUES (1003, 'Reading', 3, 'The fundamentals of reading your enemies for filth.','Novice', '2021-10-04 09:00:00');
INSERT INTO courses (course_id, course_name, course_teacher, description, difficulty_level, class_time) VALUES (1004, 'Pokemon 101', 3, 'How to become the very best.','Experienced', '2021-10-04 11:00:00');
INSERT INTO courses (course_id, course_name, course_teacher, description, difficulty_level, class_time) VALUES (1005, 'Underwater Basket Weaving', 3, 'Step by step course on basics of weaving baskets underwater.','Novice', '2021-10-04 13:00:00');

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

--TOPICS
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2002, 1001, 'topic1', null, '2021-12-12 11:59:00', '2021-12-04 10:00:00');
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2003, 1001, 'topic2', null, '2021-12-12 11:59:00', '2021-12-04 10:00:00');
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2004, 1004, 'Pokemon Types', 'Deep dive into the 18 Pokemon types', '2021-10-11 09:00:00', '2021-10-04 09:00:00');       
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2005, 1004, 'Pokemon Abilities', 'Deep dive into the 100s of Pokemon abilities', '2021-10-18 09:00:00', '2021-10-1 09:00:00');
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2006, 1004, 'Pokemon Evolution', 'Methods and nuances of Pokemon evolution', '2021-10-25 09:00:00', '2021-10-18 09:00:00');
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2007, 1005, 'Safety', 'Best safety practices when weaving baskets underwater', '2021-10-11 13:00:00', '2021-10-04 13:00:00');

--ASSIGNMENTS
INSERT INTO assignments (assignment_id, topic_id, assignment_name, due_date, assignment_type) VALUES (3001, 2004, 'Type Chart', '2021-10-11 09:00:00', 'Homework');

--GRADES


COMMIT TRANSACTION;




