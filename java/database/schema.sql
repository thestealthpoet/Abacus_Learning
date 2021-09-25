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
        due_date TIMESTAMP NOT NULL,
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

INSERT INTO users (name,email_address,username,password_hash,role) VALUES ('Test User','useremail@email.com','user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (name,email_address,username,password_hash,role) VALUES ('Test Admin', 'adminemail@email.com','admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO courses (course_id, course_name, course_teacher, description, difficulty_level, class_time) VALUES (1001, 'math', 2, 'math', 'medium', '2021-12-12 00:01:00');
INSERT INTO course_users (class_id, user_id) VALUES (1001, 1);
INSERT INTO courses (course_id, course_name, course_teacher, description, difficulty_level, class_time) VALUES (1002, 'reading', 2, 'books', 'medium', '2021-11-12 00:01:00');
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES(1002, 1001, 'topic1', null, '2002-12-12 00:02:00', null);
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (1003, 1001, 'topic2', null, '2012-3-4 00:03:00', null);


COMMIT TRANSACTION;

--INSERT INTO users (user_id,name,email_address,username,password_hash,role) VALUES ('990','Naomi Johnson','n.johnson@test.com','user990','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
--INSERT INTO users (user_id,name,email_address,username,password_hash,role) VALUES ('991','Ken Anthony','k.anthony@test.com','user991','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
--INSERT INTO users (user_id,name,email_address,username,password_hash,role) VALUES ('992','Crystal Smith','c.smith@test.com','user992','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
--INSERT INTO users (user_id,name,email_address,username,password_hash,role) VALUES ('993','Jessica Stark','j.stark@test.com','user993','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
--INSERT INTO users (user_id,name,email_address,username,password_hash,role) VALUES ('994','Travis Diaz','t.diaz@test.com','user994','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
--INSERT INTO users (user_id,name,email_address,username,password_hash,role) VALUES ('995','Zola Lewis','z.lewis@test.com','user995','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
--INSERT INTO users (user_id,name,email_address,username,password_hash,role) VALUES ('996','Alex Harrison','a.harrison@test.com','user996','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
--INSERT INTO users (user_id,name,email_address,username,password_hash,role) VALUES ('997','Cierra Taylor','c.taylor@test.com','user997','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
--INSERT INTO users (user_id,name,email_address,username,password_hash,role) VALUES ('998','George Noble','g.noble@test.com','user998','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
--INSERT INTO users (user_id,name,email_address,username,password_hash,role) VALUES ('999','Roberto Garcia','r.garcia@test.com','user999','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');


































--INSERT INTO users (user_id,name,email_address,username,password_hash,role) VALUES ('990','Naomi Johnson','n.johnson@test.com','user990','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
--INSERT INTO users (user_id,name,email_address,username,password_hash,role) VALUES ('991','Ken Anthony','k.anthony@test.com','user991','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
--INSERT INTO users (user_id,name,email_address,username,password_hash,role) VALUES ('992','Crystal Smith','c.smith@test.com','user992','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
--INSERT INTO users (user_id,name,email_address,username,password_hash,role) VALUES ('993','Jessica Stark','j.stark@test.com','user993','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
--INSERT INTO users (user_id,name,email_address,username,password_hash,role) VALUES ('994','Travis Diaz','t.diaz@test.com','user994','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
--INSERT INTO users (user_id,name,email_address,username,password_hash,role) VALUES ('995','Zola Lewis','z.lewis@test.com','user995','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
--INSERT INTO users (user_id,name,email_address,username,password_hash,role) VALUES ('996','Alex Harrison','a.harrison@test.com','user996','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
--INSERT INTO users (user_id,name,email_address,username,password_hash,role) VALUES ('997','Cierra Taylor','c.taylor@test.com','user997','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
--INSERT INTO users (user_id,name,email_address,username,password_hash,role) VALUES ('998','George Noble','g.noble@test.com','user998','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
--INSERT INTO users (user_id,name,email_address,username,password_hash,role) VALUES ('999','Roberto Garcia','r.garcia@test.com','user999','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');

