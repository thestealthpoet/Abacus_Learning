SELECT *
from courses;

SELECT *
FROM users;

SELECT *
FROM course_users;

SELECT *
FROM users
JOIN course_users ON users.user_id = course_users.user_id
WHERE course_users.class_id = ?;