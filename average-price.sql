select us.product_id, 
IFNULL(ROUND(SUM(pr.price * us.units) / SUM(us.units), 2), 0) AS average_price
from prices pr
left join UnitsSold us on pr.product_id = us.product_id
AND us.purchase_date BETWEEN pr.start_date AND pr.end_date
group by pr.product_id