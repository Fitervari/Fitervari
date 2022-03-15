
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
INSERT INTO studio(address, name, city_id)
VALUES('Karl-Schachinger-Straße 13', 'INJOY Eferding', 3);

-- INSERT Customers
INSERT INTO customer(address, birthdate, email, firstname, lastname, city_id, studio_id, activation_token)
VALUES('Grießmayerstraße 23', '1995-04-22', 'p.mayr@gmx.at', 'Peter', 'Mayr', 1, 1, '2313abf64e71f0072400fa32aba5be15');
INSERT INTO customer(address, birthdate, email, firstname, lastname, city_id, studio_id, activation_token, auth_token)
VALUES('Karl-Schachinger-Straße 4', '2000-02-22', 'k.lehner@outlook.at', 'Klaus', 'Lehner', 3, 2, 'g2b3def0a16f2959c98b7882ba45f421', '98f38f2f12b2e7205514aff1106969bc');
INSERT INTO customer(address, birthdate, email, firstname, lastname, city_id, studio_id, activation_token)
VALUES('Alsterdorfer Straße 99', '2096-11-30', 'patrick.mayer@outlook.de', 'Patrick', 'Mayer', 4, 2, '603d3c7f6b97bc5a474d4d2d40078ce2');
INSERT INTO customer(address, birthdate, email, firstname, lastname, city_id, studio_id, activation_token)
VALUES('Scharten 161', '2010-08-12', 'ju.strasser10@gmail.com', 'Julia', 'Strasser', 7, 3, '4452ca34b985550e03ee7a53c42af8ad');

-- INSERT ActivationCodes
--INSERT INTO activationcode(code, valid, customer_id)
--VALUES ('aawh3982hu2h225089hhv4we875=', true, 1);
--INSERT INTO activationcode(code, valid, customer_id)
--VALUES ('0853af768ca4ae8086b96a8db0acf8be', false, 1);
--INSERT INTO activationcode(code, valid, customer_id)
--VALUES ('g2b3def0a16f2959c98b7882ba45f421', false, 1);
--INSERT INTO activationcode(code, valid, customer_id)
--VALUES ('98f38f2f12b2e7205514aff1106969bc', true, 2);
--INSERT INTO activationcode(code, valid, customer_id)
--VALUES ('603d3c7f6b97bc5a474d4d2d40078ce2', true, 3);
--INSERT INTO activationcode(code, valid, customer_id)
--VALUES ('635eb51948fb362707283b2ded20d414', true, 4);
--INSERT INTO activationcode(code, valid, customer_id)
--VALUES ('4452ca34b985550e03ee7a53c42af8ad', false, 2);
--INSERT INTO activationcode(code, valid,customer_id)
--VALUES ('a05f74f92d9800ca1ef3d1f9b4203a2b', false, 2);
--INSERT INTO activationcode(code, valid, customer_id)
--VALUES ('81b1099281434aa2af89eb696a11e7b2', true, 5);
--INSERT INTO activationcode(code, valid, customer_id)
--VALUES ('e29143ec90eb3dee3b19688757a4f91c', false, 3);
--INSERT INTO activationcode(code, valid,customer_id)
--VALUES ('ec1ff1c34fd0eaaae77411d48f387daf', false, 3);
--INSERT INTO activationcode(code, valid, customer_id)
--VALUES ('2313abf64e71f0072400fa32aba5be15', true, 6);

