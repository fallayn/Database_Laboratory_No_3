-- Table: Сценарист
CREATE TABLE Сценарист (
    ID_S SERIAL PRIMARY KEY,
    Имя_Фамилия VARCHAR(100) NOT NULL,
    Дата_рождения DATE
);

-- Table: Режиссёр
CREATE TABLE Режиссёр (
    ID_P SERIAL PRIMARY KEY,
    Имя_Фамилия VARCHAR(100) NOT NULL,
    Дата_рождения DATE
);

-- Table: Фильм
CREATE TABLE Фильм (
    ID_F SERIAL PRIMARY KEY,
    Название VARCHAR(100) NOT NULL,
    Год_выпуска INT,
    Жанр VARCHAR(50),
    Рейтинг DECIMAL(3, 1),
    Аннотация TEXT,
    Страна_производитель VARCHAR(50)
);

-- Table: Актёр
CREATE TABLE Актёр (
    ID_A SERIAL PRIMARY KEY,
    Имя_Фамилия VARCHAR(100) NOT NULL,
    Дата_рождения DATE
);

-- Table: Награды
CREATE TABLE Награды (
    ID_H SERIAL PRIMARY KEY,
    Название VARCHAR(100) NOT NULL
);

-- Table: Удостоились
CREATE TABLE Удостоились (
    ID_U SERIAL PRIMARY KEY,
    ID_F INT REFERENCES Фильм(ID_F) ON DELETE CASCADE,
    ID_H INT REFERENCES Награды(ID_H) ON DELETE CASCADE,
    Лауреат VARCHAR(100),
    Год_получения INT,
    Категория_награды VARCHAR(50)
);

-- Table: Участвовал_в_создании
CREATE TABLE Участвовал_в_создании (
    ID_UC SERIAL PRIMARY KEY,
    ID_S INT REFERENCES Сценарист(ID_S) ON DELETE CASCADE,
    ID_P INT REFERENCES Режиссёр(ID_P) ON DELETE CASCADE,
    ID_F INT REFERENCES Фильм(ID_F) ON DELETE CASCADE
);

-- Table: Роль_в_кино
CREATE TABLE Роль_в_кино (
    ID_R SERIAL PRIMARY KEY,
    ID_F INT REFERENCES Фильм(ID_F) ON DELETE CASCADE,
    ID_A INT REFERENCES Актёр(ID_A) ON DELETE CASCADE,
    Роль VARCHAR(100)
);

-- Insert value for table have only primary key

-- Сценарист
INSERT INTO Сценарист (Имя_Фамилия, Дата_рождения) VALUES
('Иван Иванов', '1970-05-12'),
('Алексей Петров', '1985-03-23'),
('Мария Семёнова', '1990-11-17'),
('Дмитрий Ковалёв', '1978-08-05');

-- Режиссёр
INSERT INTO Режиссёр (Имя_Фамилия, Дата_рождения) VALUES
('Сергей Смирнов', '1968-11-30'),
('Ольга Кузнецова', '1980-07-18'),
('Александр Белов', '1975-04-10'),
('Наталья Воронова', '1983-06-22');

-- Фильм
INSERT INTO Фильм (Название, Год_выпуска, Жанр, Рейтинг, Аннотация, Страна_производитель) VALUES
('Фильм 1', 2022, 'Драма', 8.5, 'Описание фильма 1', 'Россия'),
('Фильм 2', 2021, 'Комедия', 7.3, 'Описание фильма 2', 'Россия'),
('Фильм 3', 2020, 'Триллер', 6.9, 'Описание фильма 3', 'США'),
('Фильм 4', 2019, 'Боевик', 8.0, 'Описание фильма 4', 'Канада');

-- Актёр
INSERT INTO Актёр (Имя_Фамилия, Дата_рождения) VALUES
('Мария Павлова', '1992-01-15'),
('Андрей Сидоров', '1983-09-09'),
('Екатерина Орлова', '1995-04-02'),
('Владимир Нестеров', '1980-12-19');

-- Награды
INSERT INTO Награды (Название) VALUES
('Оскар'),
('Золотой глобус'),
('BAFTA'),
('Каннский фестиваль');

-- For table have reference (reference key)

-- Удостоились
INSERT INTO Удостоились (ID_F, ID_H, Лауреат, Год_получения, Категория_награды) VALUES
(1, 1, 'Фильм 1', 2023, 'Лучший фильм'),
(2, 2, 'Фильм 2', 2022, 'Лучшая комедия'),
(3, 3, 'Фильм 3', 2021, 'Лучший сценарий'),
(4, 4, 'Фильм 4', 2020, 'Лучший режиссёр'),
(1, 2, 'Фильм 1', 2023, 'Лучшая драма'),
(2, 3, 'Фильм 2', 2022, 'Лучший актёр'),
(3, 1, 'Фильм 3', 2021, 'Лучший триллер'),
(4, 4, 'Фильм 4', 2020, 'Лучший боевик');

-- Участвовал_в_создании
INSERT INTO Участвовал_в_создании (ID_S, ID_P, ID_F) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(1, 2, 3),
(3, 1, 4),
(2, 3, 1),
(4, 2, 2);

-- Роль_в_кино
INSERT INTO Роль_в_кино (ID_F, ID_A, Роль) VALUES
(1, 1, 'Главная роль'),
(1, 2, 'Второстепенная роль'),
(2, 3, 'Главная роль'),
(2, 4, 'Второстепенная роль'),
(3, 1, 'Эпизодическая роль'),
(3, 3, 'Главная роль'),
(4, 2, 'Роль второго плана'),
(4, 4, 'Главная роль');

-- Select all data from table for checking working
-- We should to run one line for checking working one table
SELECT * FROM Сценарист;
SELECT * FROM Режиссёр;
SELECT * FROM Фильм;
SELECT * FROM Актёр;
SELECT * FROM Награды;
SELECT * FROM Удостоились;
SELECT * FROM Участвовал_в_создании;
SELECT * FROM Роль_в_кино;


-- For remove table in database
DROP TABLE Сценарист;
DROP TABLE Режиссёр;
DROP TABLE Фильм;
DROP TABLE Актёр;
DROP TABLE Награды;
DROP TABLE Удостоились;
DROP TABLE Участвовал_в_создании;
DROP TABLE Роль_в_кино;

-- Example for DELETE and UPDATE

UPDATE Фильм
SET Рейтинг = 9.0
WHERE Название = 'Фильм 1';

UPDATE Удостоились
SET Категория_награды = 'Лучший актёр'
WHERE Лауреат = 'Фильм 3' AND Год_получения = 2021;

UPDATE Роль_в_кино
SET Роль = 'Главная роль'
WHERE ID_A = 2 AND ID_F = 4;

DELETE FROM Фильм
WHERE Название = 'Фильм 2';

DELETE FROM Актёр
WHERE Имя_Фамилия = 'Владимир Нестеров';

DELETE FROM Удостоились
WHERE ID_F = 1 AND ID_H = 2;