
-- INSERT Countries
INSERT INTO country(code, name)
VALUES ('AT', 'Österreich');
INSERT INTO country(code, name)
VALUES ('DE', 'Deutschland');
INSERT INTO country(code, name)
VALUES ('CH', 'Schweiz');
INSERT INTO country(code, name)
VALUES ('ES', 'Spanien');
INSERT INTO country(code, name)
VALUES ('FR', 'Frankreich');
INSERT INTO country(code, name)
VALUES ('US', 'USA');
INSERT INTO country(code, name)
VALUES ('UK', 'Großbritanien');
INSERT INTO country(code, name)
VALUES ('IT', 'Italien');

-- INSERT Cities
INSERT INTO city(city, postalcode, country_id)
VALUES('Linz', '4040', 1);
INSERT INTO city(city, postalcode, country_id)
VALUES('Leonding', '4060', 1);
INSERT INTO city(city, postalcode, country_id)
VALUES('Eferding', '4070', 1);
INSERT INTO city(city, postalcode, country_id)
VALUES('Hamburg', '20097', 2);
INSERT INTO city(city, postalcode, country_id)
VALUES('Berlin', '10115', 2);
INSERT INTO city(city, postalcode, country_id)
VALUES('Bern', '3001', 3);
INSERT INTO city(city, postalcode, country_id)
VALUES('Scharten', '4612', 1);
INSERT INTO city(city, postalcode, country_id)
VALUES('Freistadt', '4240', 1);

-- INSERT Studios
INSERT INTO studio(address, name, city_id)
VALUES('Gewerbestraße 2', 'FitIn Eferding', 3);
INSERT INTO studio(address, name, city_id)
VALUES('Pulvermühlstraße 30', 'InJoy Linz', 1);
INSERT INTO studio(address, name, city_id)
VALUES('Albrechtstraße 12', 'SPEED.FIT Berlin Mitte', 5);

-- INSERT Customers
INSERT INTO customer(address, birthdate, email, firstname, lastname, city_id, studio_id)
VALUES('Grießmayerstraße 23', '1995-04-22', 'foo@bar.at', 'Foo', 'Bar', 1, 1);
INSERT INTO customer(address, birthdate, email, firstname, lastname, city_id, studio_id)
VALUES('Wiener Straße 182', '1989-02-06', 'h.aiden@livest.at', 'Hunter', 'Aiden', 1, 1);
INSERT INTO customer(address, birthdate, email, firstname, lastname, city_id, studio_id)
VALUES('Limesstraße 12', '1999-10-01', 'mark.steiner@gmx.com', 'Mark', 'Steiner', 2, 1);
INSERT INTO customer(address, birthdate, email, firstname, lastname, city_id, studio_id)
VALUES('Karl-Schachinger-Straße 4', '2000-02-22', 'klaus.civi@outlook.at', 'Klaus', 'Civi', 3, 2);
INSERT INTO customer(address, birthdate, email, firstname, lastname, city_id, studio_id)
VALUES('Alsterdorfer Straße 99', '2096-11-30', 'patrick.mayer@outlook.de', 'Patrick', 'Mayer', 4, 2);
INSERT INTO customer(address, birthdate, email, firstname, lastname, city_id, studio_id)
VALUES('Scharten 161', '2010-08-12', 'ju.strasser10@gmail.com', 'Julia', 'Strasser', 7, 3);

