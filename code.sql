-- Рівень 1 пункт 1

-- Отримати всі записи з таблиці customers.
select * from customers;

-- Вивести тільки назви товарів і їхні ціни з таблиці products.
select product_name, unit_price from products;

-- Показати контактні дані всіх співробітників (ім'я, прізвище, телефон, email).
select first_name, middle_name, phone, email from employees;

-- Знайти всіх клієнтів з міста Київ.
select * from customers
where city = 'Київ';

-- Вивести товари, які коштують більше 25000 грн.
select * from products
where unit_price > 25000;

-- Показати всі замовлення зі статусом 'delivered'.
select * from orders
where order_status = 'delivered';

-- Знайти співробітників, які працюють у відділі продажів (посада містить слово "продаж").
select * from employees
where title like '%продаж%';

-- Відсортувати товари за зростанням ціни.
select * from products
order by unit_price;

-- Показати клієнтів в алфавітному порядку за іменем контактної особи.
SELECT * FROM customers
ORDER BY contact_name;

-- Вивести замовлення від найновіших до найстаріших.
SELECT * FROM orders
ORDER BY order_date DESC;

-- Показати перші 10 найдорожчих товарів.
SELECT * FROM products
ORDER BY unit_price DESC
LIMIT 10;

-- Вивести 5 останніх замовлень (за датою).
SELECT * FROM orders
ORDER BY order_date DESC
LIMIT 5;

-- Отримати перших 8 клієнтів в алфавітному порядку.
SELECT * FROM customers
ORDER BY contact_name ASC
LIMIT 8;


-- Рівень 2

-- Знайти всіх клієнтів, чиї імена починаються на "Іван".
SELECT * FROM customers
WHERE contact_name LIKE 'Іван%';

-- Вивести товари, в назві яких є слово "phone" або "телефон".
SELECT * FROM products
WHERE product_name ILIKE '%phone%' OR product_name ILIKE '%телефон%';

-- LIKE – 3 власні запити.
SELECT * FROM customers
WHERE contact_name LIKE '%ич';        -- ПІБ закінчується на "ич"

SELECT * FROM products
WHERE product_name LIKE '%Samsung%';   -- Продукція "Samsung"

SELECT * FROM orders
WHERE order_status LIKE 'shipped';  -- Доставлені товари

-- Знайти товари дорожчі за 15000 грн і дешевші за 50000 грн.
SELECT * FROM products
WHERE unit_price > 15000 AND unit_price < 50000;

-- Вивести клієнтів з Києва або Львова, які є юридичними особами.
SELECT * FROM customers
WHERE (city = 'Київ' OR city = 'Львів') AND customer_type = 'company';

-- AND / OR / NOT – 4 власні запити.
SELECT * FROM employees
WHERE title LIKE 'Менеджер%' AND salary < 24000; -- менеджери з зп менше 24000
SELECT * FROM products
WHERE category_id = 1 OR category_id = 2; -- товари категорії 1 і 2
SELECT * FROM orders
WHERE NOT order_status = 'delivered'; -- всі ще не прийняті клієнтами
SELECT * FROM customers
WHERE city = 'Одеса' AND customer_type = 'individual'; -- фіз особи з одеси

-- Вивести клієнтів з міст Київ, Харків, Одеса, Дніпро.
SELECT * FROM customers
WHERE city IN ('Київ','Харків','Одеса','Дніпро');

-- Знайти товари в ціновому діапазоні від 10000 до 30000 грн.
SELECT * FROM products
WHERE unit_price BETWEEN 10000 AND 30000;

-- IN, BETWEEN, IS NULL – по 2 власні запити.
-- IN
SELECT * FROM employees
WHERE city IN ('Харків','Львів'); -- працівники з Харкова та Львова
SELECT * FROM orders
WHERE customer_id IN (1,2,3,4,5); -- замовлення від клієнтів 1, 2, 3, 4, 5

-- BETWEEN
SELECT * FROM products
WHERE unit_price BETWEEN 5000 AND 20000; -- продукти з ціною від 5000 до 20000
SELECT * FROM orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-04-01'; -- Замовлення зроблені між січнем і квітнем

-- IS NULL / IS NOT NULL
SELECT * FROM customers
WHERE contact_title IS NULL; -- фіз особа
SELECT * FROM employees
WHERE email IS NOT NULL; -- клієнти. Просто клієнти. Пошта є у всіх

-- Створити 5 складних запитів з комбінуванням умов.
SELECT * FROM products
WHERE
  (product_name LIKE '%Phone%' OR product_name LIKE '%Mac%')
  AND unit_price > 15000; -- телефони, і тродукція серії Mac дорожча за 15000
SELECT * FROM orders
WHERE
  order_date BETWEEN '2024-01-01'
  AND '2024-04-01'
  AND order_status IN ('delivered','shipped'); -- забрані, або доставлені і ще не забрані замовлення зроблені між січнем і квітнем
SELECT * FROM customers
WHERE
  city IN ('Київ','Львів')
  AND contact_name LIKE '%Іван%'; -- Клієнти з іменем Іван або батьком Іваном
SELECT * FROM employees
WHERE
  (salary < 28000 OR title ILIKE '%бухгалтер%')
  AND reports_to = 1; -- Бухгалтери, і люди з зп менше 28000, що звітуються гендиректору
SELECT * FROM products
WHERE
  unit_price BETWEEN 10000 AND 50000
  AND product_name LIKE '%Pro%'; -- Продукт серії Pro за ціною від 10000 до 50000

-- Написати 3 запити з сортуванням за кількома полями.
SELECT * FROM products
ORDER BY category_id ASC, unit_price DESC; -- сортування за category_id за зростанням і за unit_price за спаданням
SELECT * FROM orders
ORDER BY customer_id ASC, order_date DESC; -- сортування за category_id за зростанням і за order_date за спаданням
SELECT * FROM employees
ORDER BY title ASC, last_name ASC, first_name ASC; -- сортування за зростанням за title, last_name, first_name

-- Виконати 2 запити з використанням OFFSET для пагінації.
SELECT * FROM products
ORDER BY unit_price DESC -- сортувати за зниженням ціни
LIMIT 10 OFFSET 10; -- записи 11-20
SELECT * FROM customers
ORDER BY contact_name ASC -- сортувати за ім'ям в алфавітному порядку
LIMIT 5 OFFSET 5; -- записи 6-10
