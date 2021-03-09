



DBCC CHECKIDENT('order_item_line', RESEED, 0);
DBCC CHECKIDENT('orders', RESEED, 0);
Delete from ORDERS; 
delete from ORDER_ITEM_LINE; 
select * from orders; 
select * from ORDER_ITEM_LINE; 