-- INSERT ActivationCodes
INSERT INTO activationcode(code, valid, customer_id)
VALUES ('aawh3982hu2h225089hhv4we875=', true, 1);
INSERT INTO activationcode(code, valid, customer_id)
VALUES ('0853af768ca4ae8086b96a8db0acf8be', false, 1);
INSERT INTO activationcode(code, valid, customer_id)
VALUES ('g2b3def0a16f2959c98b7882ba45f421', false, 1);
INSERT INTO activationcode(code, valid, customer_id)
VALUES ('98f38f2f12b2e7205514aff1106969bc', true, 2);
INSERT INTO activationcode(code, valid, customer_id)
VALUES ('603d3c7f6b97bc5a474d4d2d40078ce2', true, 3);
INSERT INTO activationcode(code, valid, customer_id)
VALUES ('635eb51948fb362707283b2ded20d414', true, 4);
INSERT INTO activationcode(code, valid, customer_id)
VALUES ('4452ca34b985550e03ee7a53c42af8ad', false, 2);
INSERT INTO activationcode(code, valid,customer_id)
VALUES ('a05f74f92d9800ca1ef3d1f9b4203a2b', false, 2);
INSERT INTO activationcode(code, valid, customer_id)
VALUES ('81b1099281434aa2af89eb696a11e7b2', true, 5);
INSERT INTO activationcode(code, valid, customer_id)
VALUES ('e29143ec90eb3dee3b19688757a4f91c', false, 3);
INSERT INTO activationcode(code, valid,customer_id)
VALUES ('ec1ff1c34fd0eaaae77411d48f387daf', false, 3);
INSERT INTO activationcode(code, valid, customer_id)
VALUES ('2313abf64e71f0072400fa32aba5be15', true, 6);

-- INSERT Devicegroups
INSERT INTO devicegroup(name, description) VALUES('Monkeybar', 'Eine Monkeybar ist eine um 90 Grad gedrehte Hantelbank.');
INSERT INTO devicegroup(name, description) VALUES('Trainingsmatte', 'Eine Trainingsmatte wird genutzt, um auf weicherem Untergrund trainieren zu können.');
INSERT INTO devicegroup(name, description) VALUES('Beinpresse', 'Die Beinpresse wird genutzt, um die Beinmuskeln zu stärken.');
INSERT INTO devicegroup(name, description) VALUES('Laufband', 'Ein Laufband ist als Ersatz zum physischen Laufen gedacht bzw. wenn das Wetter nichts anderes zulässt.');
INSERT INTO devicegroup(name, description) VALUES('Indoorbike', 'Ein Indoorbike ist als Ersatz zum physischen Rad fahren gedacht bzw. wenn das Wetter nichts anderes zulässt.');
INSERT INTO devicegroup(name, description) VALUES('Ergometer', 'Auch Fahrradergometer wird ebenfalls ähnlich wie das Indoorbike genutzt.');

-- INSERT Devices
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id)
VALUES('Die Monkeybar ist quasi eine um 90 Grad gedrehte Hantelbank.', 'Monkeybar Mini', 22, 1, 1);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id)
VALUES('Die Beinpresse wird genutzt, um die Beinmuskeln zu stärken.', '45 Grad Beinpresse', 15, 3, 1);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id)
VALUES('Die Fußplatte bewegt sich parallel zum Boden.', 'horizontale Beinpresse', 16, 3, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id)
VALUES('Die Beinpresse wird genutzt, um die Beinmuskeln zu stärken.', 'vertikale Beinpresse', 17, 3, 2);

-- INSERT Workoutplans
INSERT INTO workoutplan(archived, name, valid_from, valid_till, description, customer_id)
VALUES(false, 'Demo-Trainingsplan 1', '2020-12-25', null, 'Das ist ein Demo Trainingsplan.', 1);
INSERT INTO workoutplan(archived, name, valid_from, valid_till, description, customer_id)
VALUES(true, 'Demo-Trainingsplan 2', '2021-01-10', '2021-02-15', 'Das ist ein Demo Trainingsplan 2.',  2);

-- INSERT Workouts
INSERT INTO exercise(description, name, devicegroup_id, workoutplan_id, sort_identifier)
VALUES('', 'Beinpresse', 3, 1, 1);
INSERT INTO exercise(description, name, devicegroup_id, workoutplan_id, sort_identifier)
VALUES('', 'Beinpresse', 3, 1, 2);
INSERT INTO exercise(description, name, devicegroup_id, workoutplan_id, sort_identifier)
VALUES('', 'Liegestütze', 2, 1, 5);
INSERT INTO exercise(description, name, devicegroup_id, workoutplan_id, sort_identifier)
VALUES('', 'Push Ups', 2, 2, 1);
INSERT INTO exercise(description, name, devicegroup_id, workoutplan_id, sort_identifier)
VALUES('', 'Laufen', 4, 1, 9);
INSERT INTO exercise(description, name, devicegroup_id, workoutplan_id, sort_identifier)
VALUES('', 'Gehen', 4, 1, 3);
INSERT INTO exercise(description, name, devicegroup_id, workoutplan_id, sort_identifier)
VALUES('', 'Sprint', 4, 1, 6);
INSERT INTO exercise(description, name, devicegroup_id, workoutplan_id, sort_identifier)
VALUES('', 'Rad fahren', 5, 1, 7);
INSERT INTO exercise(description, name, devicegroup_id, workoutplan_id, sort_identifier)
VALUES('', 'Beinpresse', 3, 1, 8);
INSERT INTO exercise(description, name, devicegroup_id, workoutplan_id, sort_identifier)
VALUES('', 'Beinpresse', 3, 1, 4);

