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
        topic_name varchar(100) NOT NULL,
        description varchar(200),
        topic_due_date TIMESTAMP NOT NULL,
        topic_teach_date TIMESTAMP,
        CONSTRAINT PK_topic PRIMARY KEY (topic_id),
        CONSTRAINT FK_topic_course FOREIGN KEY (course_id) REFERENCES courses (course_id)
);

CREATE TABLE assignments (
        assignment_id int DEFAULT nextval('seq_assignment_id'::regclass) NOT NULL,
        topic_id int,
        assignment_name varchar(150) NOT NULL,
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
INSERT INTO users (user_id, name,email_address,username,password_hash,role) VALUES (100, 'Test User','useremail@email.com','user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (user_id, name,email_address,username,password_hash,role) VALUES (101, 'Test Admin', 'adminemail@email.com','admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (user_id, name,email_address,username,password_hash,role) VALUES (102, 'Sally Test', 'testMeFindOut@test.com','missTest','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (user_id, name,email_address,username,password_hash,role) VALUES (103, 'Naomi Johnson','n.johnson@test.com','user4','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (user_id, name,email_address,username,password_hash,role) VALUES (104, 'Ken Anthony','k.anthony@test.com','user5','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (user_id, name,email_address,username,password_hash,role) VALUES (105, 'Crystal Smith','c.smith@test.com','user6','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (user_id, name,email_address,username,password_hash,role) VALUES (106, 'Jessica Stark','j.stark@test.com','user7','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (user_id, name,email_address,username,password_hash,role) VALUES (107, 'Travis Diaz','t.diaz@test.com','user8','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (user_id, name,email_address,username,password_hash,role) VALUES (108, 'Zola Lewis','z.lewis@test.com','user9','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (user_id, name,email_address,username,password_hash,role) VALUES (109, 'Alex Harrison','a.harrison@test.com','user10','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (user_id, name,email_address,username,password_hash,role) VALUES (110, 'Cierra Taylor','c.taylor@test.com','user11','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (user_id, name,email_address,username,password_hash,role) VALUES (111, 'George Noble','g.noble@test.com','user12','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (user_id, name,email_address,username,password_hash,role) VALUES (112, 'Roberto Garcia','r.garcia@test.com','user13','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');

--COURSES
INSERT INTO courses (course_id, course_name, course_teacher, description, difficulty_level, class_time) VALUES (1101, 'Game Show Mythology and Western Ego', 102, 'An exploration of the personalities behind the most popular game shows, informed by David Foster Wallace''s story ''Little Expressionless Animals''.', 'Medium', '2021-12-12 10:00:00');
INSERT INTO courses (course_id, course_name, course_teacher, description, difficulty_level, class_time) VALUES (1102, 'Introduction to SQL Queries', 102, 'Come prepared with your caps lock, a large computer screen, and a penchant for key-making.', 'Medium', '2021-11-12 12:00:00');
INSERT INTO courses (course_id, course_name, course_teacher, description, difficulty_level, class_time) VALUES (1103, 'How to Win Friends and Influence People', 103, 'The text for this course has been in publication since 1936 and has sold over 15 million copies. Maybe you''ll be number 16 million.','Novice', '2021-10-04 09:00:00');
INSERT INTO courses (course_id, course_name, course_teacher, description, difficulty_level, class_time) VALUES (1104, 'Pokemon 101', 103, 'For those late to this party, we have all of your basics: from cards, to animations, to tournaments.','Experienced', '2021-10-04 11:00:00');
INSERT INTO courses (course_id, course_name, course_teacher, description, difficulty_level, class_time) VALUES (1105, 'Underwater Basket Weaving', 103, 'Step by step course on basics of weaving baskets underwater.','Novice', '2021-10-04 13:00:00');
INSERT INTO courses (course_id, course_name, course_teacher, description, difficulty_level, class_time) VALUES (1106, 'Demystifying Wine Terminology', 104, 'We''ll focus on some classics: garrigue, petrol, and barnyard, and work our way into modern oenological phenomena.', 'Novice', '2021-10-21 13:00:00');
INSERT INTO courses (course_id, course_name, course_teacher, description, difficulty_level, class_time) VALUES (1107, 'Crosswording for Beginners', 105, 'We''ll go through the NYT crossword every Monday through Wednesday to cover puns, famous people and places commonly used in crosswords, the importance of uncovering the theme quickly.', 'Novice', '2021-10-15 14:00:00');


--COURSE_USERS
INSERT INTO course_users (class_id, user_id) VALUES (1101, 101);
INSERT INTO course_users (class_id, user_id) VALUES (1101, 104);
INSERT INTO course_users (class_id, user_id) VALUES (1102, 105);
INSERT INTO course_users (class_id, user_id) VALUES (1102, 106);
INSERT INTO course_users (class_id, user_id) VALUES (1103, 107);
INSERT INTO course_users (class_id, user_id) VALUES (1103, 108);
INSERT INTO course_users (class_id, user_id) VALUES (1103, 109);
INSERT INTO course_users (class_id, user_id) VALUES (1103, 110);
INSERT INTO course_users (class_id, user_id) VALUES (1104, 111);
INSERT INTO course_users (class_id, user_id) VALUES (1104, 112);
INSERT INTO course_users (class_id, user_id) VALUES (1105, 104);
INSERT INTO course_users (class_id, user_id) VALUES (1106, 103);
INSERT INTO course_users (class_id, user_id) VALUES (1105, 111);
INSERT INTO course_users (class_id, user_id) VALUES (1107, 104);
INSERT INTO course_users (class_id, user_id) VALUES (1107, 108);
INSERT INTO course_users (class_id, user_id) VALUES (1106, 108);
INSERT INTO course_users (class_id, user_id) VALUES (1105, 112);
INSERT INTO course_users (class_id, user_id) VALUES (1101, 106);
INSERT INTO course_users (class_id, user_id) VALUES (1107, 110);
INSERT INTO course_users (class_id, user_id) VALUES (1107, 109);
INSERT INTO course_users (class_id, user_id) VALUES (1105, 108);

--TOPICS
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2101, 1101, 'Pat Sajak', 'He has held his position at Wheel of Fortune since 1981: what we know, and don''t know about him.', '2021-12-12 09:00:00', '2021-12-04 10:00:00');
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2102, 1101, 'Alex Trebeck', 'He is, and will continue to be missed. The legend, and the inspiration for ''Tiny Expresionless Animals''', '2021-11-12 09:00:00', '2021-12-04 10:00:00');

INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2201, 1104, 'Pokemon Types', 'Deep dive into the 18 Pokemon types', '2021-09-17 09:00:00', '2021-09-13 09:00:00');
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2202, 1104, 'Pokemon Abilities', 'Deep dive into the 100s of Pokemon abilities', '2021-09-24 09:00:00', '2021-09-20 09:00:00');
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2203, 1104, 'Catching Pokemon', 'Technique, PokeBalls, and Catch Rates', '2021-10-01 09:00:00', '2021-09-27 09:00:00');
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2204, 1104, 'Pokemon Training', 'Best practices to leveling up your Pokemon', '2021-10-08 09:00:00', '2021-09-27 09:00:00');
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2205, 1104, 'Items', 'Exploration of Poke items, including held items', '2021-10-15 09:00:00', '2021-09-27 09:00:00');
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2206, 1104, 'Pokemon Battling Part 1', '101 of Battling', '2021-10-22 09:00:00', '2021-09-27 09:00:00');
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2207, 1104, 'Pokemon Battling Part2', 'Double battles, triple battles, and more!', '2021-10-29 09:00:00', '2021-09-27 09:00:00');
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2208, 1104, 'Pokemon Evolution', 'Methods of Evolution and Evolution Trees', '2021-11-05 09:00:00', '2021-09-27 09:00:00');
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2209, 1104, 'Pokemon Breeding', 'Daycare, egg moves, and abilities', '2021-11-12 09:00:00', '2021-09-27 09:00:00');
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2210, 1104, 'Pokemon Career Paths', 'Trainers, Breeders, Gym Leaders, OH MY!', '2021-11-19 09:00:00', '2021-09-27 09:00:00');

INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2106, 1105, 'Safety', 'Best safety practices when weaving baskets underwater', '2021-10-11 13:00:00', '2021-10-04 13:00:00');
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2107, 1102, 'How to Use Select *', 'Definitely not a best practice, but generally quicker than typing column names', '2021-10-14 13:00:00', '2021-10-7 13:00:00');
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2108, 1103, 'Addressing Other People by Their Names', 'One of the Fundamental Takeaways', '2021-10-08 09:00:00', '2021-10-04 09:00:00');
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2109, 1106, 'From the Beginning: French Sparkling Wine Terminology', 'Pet-Nats, Bruts, and Cremants', '2021-10-21 09:00:00', '2021-10-23 09:00:00');
INSERT INTO topics(topic_id, course_id, topic_name, description, topic_due_date, topic_teach_date) VALUES (2110, 1107, 'Understanding Themes', 'Common crossword themes: from card games to travel', '2021-10-15 09:00:00', '2021-10-17 09:00:00');

--ASSIGNMENTS
INSERT INTO assignments (assignment_id, topic_id, assignment_name, due_date, assignment_type) VALUES (3201, 2201, 'Pokemon Type Chart', '2021-10-11 11:59:00', 'Quiz');
INSERT INTO assignments (assignment_id, topic_id, assignment_name, due_date, assignment_type) VALUES (3202, 2202, 'Abilities Flash Cards', '2021-10-15 11:59:00', 'Homework');
INSERT INTO assignments (assignment_id, topic_id, assignment_name, due_date, assignment_type) VALUES (3203, 2203, 'Pokeball catch rates', '2021-10-07 11:59:00', 'Quiz');
INSERT INTO assignments (assignment_id, topic_id, assignment_name, due_date, assignment_type) VALUES (3204, 2204, 'Pokemon Stats Paper', '2021-10-07 11:59:00', 'Homework');
INSERT INTO assignments (assignment_id, topic_id, assignment_name, due_date, assignment_type) VALUES (3205, 2205, 'PokeMart Excursion', '2021-10-07 11:59:00', 'Homework');
INSERT INTO assignments (assignment_id, topic_id, assignment_name, due_date, assignment_type) VALUES (3206, 2206, 'Battle Journal', '2021-10-07 11:59:00', 'Homework');
INSERT INTO assignments (assignment_id, topic_id, assignment_name, due_date, assignment_type) VALUES (3207, 2207, 'Battle Video', '2021-10-07 11:59:00', 'Homework');
INSERT INTO assignments (assignment_id, topic_id, assignment_name, due_date, assignment_type) VALUES (3208, 2208, 'Evolution Path Chart', '2021-10-07 11:59:00', 'Homework');
INSERT INTO assignments (assignment_id, topic_id, assignment_name, due_date, assignment_type) VALUES (3209, 2209, 'Pokemon Daycare Quiz', '2021-10-07 11:59:00', 'Quiz');
INSERT INTO assignments (assignment_id, topic_id, assignment_name, due_date, assignment_type) VALUES (3210, 2210, 'I want to be the very best paper', '2021-10-07 11:59:00', 'Homework');

