-- Se necesita mostrar los clientes con cantidades compradas entre 0 y 100, además
-- se necesita unicamente las ventas a partir de la fecha 1/1/1996.

SELECT Customers.CustomerName, sum(OrderDetails.Quantity) as cantidades_compradas,
Orders.OrderDate
FROM Customers
INNER JOIN Orders on Orders.CustomerID=Customers.CustomerID
INNER JOIN OrderDetails on OrderDetails.OrderID=Orders.OrderID
WHERE Orders.OrderDate >= '1/1/1996'
GROUP by Orders.OrderDate
HAVING cantidades_compradas BETWEEN 0 AND 100
ORDER by Orders.OrderDate ASC

-- Se encesitan los medios de transporte de productos, con los productos y categorías
-- que cada uno de ellos trabaja.

SELECT Shippers.ShipperName, Products.ProductName, Categories.CategoryName
FROM Shippers
INNER JOIN Products on Products.CategoryID=Categories.CategoryID
INNER JOIN Categories on Categories.CategoryID=Products.CategoryID
ORDER by Shippers.ShipperName ASC

-- Se necesitan los proveedores con los productos, categorías que cada uno provee.

SELECT Suppliers.SupplierName, Products.ProductName, Categories.CategoryName
FROM Suppliers
INNER JOIN Products on Products.SupplierID=Suppliers.SupplierID
INNER JOIN Categories on Categories.CategoryID=Products.CategoryID
ORDER by Suppliers.SupplierName ASC

-- Se les pide mostrar el nombre del empleado, las ordenes, país del pedido,
-- pedidos del país, el transporte que lleva sus pedidos.

SELECT Employees.FirstName, Employees.LastName, Orders.OrderID, Products.ProductName,
Customers.Country as pais_del_pedido, count(OrderDetails.Quantity) pedidos_del_pais,
Suppliers.SupplierName, Shippers.ShipperName
FROM Employees
INNER JOIN Orders on Orders.EmployeeID=Employees.EmployeeID
INNER JOIN Products on Products.ProductID=OrderDetails.ProductID
INNER JOIN Customers on Customers.CustomerID=Orders.CustomerID
INNER JOIN Suppliers on Suppliers.Country=Customers.Country
INNER JOIN OrderDetails on OrderDetails.OrderID=Orders.OrderID
INNER JOIN Shippers on Shippers.ShipperID=Orders.ShipperID
GROUP by Employees.FirstName
ORDER by Employees.FirstName ASC