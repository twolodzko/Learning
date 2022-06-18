WITH RECURSIVE fizzbuzz(number, answer) AS (
    SELECT 0, 1
    UNION ALL
    SELECT
        number + 1,
        CASE
            WHEN (number % 15 == 0) THEN "Fizz Buzz"
            WHEN (number % 3 == 0)  THEN "Fizz"
            WHEN (number % 5 == 0)  THEN "Buzz"
            ELSE number
        END
    FROM fizzbuzz
    WHERE number <= 100
)
SELECT answer from fizzbuzz
