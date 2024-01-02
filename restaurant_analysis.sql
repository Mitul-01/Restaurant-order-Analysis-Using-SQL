#Expolring the menu items Table
Select * from menu_items;

#Q1. View the menu_items table and write a query to find the number of items on the menu
select * from menu_items;
select count(*) as number_of_Items from menu_items;

#Q2. What are the least and most expensive items on the menu?
Select * from menu_items
order by price desc;

Select * from menu_items
order by price;

#Q3. How many Italian dishes are on the menu? What are the least and most expensive Italian dishes on the menu?
Select count(*) as numbers_of_italian_items from menu_items
where category = 'Italian'
order by price desc;

Select * from menu_items
where category = 'Italian'
order by price desc;

#Q4. How many dishes are in each category? What is the average dish price within each category?
Select  category, 
	count(category) as number_of_dishes, 
	round(avg(price), 2) as Average_price_of_category 
from menu_items
group by category;

#Objective 2 
	
#Q5. View the order_details table.
Select * from order_details;

#Q5. What is the date range of the table?
Select min(order_date), max(order_date) 
 from order_details;

#Q6. How many orders were made within this date range? 
Select count(*) as count_of_orders from order_details
where order_date >= '2023-01-01' and order_date <= '2023-03-31';


#Q7. Which orders had the most number of items?
Select order_id, count(item_id) from order_details 
group by order_id;

#Expolring the order detail table
Select * from order_details;

#Q8. How many orders had more than 12 items?
Select order_id, 
	count(item_id) as number_of_items 
from order_details 
group by order_id
having count(item_id) > 12;

#OBJECTIVE 3
#Analyze customer behavior
#Q9. Combine the menu_items and order_details tables into a single table
Select * from order_details o
left join menu_items m
on m.menu_item_id = o.item_id;

#Q10. What were the least and most ordered items? 
#Most ordered item
Select item_name, count(order_details_id) from order_details o
left join menu_items m
on m.menu_item_id = o.item_id
group by item_name
order by count(order_details_id) desc
limit 5;

#Q11. Least ordered item
Select m.* from order_details o
join menu_items m
on m.menu_item_id = o.item_id
group by item_name
order by count(order_details_id) desc
limit 5;

#Q12. What categories were they in?
Select m.item_name, m.category from order_details o
join menu_items m
on m.menu_item_id = o.item_id
group by item_name, category
order by  count(order_details_id) desc
limit 5;

#Q13. What were the top 5 orders that spent the most money?
Select order_id  , sum(price) as total_price,  m.*from order_details o
join menu_items m
on m.menu_item_id = o.item_id
group by o.order_id
order by sum(price)  desc
limit 5;

#Q14. View the details of the highest spend order. #Which specific items were purchased?
Select order_id,category, count(item_id) from order_details o
left join menu_items m
on m.menu_item_id = o.item_id
where order_id in (440,2075,1957,330,2675)
group by order_id , category;


#Q15. How much was the most expensive order in the dataset? #192.15
Select *, sum(price) from order_details o
inner join menu_items m
on m.menu_item_id = o.item_id
group by order_id
order by sum(price) desc