-- INSERT Devicegroups
--INSERT INTO devicegroup(name, description) VALUES('Monkeybar', 'Eine Monkeybar ist eine um 90 Grad gedrehte Hantelbank.');
--INSERT INTO devicegroup(name, description) VALUES('Trainingsmatte', 'Eine Trainingsmatte wird genutzt, um auf weicherem Untergrund trainieren zu können.');
--INSERT INTO devicegroup(name, description) VALUES('Beinpresse', 'Die Beinpresse wird genutzt, um die Beinmuskeln zu stärken.');
--INSERT INTO devicegroup(name, description) VALUES('Laufband', 'Ein Laufband ist als Ersatz zum physischen Laufen gedacht bzw. wenn das Wetter nichts anderes zulässt.');
--INSERT INTO devicegroup(name, description) VALUES('Indoorbike', 'Ein Indoorbike ist als Ersatz zum physischen Rad fahren gedacht bzw. wenn das Wetter nichts anderes zulässt.');
--INSERT INTO devicegroup(name, description) VALUES('Ergometer', 'Auch Fahrradergometer wird ebenfalls ähnlich wie das Indoorbike genutzt.');
INSERT INTO devicegroup(name, description)
VALUES('Schulterpresse', 'Mit einer Schulterpresse trainiert man die Muskulatur der Schultern. Die meisten Schulterpresse verfügen über komfortable, extragroße Griffe mit verschiedenen möglichen Griffpositionen, die für die meisten Trainierenden geeignet sind.');
INSERT INTO devicegroup(name, description)
VALUES('Dip Barren Tower', 'Der Power-Turm kann für Klimmzüge, Liegestütze, Klimmzüge, Knieheben und Dips, Haupttraining Bauchmuskeln, Arm, Rücken, Brust, Schultern und Beinmuskulatur verwendet werden.');
INSERT INTO devicegroup(name, description)
VALUES('Beinpresse', 'Eine Beinpresse ist ein Fitnessgerät, mit dem sich die Beinmuskulatur (vornehmlich Musculus quadriceps femoris) trainieren lässt.');
INSERT INTO devicegroup(name, description)
VALUES('Abduktorenmaschine', 'Zur Kräftigung der Beine, Oberschenkel und seitlichen Gesäßmuskulatur.');
INSERT INTO devicegroup(name, description)
VALUES('Beinbeuger', 'Dieses Gerät trainiert alle Teile der Beinrückseite gleichermaßen. Des Weiteren wird der Wadenmuskel mit beansprucht.');
INSERT INTO devicegroup(name, description)
VALUES('Beinstrecker', 'Der Beinstrecker reizt bei einer korrekten Ausführung ausschließlich den vierköpfigen Oberschenkelmuskel, den sogenannten Quadrizeps (musculus quadrizeps femoris).');
INSERT INTO devicegroup(name, description)
VALUES('Rückenstrecker', 'Das Gerät traininert die Muskeln des unteren Rückens.');
INSERT INTO devicegroup(name, description)
VALUES('Rudergerät', 'Bei jedem Ruderschlag trainieren Sie Ihre komplette Beinmuskulatur. Dazu gehören die Waden, Vorder-, Rück- und Innenseite der Oberschenkel-Muskulatur, Gesäß und Hüfte.');
INSERT INTO devicegroup(name, description)
VALUES('Bauchpresse', 'Trainiert wird mit diesem Gerät der gerade Bauchmuskel natürlich als Ganzes, dennoch ist durch die ausschließliche Krümmungsbewegung des Oberkörpers ein verstärkter Trainingsreiz im oberen Bereich des Bauches zu spüren.');
INSERT INTO devicegroup(name, description)
VALUES('Latzugmaschine', 'Es wird damit in erster Linie der breite Rückenmuskel (Lat.: M. latissimus dorsi) trainiert. Aber auch weitere Muskeln im oberen Rücken wie beispielsweise der Schultermuskel oder der Trapezmuskel werden beansprucht und indirekt mittrainiert.');
INSERT INTO devicegroup(name, description)
VALUES('Brustpresse', 'Ob liegend oder sitzend, du trainierst an der Brustpresse Arme, Schultern und natürlich die Brust.');
INSERT INTO devicegroup(name, description)
VALUES('Langhantel', 'Damit werden Arm-, Bein-, Schulter- und Bauchmuskulatur beansprucht. Die größten Muskeln, die hierbei trainiert werden, sind jedoch die gesamte Rücken- sowie die hintere Oberschenkelmuskulatur.');
INSERT INTO devicegroup(name, description)
VALUES('Kurzhantel', null);
INSERT INTO devicegroup(name, description)
VALUES('Schrägbank', null);
INSERT INTO devicegroup(name, description)
VALUES('Matte', 'Für Kniebeugen, Liegestütz, ...');

