-- Get all customers and their addresses.
SELECT * FROM "customers" 
JOIN "addresses" on "customers"."id" = "addresses"."customer_id";

-- Get all orders and their line items (orders, quantity and product).
SELECT * FROM "orders" 
JOIN "line_items" on "orders"."id" = "line_items"."order_id";
--SHOULD THIS BE MORE?

-- Which warehouses have cheetos?
SELECT "products"."description", "warehouse"."warehouse" FROM "warehouse" 
JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id" 
JOIN "products" ON "products"."id" = "warehouse_product"."product_id" 
WHERE "products"."id" = 5;

-- Which warehouses have diet pepsi?
SELECT "products"."description", "warehouse"."warehouse" FROM "warehouse" 
JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id" 
JOIN "products" ON "products"."id" = "warehouse_product"."product_id" 
WHERE "products"."id" = 6;

-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers"."first_name", "customers"."last_name", COUNT ("orders"."id") 
FROM "customers" JOIN "addresses" ON "customers"."id" = "addresses"."customer_id" 
JOIN "orders" ON "orders"."address_id" = "addresses"."id" GROUP BY "customers"."id";

-- How many customers do we have?
SELECT COUNT("customers"."id") FROM "customers";

-- How many products do we carry?
SELECT COUNT("products"."id") FROM "products";

-- What is the total available on-hand quantity of diet pepsi?
SELECT "products"."description", SUM("warehouse_product"."on_hand") FROM "warehouse_product" 
JOIN "products" ON "products"."id" = "warehouse_product"."product_id" 
WHERE "products"."id" = 6 GROUP BY "products"."description";

