-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 29 2024 г., 23:27
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `School`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Courses`
--

CREATE TABLE `Courses` (
  `CourseID` int NOT NULL,
  `SchoolID` int DEFAULT NULL,
  `TeacherID` int DEFAULT NULL,
  `CourseName` varchar(100) NOT NULL,
  `Description` text,
  `Credits` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Courses`
--

INSERT INTO `Courses` (`CourseID`, `SchoolID`, `TeacherID`, `CourseName`, `Description`, `Credits`) VALUES
(1, 1, 1, 'Algebra I', 'Basic algebra covering linear equations and inequalities', 3),
(2, 1, 2, 'Physics', 'Introduction to classical mechanics', 4),
(3, 2, 3, 'English Literature', 'Study of classic English literature', 3),
(4, 2, 4, 'World History', 'Overview of major events in world history', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `Enrollments`
--

CREATE TABLE `Enrollments` (
  `EnrollmentID` int NOT NULL,
  `StudentID` int DEFAULT NULL,
  `CourseID` int DEFAULT NULL,
  `EnrollmentDate` date DEFAULT NULL,
  `Grade` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;;

--
-- Дамп данных таблицы `Enrollments`
--

INSERT INTO `Enrollments` (`EnrollmentID`, `StudentID`, `CourseID`, `EnrollmentDate`, `Grade`) VALUES
(1, 1, 1, '2023-09-05', 'A'),
(2, 1, 2, '2023-09-05', 'B+'),
(3, 2, 1, '2022-09-05', 'A-'),
(4, 3, 3, '2021-09-05', 'B'),
(5, 4, 4, '2023-09-05', 'A');

-- --------------------------------------------------------

--
-- Структура таблицы `Schools`
--

CREATE TABLE `Schools` (
  `SchoolID` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `PrincipalName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;;

--
-- Дамп данных таблицы `Schools`
--

INSERT INTO `Schools` (`SchoolID`, `Name`, `Address`, `Phone`, `PrincipalName`) VALUES
(1, 'Green Valley High School', '123 Green St, Springfield', '+1234567890', 'Alice Johnson'),
(2, 'Oakwood Academy', '456 Oakwood Ave, Springfield', '+0987654321', 'Mark Smith');

-- --------------------------------------------------------

--
-- Структура таблицы `Students`
--

CREATE TABLE `Students` (
  `StudentID` int NOT NULL,
  `SchoolID` int DEFAULT NULL,
  `Name` varchar(100) NOT NULL,
  `GradeLevel` int DEFAULT NULL,
  `EnrollmentDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Students`
--

INSERT INTO `Students` (`StudentID`, `SchoolID`, `Name`, `GradeLevel`, `EnrollmentDate`) VALUES
(1, 1, 'James Lee', 10, '2023-09-01'),
(2, 1, 'Sarah Kim', 11, '2022-09-01'),
(3, 2, 'Michael Chen', 12, '2021-09-01'),
(4, 2, 'Laura Park', 10, '2023-09-01');

-- --------------------------------------------------------

--
-- Структура таблицы `Teachers`
--

CREATE TABLE `Teachers` (
  `TeacherID` int NOT NULL,
  `SchoolID` int DEFAULT NULL,
  `Name` varchar(100) NOT NULL,
  `Subject` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Teachers`
--

INSERT INTO `Teachers` (`TeacherID`, `SchoolID`, `Name`, `Subject`, `Email`) VALUES
(1, 1, 'John Doe', 'Mathematics', 'jdoe@greenvalley.edu'),
(2, 1, 'Mary Davis', 'Science', 'mdavis@greenvalley.edu'),
(3, 2, 'Robert Brown', 'English', 'rbrown@oakwood.edu'),
(4, 2, 'Emma Wilson', 'History', 'ewilson@oakwood.edu');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Courses`
--
ALTER TABLE `Courses`
  ADD PRIMARY KEY (`CourseID`),
  ADD KEY `SchoolID` (`SchoolID`),
  ADD KEY `TeacherID` (`TeacherID`);

--
-- Индексы таблицы `Enrollments`
--
ALTER TABLE `Enrollments`
  ADD PRIMARY KEY (`EnrollmentID`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `CourseID` (`CourseID`);

--
-- Индексы таблицы `Schools`
--
ALTER TABLE `Schools`
  ADD PRIMARY KEY (`SchoolID`);

--
-- Индексы таблицы `Students`
--
ALTER TABLE `Students`
  ADD PRIMARY KEY (`StudentID`),
  ADD KEY `SchoolID` (`SchoolID`);

--
-- Индексы таблицы `Teachers`
--
ALTER TABLE `Teachers`
  ADD PRIMARY KEY (`TeacherID`),
  ADD KEY `SchoolID` (`SchoolID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Courses`
--
ALTER TABLE `Courses`
  MODIFY `CourseID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `Enrollments`
--
ALTER TABLE `Enrollments`
  MODIFY `EnrollmentID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `Schools`
--
ALTER TABLE `Schools`
  MODIFY `SchoolID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `Students`
--
ALTER TABLE `Students`
  MODIFY `StudentID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `Teachers`
--
ALTER TABLE `Teachers`
  MODIFY `TeacherID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Courses`
--
ALTER TABLE `Courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`SchoolID`) REFERENCES `Schools` (`SchoolID`),
  ADD CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`TeacherID`) REFERENCES `Teachers` (`TeacherID`);

--
-- Ограничения внешнего ключа таблицы `Enrollments`
--
ALTER TABLE `Enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Students` (`StudentID`),
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `Courses` (`CourseID`);

--
-- Ограничения внешнего ключа таблицы `Students`
--
ALTER TABLE `Students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`SchoolID`) REFERENCES `Schools` (`SchoolID`);

--
-- Ограничения внешнего ключа таблицы `Teachers`
--
ALTER TABLE `Teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`SchoolID`) REFERENCES `Schools` (`SchoolID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
