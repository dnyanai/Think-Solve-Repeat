/*
DDL:
CREATE TABLE annual_payments (
    user_id INT,
    amount DECIMAL(10, 2),
    status VARCHAR(50),
    product VARCHAR(50)
);

INSERT INTO annual_payments (user_id, amount, status, product) VALUES
(1, 100, 'paid', 'product1'),
(2, 200, 'paid', 'product2'),
(3, 300, 'paid', 'product3'),
(4, 400, 'paid', 'product4'),
(5, 500, 'paid', 'product5');
*/
SELECT 
    1 as question_id,
    COUNT(*) as answer
FROM annual_payments
UNION ALL 
SELECT 
    2 as question_id,
    COUNT(DISTINCT user_id) as answer
FROM annual_payments
UNION ALL 
SELECT 
    3,
    COUNT(*) as answer
FROM annual_payments
WHERE (LOWER(status) = 'paid'
    AND amount >=100)
UNION ALL 
SELECT 
   4,
   product as answer
FROM annual_payments
WHERE 
LOWER(status) = 'paid'
GROUP BY product
ORDER BY SUM(AMOUNT) DESC
LIMIT 1			