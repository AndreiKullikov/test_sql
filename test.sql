--1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
--Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DELIMITER //
CREATE PROCEDURE seconds_to_DT(seconds INT) -- принимаем значение в int
BEGIN -- начало процедуры
    DECLARE days INT default 0; -- начальное значение дней часов и минут будет 0
    DECLARE hours INT default 0;
    DECLARE minutes INT default 0;

    SET days = seconds / 86400; --узнаем количество дней(если изначального значения хватит )
    SET seconds = seconds % 86400; -- обновляем значение 
  
    SET hours = seconds / 3600; --- тоже самое как и дни
    SET seconds = seconds % 3600;

    SET minutes = seconds / 60;
    SET seconds = seconds % 60;

SELECT CONCAT --Объединяем значения days, hours, minutes и seconds в строку и возвращаем результат.
(
  days, ' days ',
  hours, ' hours ',
  minutes, ' minutes ',
  seconds, ' seconds'
) AS date_time;
END //
DELIMITER ;

CALL seconds_to_DT(245687); -- Тест


--2. Выведите только чётные числа от 1 до 10.
--Пример: 2,4,6,8,10

DELIMITER //
CREATE PROCEDURE numbers()
BEGIN
    DECLARE n INT default 0;
    DROP TABLE IF EXISTS nums;
    CREATE TABLE nums (n INT); --создаем новую таблицу

    WHILE n < 10 DO
    SET n = n + 2;
    INSERT INTO nums VALUES(n); -- добавляем значение в таблицу
    END WHILE;

SELECT * FROM nums;
END //
DELIMITER ;

CALL numbers();