-- INSERT Devices
--INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id)
--VALUES('Die Monkeybar ist quasi eine um 90 Grad gedrehte Hantelbank.', 'Monkeybar Mini', 22, 1, 1);
--INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id)
--VALUES('Die Beinpresse wird genutzt, um die Beinmuskeln zu stärken.', '45 Grad Beinpresse', 15, 3, 1);
--INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id)
--VALUES('Die Fußplatte bewegt sich parallel zum Boden.', 'horizontale Beinpresse', 16, 3, 2);
--INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id)
--VALUES('Die Beinpresse wird genutzt, um die Beinmuskeln zu stärken.', 'vertikale Beinpresse', 17, 3, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Schulterpresse', 12, 1, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Schulterpresse', 13, 1, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Schulterpresse', 14, 1, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Dip Tower', 1, 2, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Dip Tower', 2, 2, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Dip Tower', 3, 2, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Impander', 4, 3, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, '45° Beinpresse', 5, 3, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Vertikale Beinpresse', 6, 3, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Horizontale Beinpresse', 7, 3, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Pendel-Beinpresse', 8, 3, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Abduktorenmaschine', 9, 4, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Abduktorenmaschine', 10, 4, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Abduktorenmaschine', 11, 4, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Liegender Beinbeuger', 16, 5, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Sitzender Beinbeuger', 15, 5, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Beinstrecker', 17, 6, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Beinstrecker', 18, 6, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Rückenstrecker', 19, 7, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Rückenstrecker', 20, 7, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Rudergerät', 21, 8, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Rudergerät', 22, 8, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Rudergerät', 23, 8, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Rudergerät', 24, 8, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Bauchpresse', 25, 9, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Bauchpresse', 26, 9, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Bauchpresse', 27, 9, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Bauchpresse', 28, 9, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Latzugmaschine', 29, 10, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Latzugmaschine', 30, 10, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Latzugmaschine', 31, 10, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Latzugmaschine', 32, 10, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Latzugmaschine', 33, 10, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Latzugmaschine', 34, 10, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Brustpresse', 35, 11, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Brustpresse', 36, 11, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Fixe Langhantel', 37, 12, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Fixe Langhantel', 38, 12, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Variable Langhantel', 39, 12, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Variable Langhantel', 40, 12, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Variable Langhantel', 41, 12, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, '20kg Kurzhantel', 42, 13, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, '30kg Kurzhantel', 43, 13, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, '35kg Kurzhantel', 44, 13, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, '40kg Kurzhantel', 45, 13, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Schrägbank', 46, 14, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, '45-Grad-Schrägbank', 47, 14, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Bodenmatte', 48, 15, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Bodenmatte', 49, 15, 2);
INSERT INTO device(description, name, unique_number, devicegroup_id, studio_id) VALUES (null, 'Bodenmatte', 50, 15, 2);


-- INSERT Workoutplans
--INSERT INTO workoutplan(archived, name, valid_from, valid_till, description, customer_id)
--VALUES(false, 'Demo-Trainingsplan 1', '2020-12-25', null, 'Das ist ein Demo Trainingsplan.', 1);
--INSERT INTO workoutplan(archived, name, valid_from, valid_till, description, customer_id)
--VALUES(true, 'Demo-Trainingsplan 2', '2021-01-10', '2021-02-15', 'Das ist ein Demo Trainingsplan 2.',  2);
INSERT INTO workoutplan(archived, description, name, valid_from, valid_till, customer_id)
VALUES (false, 'Training der Brust, des Bizeps und des Trizeps.', 'Oberkörper 1', '2020-03-01', '2020-03-08', 1);
INSERT INTO workoutplan(archived, description, name, valid_from, valid_till, customer_id)
VALUES (false, 'Training der Beine sowie der Waden.', 'Beine', '2020-03-08', '2020-03-16', 1);
INSERT INTO workoutplan(archived, description, name, valid_from, valid_till, customer_id)
VALUES (false, 'Training des Rücken, der Schultern und des Bauchs.', 'Oberkörper 2', '2020-03-16', '2020-03-14', 1);
INSERT INTO workoutplan(archived, description, name, valid_from, valid_till, customer_id)
VALUES (false, 'Training des ganzen Körpers.', 'Ganzkörpertraining', '2022-03-13', '2022-03-21', 4);

-- INSERT Workouts
--INSERT INTO exercise(description, name, devicegroup_id, workoutplan_id, sort_identifier)
--VALUES('', 'Beinpresse', 3, 1, 1);
--INSERT INTO exercise(description, name, devicegroup_id, workoutplan_id, sort_identifier)
--VALUES('', 'Beinpresse', 3, 1, 2);
--INSERT INTO exercise(description, name, devicegroup_id, workoutplan_id, sort_identifier)
--VALUES('', 'Liegestütze', 2, 1, 5);
--INSERT INTO exercise(description, name, devicegroup_id, workoutplan_id, sort_identifier)
--VALUES('', 'Push Ups', 2, 2, 1);
--INSERT INTO exercise(description, name, devicegroup_id, workoutplan_id, sort_identifier)
--VALUES('', 'Laufen', 4, 1, 9);
--INSERT INTO exercise(description, name, devicegroup_id, workoutplan_id, sort_identifier)
--VALUES('', 'Gehen', 4, 1, 3);
--INSERT INTO exercise(description, name, devicegroup_id, workoutplan_id, sort_identifier)
--VALUES('', 'Sprint', 4, 1, 6);
--INSERT INTO exercise(description, name, devicegroup_id, workoutplan_id, sort_identifier)
--VALUES('', 'Rad fahren', 5, 1, 7);
--INSERT INTO exercise(description, name, devicegroup_id, workoutplan_id, sort_identifier)
--VALUES('', 'Beinpresse', 3, 1, 8);
--INSERT INTO exercise(description, name, devicegroup_id, workoutplan_id, sort_identifier)
--VALUES('', 'Beinpresse', 3, 1, 4);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'Langhantel Schrägbankdrücken', 0, 12, 1);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'Kurzhantel Flachbankdrücken', 1, 13, 1);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'Fliegende Schrägbank', 2, 14, 1);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'Dips', 3, 2, 1);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'Langhantel Curls', 4, 12, 1);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES ('mit Langhantel', 'Scott-Curls', 5, 12, 1);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES ('mit Kurzhantel, sitzend', 'Hammer Curls', 6, 13, 1);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'French Press/Stirndrücken', 7, 10, 1);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES ('einhändig', 'Trizepsdrücken (Kurzhantel)', 8, 13, 1);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'Trizepsdrücken (Kabel-/Latzug)', 9, 10, 1);

INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'Beinstrecken', 0, 6, 2);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'Kniebeugen', 1, 15, 2);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'Beinpresse', 2, 3, 2);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'Beincurls liegend', 3, 5, 2);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'Wadenheben (stehend)', 4, 15, 2);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'Wadenheben (sitzend)', 5, 15, 2);

INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES ('zur Brust', 'Latziehen breiter Griff', 0, 10, 3);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'Latziehen enger Griff', 1, 10, 3);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'Rudern', 2, 8, 3);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES ('mit Langhantel', 'Rudern', 3, 12, 3);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'Nackenheben Langhantel', 4, 12, 3);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'Nackendrücken Langhantel', 5, 12, 3);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'Seitenheben Kurzhantel', 6, 13, 3);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'Seitenheben vorgebeugt Kurzhantel', 7, 13, 3);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'Dips', 8, 2, 3);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES ('hängend', 'Beinheben', 9, 2, 3);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES ('kniehend', 'Crunches am Kabel', 10, 10, 3);

INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'Beinpresse', 0, 3, 4);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'Beinstrecken', 1, 6, 4);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'Beincurls', 2, 5, 4);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'Abduktoren 1', 3, 4, 4);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'Abduktoren 2', 4, 4, 4);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'Bauchtraining', 5, 9, 4);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'Back Extension', 6, 7, 4);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'Bruspresse', 7, 11, 4);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'Schulterpresse', 8, 1, 4);
INSERT INTO exercise(description, name, sort_identifier, devicegroup_id, workoutplan_id)
VALUES (null, 'Dips', 9, 2, 4);