INSERT INTO assignments (assignment_id, topic_id, assignment_name, due_date, assignment_type) VALUES (3104, 2101, 'Game Show Mythology and Western Ego: Pat Sajak', '2021-12-14 09:00:00', 'Homework');
INSERT INTO assignments (assignment_id, topic_id, assignment_name, due_date, assignment_type) VALUES (3105, 2102, 'Game Show Mythology and Western Ego: Alex Trebeck', '2021-10-14 09:00:00', 'Quiz');
INSERT INTO assignments (assignment_id, topic_id, assignment_name, due_date, assignment_type) VALUES (3106, 2106, 'Underwater Basket Weaving: Safety', '2021-10-14 09:00:00', 'Homework');
INSERT INTO assignments (assignment_id, topic_id, assignment_name, due_date, assignment_type) VALUES (3107, 2108, 'How to Win Friends and Influence People: Using Names', '2021-10-08 09:00:00', 'Quiz');
INSERT INTO assignments (assignment_id, topic_id, assignment_name, due_date, assignment_type) VALUES (3108, 2109, 'Demystifying Wine Terminology: French Sparkling', '2021-10-23 09:00:00', 'Homework');
INSERT INTO assignments (assignment_id, topic_id, assignment_name, due_date, assignment_type) VALUES (3109, 2110, 'Crosswording for Beginners: Understanding Themes', '2021-10-17 09:00:00', 'Homework');
INSERT INTO assignments (assignment_id, topic_id, assignment_name, due_date, assignment_type) VALUES (3110, 2110,'Crosswording for Beginners: Understanding Themes', '2021-10-19 09:00:00', 'Quiz');
INSERT INTO assignments (assignment_id, topic_id, assignment_name, due_date, assignment_type) VALUES (3111, 2110, 'Demystifying Wine Terminology: French Sparkling', '2021-10-25 09:00:00', 'Quiz');
INSERT INTO assignments (assignment_id, topic_id, assignment_name, due_date, assignment_type) VALUES (3112, 2106, 'Underwater Basket Weaving: Safety', '2021-10-17 09:00:00', 'Quiz');

--GRADES


COMMIT TRANSACTION;




