DELETE FROM ORDER_LINE WHERE ORDER_ID IN (SELECT ORDER_ID FROM ORDERT WHERE CUSTOMER_ID = 10001);
DELETE FROM ORDERT WHERE CUSTOMER_ID = 10001;
DELETE FROM CUSTOMER WHERE CUSTOMER_ID = 10001;

SELECT * FROM CUSTOMER;
SELECT * FROM ORDERT;
SELECT * FROM ORDER_LINE;