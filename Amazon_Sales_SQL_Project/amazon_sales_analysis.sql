-- 1. Entire data from the table 
select * from amazon;
-- 2. Product name and rating
SELECT product_name, rating
FROM amazon;
-- 3. Rating more than 4
SELECT *
FROM amazon
WHERE TRY_CAST(rating AS FLOAT) > 4;
-- 4. Discounted price less than 500
SELECT product_name, discounted_price
FROM amazon
WHERE TRY_CAST(discounted_price AS DECIMAL(10,2)) < 500;
-- 5. Top 10 highest rated products
SELECT TOP 10 product_name, rating
FROM amazon
ORDER BY TRY_CAST(rating AS FLOAT) DESC;
-- 6. Maximum actual price
SELECT MAX(actual_price) AS MaxPrice
FROM amazon;
-- 7. Minimum discounted price
SELECT MIN(discounted_price) AS MinPrice
FROM amazon;
-- 8. Average rating
SELECT AVG(TRY_CAST(rating AS FLOAT)) AS AvgRating
FROM amazon;
-- 9. Total products
SELECT COUNT(*) AS TotalProducts
FROM amazon;
-- 10. Only unique products 
SELECT DISTINCT product_name
FROM amazon;
-- 11. Category wise products count
SELECT category, COUNT(*) AS TotalProducts
FROM amazon
GROUP BY category
ORDER BY TotalProducts DESC;
-- 12. Top 10 most reviewed products
SELECT TOP 10 product_name, rating_count
FROM amazon
ORDER BY rating_count DESC;
-- 13. Products with more than 50% discount
SELECT product_name, discount_percentage
FROM amazon
WHERE discount_percentage > 0.50;
-- 14. Search products whose name contains 'USB'
SELECT *
FROM amazon
WHERE product_name LIKE '%USB%';
-- 15. Find products with NULL or invalid ratings
SELECT *
FROM amazon
WHERE TRY_CAST(rating AS FLOAT) IS NULL;
-- 16. Difference between actual price and discounted price

SELECT product_name,
       actual_price,
       discounted_price,
       TRY_CAST(actual_price AS DECIMAL(10,2))
       - TRY_CAST(discounted_price AS DECIMAL(10,2)) AS Savings
FROM amazon;
-- 17. Category-wise review count
SELECT category,
       SUM(
           TRY_CAST(REPLACE(rating_count, ',', '') AS BIGINT)
       ) AS TotalReviews
FROM amazon
GROUP BY category
ORDER BY TotalReviews DESC;