-- INSERT WorkoutSets
--INSERT INTO exerciseset(description, repetitions, exercise_id, sort_identifier) VALUES('30kg', 5, 1, 1);
--INSERT INTO exerciseset(description, repetitions, exercise_id, sort_identifier) VALUES('40kg', 10, 1, 3);
--INSERT INTO exerciseset(description, repetitions, exercise_id, sort_identifier) VALUES('10kg', 20, 1, 2);
--INSERT INTO exerciseset(description, repetitions, exercise_id, sort_identifier) VALUES('30kg', 7, 2, 1);
--INSERT INTO exerciseset(description, repetitions, exercise_id, sort_identifier) VALUES('100m', 100, 7, 1);
--INSERT INTO exerciseset(description, repetitions, exercise_id, sort_identifier) VALUES('15kg', 15, 2, 2);
--INSERT INTO exerciseset(description, repetitions, exercise_id, sort_identifier) VALUES('20km', -1, 8, 3);
--INSERT INTO exerciseset(description, repetitions, exercise_id, sort_identifier) VALUES('15km', -1, 8, 1);
--INSERT INTO exerciseset(description, repetitions, exercise_id, sort_identifier) VALUES('10km', -1, 8, 2);
--INSERT INTO exerciseset(description, repetitions, exercise_id, sort_identifier) VALUES('', 10, 3, 1);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('70kg', 12, 0, 1);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('75kg', 10, 1, 1);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('80kg', 8, 2, 1);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('90kg', 6, 3, 1);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('30kg', 10, 0, 2);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('40kg', 8, 1, 2);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('40kg', 8, 2, 2);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('45kg', 6, 3, 2);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('40kg', 12, 0, 3);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('45kg', 10, 1, 3);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('55kg', 8, 2, 3);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES (null, 10, 0, 4);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES (null, 10, 1, 4);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES (null, 10, 2, 4);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('65kg', 12, 0, 5);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('65kg', 10, 1, 5);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('70kg', 8, 2, 5);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('65kg', 12, 0, 6);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('65kg', 10, 1, 6);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('70kg', 8, 2, 6);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('40kg', 10, 0, 7);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('40kg', 10, 1, 7);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('40kg', 10, 2, 7);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('65kg', 12, 0, 8);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('65kg', 10, 1, 8);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('70kg', 8, 2, 8);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('45kg', 12, 0, 9);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('50kg', 10, 1, 9);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('55kg', 8, 2, 9);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('80kg', 10, 0, 10);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('85kg', 8, 1, 10);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('90kg', 6, 2, 10);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('80kg', 20, 0, 11);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('85kg', 15, 1, 11);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('90kg', 12, 2, 11);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('', 10, 0, 12);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('', 8, 1, 12);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('', 6, 2, 12);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('', 4, 3, 12);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('80kg', 10, 0, 13);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('85kg', 8, 1, 13);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('85kg', 8, 2, 13);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('90kg', 6, 3, 13);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('70kg', 15, 0, 14);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('75kg', 12, 1, 14);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('75kg', 10, 2, 14);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('80kg', 8, 3, 14);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('', 15, 0, 15);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('', 12, 1, 15);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('', 10, 2, 15);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('', 15, 0, 16);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('', 12, 1, 16);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('', 10, 2, 16);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('70kg', 15, 0, 17);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('75kg', 12, 1, 17);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('75kg', 10, 2, 17);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('80kg', 8, 3, 17);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('60kg', 12, 0, 18);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('65kg', 10, 1, 18);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('70kg', 8, 2, 18);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('3km', 10, 0, 19);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('1km', 8, 1, 19);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('500m', 6, 2, 19);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('', 8, 0, 20);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('', 8, 1, 20);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('', 8, 2, 20);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('', 6, 3, 20);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('90kg', 15, 0, 21);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('92kg', 12, 1, 21);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('95kg', 10, 2, 21);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('100kg', 8, 3, 21);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('85kg', 10, 0, 22);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('90kg', 8, 1, 22);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('90kg', 8, 2, 22);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('95kg', 6, 3, 22);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('60kg', 15, 0, 23);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('60kg', 15, 1, 23);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('75kg', 10, 2, 23);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES (null, 10, 0, 24);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES (null, 8, 1, 24);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES (null, 6, 2, 24);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES (null, 20, 0, 25);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES (null, 20, 1, 25);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES (null, 20, 2, 25);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('90kg', 20, 0, 26);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('90kg', 20, 1, 26);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('90kg', 20, 2, 26);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('50kg', 12, 0, 27);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('55kg', 13, 1, 27);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('55kg', 14, 2, 27);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('50kg', 12, 0, 28);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('60kg', 12, 1, 28);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('50kg', 14, 0, 29);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('50kg', 14, 1, 29);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('45kg', 17, 0, 30);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('45kg', 16, 1, 30);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('40kg', 20, 2, 30);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('40kg', 20, 0, 31);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('40kg', 20, 1, 31);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('40kg', 20, 2, 31);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('45kg', 16, 0, 32);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('50kg', 15, 1, 32);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('40kg', 18, 2, 32);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('20kg', 17, 0, 33);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('25kg', 16, 1, 33);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('35kg', 15, 2, 33);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('35kg', 13, 0, 34);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('35kg', 13, 1, 34);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('35kg', 13, 2, 34);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('40kg', 14, 0, 35);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('40kg', 14, 1, 35);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('40kg', 14, 2, 35);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('35kg', 12, 0, 36);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('40kg', 13, 1, 36);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES ('45kg', 14, 2, 36);

INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES (null, 12, 0, 37);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES (null, 13, 1, 37);
INSERT INTO exerciseset(description, repetitions, sort_identifier, exercise_id) VALUES (null, 14, 2, 37);


