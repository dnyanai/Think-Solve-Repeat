Q05: Total Transactions		

Company: Amazon   |   Type: SQL   |   Difficulty: Easy   |   Added: Nov 13, 2024	

Solution Link:	https://www.interviewquery.com/questions/total-transactions	
		
📝 Problem:	Problem Statement	

Write a query to get the cost of all transactions by user ordered by total cost descending.
Note: Round the total cost to 2 decimal places.

Tables:
- transactions(id INT, user_id INT, created_at DATETIME, product_id INT, quantity INT)
- products(id INT, name VARCHAR, price FLOAT)
- users(id INT, name VARCHAR, created_at DATETIME)
Output: name VARCHAR, user_id INT, total_cost FLOAT		

📌 Notes / Hints:	Key concepts, mistakes, follow-ups	

This question shows how its important to understand what the data is about for example the total_cost = quantity x price, not just price. 
Also, knowing the granularity is important here in the output too (in general good practice to declare/ identify that).
The cte is at product_id level granularity but the output is one level up i.e. at user_id granularity. 
