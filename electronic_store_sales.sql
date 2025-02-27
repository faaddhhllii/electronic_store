SELECT 
	*
FROM electronic_sales es ;

-- checking duplicate data
SELECT *, COUNT(*) AS duplicate_count
FROM electronic_sales es 
GROUP BY `date`, id, category_id, sales, views, price_cost, price_retail 
HAVING COUNT(*) > 1;

-- checking missing values column date
SELECT 
	*
FROM electronic_sales es 
WHERE `date` IS NULL;

-- checking missing values column id
SELECT 
	*
FROM electronic_sales es 
WHERE id IS NULL;

-- checking missing values category id
SELECT 
	*
FROM electronic_sales es 
WHERE category_id IS NULL;

-- checking missing values sales
SELECT 
	*
FROM electronic_sales es 
WHERE sales IS NULL;

-- checking missing values views
SELECT 
	*
FROM electronic_sales es 
WHERE views IS NULL;

-- checking missing values price_cost
SELECT 
	*
FROM electronic_sales es 
WHERE price_cost IS NULL;

-- checking missing values price_cost
SELECT 
	*
FROM electronic_sales es 
WHERE price_retail IS NULL;

-- Anaysis
-- 1. Average daily sales per product
SELECT 
	id,
	AVG(sales) AS avg_sales
FROM electronic_sales es 
GROUP BY 1
ORDER BY 2 DESC;

-- 2. Product with the highest total sales
SELECT 
	id,
	SUM(sales) AS total_sales
FROM electronic_sales es
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- 3. Product category with the highest sales
SELECT 
	category_id,
	SUM(sales) AS total_sales
FROM electronic_sales es 
GROUP BY 1
ORDER BY 2 DESC;

-- 4. Comparison of average selling price and capital price per category
SELECT 
	category_id,
	AVG(price_cost) AS avg_cost_price,
	AVG(price_retail) AS avg_retail_price,
	AVG(price_retail - price_cost) AS avg_profit_margin 
FROM electronic_sales es
GROUP BY 1
ORDER BY avg_profit_margin DESC;

-- 5. Monthly sales trends
SELECT 
	DATE_FORMAT(`date`, '%Y-%m') AS `month`,
	SUM(sales) AS sales
FROM electronic_sales es 
GROUP BY 1;

-- 6. Days with highest and lowest sales
SELECT 
	DAYNAME(`date`)  AS `day`,
	SUM(sales) AS sales
FROM electronic_sales es 
GROUP BY 1
ORDER BY 2 DESC;

-- 7. The product with the most consistent sales
SELECT 
	id,
	STDDEV(sales) AS sales_variance,
	AVG(sales) AS avg_sales 
FROM electronic_sales es 
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- 8. Products that are often sold with discounts
SELECT 
	id,
	COUNT(*) as total_id
FROM electronic_sales es 
WHERE price_retail < price_cost 
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- 9. Highest Views to Sales Ratio
SELECT 
	views,
	SUM(sales) AS total_sales
FROM electronic_sales es 
GROUP BY 1
ORDER BY 1 DESC

-- 10. Average selling price of products that sell vs. those that don't sell
SELECT
	CASE 
		WHEN sales > 0 THEN 'laku'
		ELSE 'tidak_laku'
	END AS category_produk,
	AVG(price_retail) AS price_retail
FROM electronic_sales es
GROUP BY 1 ;
	

	