-- INSERT Trainings
--INSERT INTO training(date, starttime, endtime, workoutplan_id) VALUES('2020-12-30', '12:43:33', '13:43:33', 1);
--INSERT INTO training(date, starttime, endtime, workoutplan_id) VALUES('2021-01-5', '09:21:10', '12:43:33', 1);
--INSERT INTO training(date, starttime, endtime, workoutplan_id) VALUES('2021-01-10', '22:22:22', '22:59:50', 1);
--INSERT INTO training(date, starttime, endtime, workoutplan_id) VALUES('2021-01-10', '01:00:00', '01:49:10', 2);
--INSERT INTO training(date, starttime, endtime, workoutplan_id) VALUES('2021-01-15', '12:10:00', '12:14:56', 2);
INSERT INTO training(date, endtime, starttime, workoutplan_id) VALUES('2022-03-03', '10:32:53', '12:40:33', 1);
INSERT INTO training(date, endtime, starttime, workoutplan_id) VALUES('2022-03-04', '8:00:53', '10:20:10', 2);
INSERT INTO training(date, endtime, starttime, workoutplan_id) VALUES('2022-03-05', '10:32:00', '12:40:48', 3);
INSERT INTO training(date, endtime, starttime, workoutplan_id) VALUES('2022-03-13', '18:15:21', '20:40:19', 4);



-- INSERT HealthDataType
INSERT INTO healthdatatype(name) VALUES('Puls');
INSERT INTO healthdatatype(name) VALUES('Blutdruck');
INSERT INTO healthdatatype(name) VALUES('kcal');
INSERT INTO healthdatatype(name) VALUES('Blutsauerstoffgehalt');


--INSERT HealthData
--INSERT INTO healthdata(time, value, healthdatatype_id, training_id, exerciseset_id)
--VALUES('2020-12-30 10:35:33', 100, 1, 1, 1);
--INSERT INTO healthdata(time, value, healthdatatype_id, training_id, exerciseset_id)
--VALUES('2020-12-30 10:45:18', 104, 1, 1, 1);
--INSERT INTO healthdata(time, value, healthdatatype_id, training_id, exerciseset_id)
--VALUES('2020-12-30 11:55:03', 80, 2, 1, 1);
--INSERT INTO healthdata(time, value, healthdatatype_id, training_id, exerciseset_id)
--VALUES('2020-12-30 10:35:33', 14, 3, 1, 1);
--INSERT INTO healthdata(time, value, healthdatatype_id, training_id, exerciseset_id)
--VALUES('2020-12-30 10:35:33', 89, 1, 1, 2);
--INSERT INTO healthdata(time, value, healthdatatype_id, training_id, exerciseset_id)
--VALUES('2020-12-30 10:35:33', 88, 2, 1, 2);
--INSERT INTO healthdata(time, value, healthdatatype_id, training_id, exerciseset_id)
--VALUES('2020-12-30 10:35:33', 10, 3, 1, 2);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 10:40:32', 100, 1, 1, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 10:44:32', 110, 1, 1, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 10:48:32', 120, 1, 1, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 10:52:32', 108, 1, 1, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 10:56:50', 80, 2, 1, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 11:00:31', 130, 2, 1, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 11:04:42', 140, 2, 1, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 11:08:42', 102, 2, 1, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 11:12:42', 80, 2, 1, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 11:16:42', 91, 2, 1, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 11:20:42', 88, 2, 1, 1);

INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 10:40:32', 82, 1, 2, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 10:44:32', 81, 1, 2, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 10:48:32', 83, 1, 2, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 10:52:32', 83, 1, 2, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 10:56:50', 84, 2, 2, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 11:00:31', 84, 2, 2, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 11:04:42', 83, 2, 2, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 11:08:42', 83, 2, 2, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 11:12:42', 81, 2, 2, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 11:16:42', 80, 2, 2, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 11:20:42', 80, 2, 2, 1);

INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 10:40:32', 30, 1, 3, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 10:44:32', 58, 1, 3, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 10:48:32', 86, 1, 3, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 10:52:32', 114, 1, 3, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 10:56:50', 126, 2, 3, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 11:00:31', 165, 2, 3, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 11:04:42', 190, 2, 3, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 11:08:42', 192, 2, 3, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 11:12:42', 211, 2, 3, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 11:16:42', 230, 2, 3, 1);
INSERT INTO healthdata(time, value, exerciseset_id, healthdatatype_id, training_id)
VALUES('2022-03-03 11:20:42', 238, 2, 3, 1);