-- INSERT WorkoutSets
INSERT INTO exerciseset(description, repetitions, exercise_id, sort_identifier) VALUES('30kg', 5, 1, 1);
INSERT INTO exerciseset(description, repetitions, exercise_id, sort_identifier) VALUES('40kg', 10, 1, 3);
INSERT INTO exerciseset(description, repetitions, exercise_id, sort_identifier) VALUES('10kg', 20, 1, 2);
INSERT INTO exerciseset(description, repetitions, exercise_id, sort_identifier) VALUES('30kg', 7, 2, 1);
INSERT INTO exerciseset(description, repetitions, exercise_id, sort_identifier) VALUES('100m', 100, 7, 1);
INSERT INTO exerciseset(description, repetitions, exercise_id, sort_identifier) VALUES('15kg', 15, 2, 2);
INSERT INTO exerciseset(description, repetitions, exercise_id, sort_identifier) VALUES('20km', -1, 8, 3);
INSERT INTO exerciseset(description, repetitions, exercise_id, sort_identifier) VALUES('15km', -1, 8, 1);
INSERT INTO exerciseset(description, repetitions, exercise_id, sort_identifier) VALUES('10km', -1, 8, 2);
INSERT INTO exerciseset(description, repetitions, exercise_id, sort_identifier) VALUES('', 10, 3, 1);

-- INSERT Trainings
INSERT INTO training(date, starttime, endtime, workoutplan_id) VALUES('2020-12-30', '12:43:33', '13:43:33', 1);
INSERT INTO training(date, starttime, endtime, workoutplan_id) VALUES('2021-01-5', '09:21:10', '12:43:33', 1);
INSERT INTO training(date, starttime, endtime, workoutplan_id) VALUES('2021-01-10', '22:22:22', '22:59:50', 1);
INSERT INTO training(date, starttime, endtime, workoutplan_id) VALUES('2021-01-10', '01:00:00', '01:49:10', 2);
INSERT INTO training(date, starttime, endtime, workoutplan_id) VALUES('2021-01-15', '12:10:00', '12:14:56', 2);

-- INSERT HealthDataType
INSERT INTO healthdatatype(name) VALUES('Puls');
INSERT INTO healthdatatype(name) VALUES('Blutdruck');
INSERT INTO healthdatatype(name) VALUES('kcal');


--INSERT HealthData
INSERT INTO healthdata(time, value, healthdatatype_id, training_id, exerciseset_id)
VALUES('2020-12-30 10:35:33', 100, 1, 1, 1);
INSERT INTO healthdata(time, value, healthdatatype_id, training_id, exerciseset_id)
VALUES('2020-12-30 10:45:18', 104, 1, 1, 1);
INSERT INTO healthdata(time, value, healthdatatype_id, training_id, exerciseset_id)
VALUES('2020-12-30 11:55:03', 80, 2, 1, 1);
INSERT INTO healthdata(time, value, healthdatatype_id, training_id, exerciseset_id)
VALUES('2020-12-30 10:35:33', 14, 3, 1, 1);
INSERT INTO healthdata(time, value, healthdatatype_id, training_id, exerciseset_id)
VALUES('2020-12-30 10:35:33', 89, 1, 1, 2);
INSERT INTO healthdata(time, value, healthdatatype_id, training_id, exerciseset_id)
VALUES('2020-12-30 10:35:33', 88, 2, 1, 2);
INSERT INTO healthdata(time, value, healthdatatype_id, training_id, exerciseset_id)
VALUES('2020-12-30 10:35:33', 10, 3, 1, 2);