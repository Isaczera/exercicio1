CREATE DATABASE nutri; 
USE nutri;

CREATE TABLE user (
id INT NOT NULL AUTO_INCREMENT,
user_name VARCHAR(45) NOT NULL,
user_birthdate DATE NOT NULL,
user_height DOUBLE NOT NULL,
user_weight INT NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE day (
idday DATE NOT NULL,
user_name VARCHAR(45) NOT NULL,
user_id INT NOT NULL,
PRIMARY KEY (idday),
FOREIGN KEY (user_id) REFERENCES user(id)
); 
 
CREATE TABLE meals (
meal_num INT NOT NULL AUTO_INCREMENT,
calories INT NOT NULL,
fat INT NOT NULL,
carbohydrates INT NOT NULL,
fibre INT NOT NULL,
protein INT NOT NULL,
day_idday DATE NOT NULL,
PRIMARY KEY (meal_num),
FOREIGN KEY (day_idday) REFERENCES day(idday)
);

