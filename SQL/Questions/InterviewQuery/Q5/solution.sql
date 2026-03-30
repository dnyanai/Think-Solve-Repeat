WITH cte_usr_trx AS (
    SELECT 
        u.id as user_id, 
        u.name, 
        t.product_id,
        COALESCE (t.quantity, 0) as total_quantity
    FROM users u 
        LEFT JOIN transactions t
            ON t.user_id = u.id ),
cte_trx_prd AS (

    SELECT  
        c1.user_id,
        c1.name, 
        c1.product_id,
        SUM(
                COALESCE(c1.total_quantity,0) 
            *   COALESCE(p.price,0)
            ) as price 
    FROM cte_usr_trx c1
        JOIN products p 
            ON p.id = c1.product_id 
    GROUP BY 
        1,2,3
)
SELECT
    name, 
    user_id, 
    SUM(price) as total_cost
FROM cte_trx_prd c1
GROUP BY 1,2;