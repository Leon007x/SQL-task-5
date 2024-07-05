select * from customer

select * from product

select * from sales

	-- left join

select s.product_id,s.order_id,s.customer_id,s.quantity,sum(s.sales),c.customer_id,customer_name, p.product_name from sales as s
left join product as p
on s.product_id = p.product_id
left join customer as c
on s.customer_id = c.customer_id
group by s.product_id,s.order_id,s.customer_id,s.quantity,p.product_name,c.customer_id,customer_name
having s.quantity > 2
limit 10

-- right join 

select s.customer_id,s.product_id,s.ship_mode,avg(s.profit),s.product_id,c.customer_name,c.age,c.state,p.product_name from sales as s
right join customer as c
on s.customer_id=c.customer_id
right join product as p
on s.product_id=p.product_id
group by s.customer_id,s.ship_mode,s.customer_id,s.product_id,c.customer_name,c.age,c.state,p.product_name
having age > 20
order by c.age
limit 10


-- full join
	
select c.customer_id,c.customer_name,s.profit,sum(s.sales),p.category,p.sub_category from customer as c
full join sales as s
on c.customer_id=s.customer_id
full join product as p
on s.product_id=p.product_id
group by c.customer_id,c.customer_name,s.profit,p.category,p.sub_category
having profit >1
order by customer_name
limit 10