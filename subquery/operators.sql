-- EXISTS - Returns TRUE if the subquery returns at least one row.
-- Stops scanning once it finds the first match.
-- Often faster for existence checks.
-- Commonly used with correlated subqueries

SELECT *
FROM
    customers c
WHERE
    -- return all customers if the subquery returns at least one row
    NOT EXISTS (
        SELECT
            1
        FROM
            orders o
        WHERE
            order_id =100
    );
-- Result - All Customer if returns true else no record 
-- If customer_id is in orders then return true and moves to check the next customer_id
-- Runs for each row in customers and checks if the subquery returns at least one row to show outer query data

SELECT
    *
FROM
    customers c
WHERE
    EXISTS (
        SELECT
            1
        FROM
            orders o
        WHERE
            o.customer_id = c.customer_id
    );
-- For each row in customers checking with customer_id in orders (1,2,3):
-- Customer 1 → subquery finds rows (1,2,3) → TRUE
-- Customer 2 → subquery finds rows (1,2,3) → TRUE
-- Customer 3 → subquery finds rows (1,2,3) → TRUE
-- Customer 4 → subquery finds nothing → FALSE
-- Result - Customer 1,2,3

Select 'ALL' as operator;
-- ALL - to check if a subquery returns all rows
-- Compare the records
SELECT *
FROM customers
WHERE customer_id > ALL (
    SELECT customer_id FROM orders
);

-- If customer_id in orders is 1,2,3  

-- checking customer_id from customers 
-- 1 → 1>1? no, 1>2? no, 1>3? no → FALSE
-- 2 → 2>1? no, 2>2? no, 2>3? no → FALSE
-- 3 → 3>1? no, 3>2? no, 3>3? no → FALSE
-- 4 → 4>1? yes, 4>2? yes, 4>3? yes → TRUE (Satisfies all conditions)


Select 'ANY' as operator;
-- ANY - to check if a subquery returns any row
-- Compare the records

SELECT *
FROM customers
WHERE customer_id > ANY (
    SELECT customer_id FROM orders
);

-- If customer_id in orders is 1,2,3  
-- 1 → 1>1? no, 1>2? no, 1>3? no → FALSE
-- 2 → 2>1? YES → TRUE (Satisfies at least one condition)
-- 3 → 3>1? YES → TRUE (Satisfies at least one condition)
-- 4 → 4>1? YES → TRUE (Satisfies at least one condition)
