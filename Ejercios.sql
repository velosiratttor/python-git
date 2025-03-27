-- Nombre de clientes y ordenes realizadas por estos mismos

SELECT Employees.FirstName, Employees.LastName,
OrderDetails.OrderID,Orders.OrderDate
FROM Employees
INNER JOIN Orders on Orders.EmployeeID=Employees.EmployeeID
INNER JOIN OrderDetails on OrderDetails.OrderID=Orders.OrderID
GROUP by Employees.FirstName
ORDER by Employees.FirstName ASC

-- Nombre de empleados, fechas y ordenes realizadas

SELECT Employees.FirstName, Employees.LastName,
OrderDetails.OrderID,Orders.OrderDate
FROM Employees
INNER JOIN Orders on Orders.EmployeeID=Employees.EmployeeID
INNER JOIN OrderDetails on OrderDetails.OrderID=Orders.OrderID

-- Mostrar las cantidades vendidas por empleados, mostrar
-- losnombres de productos y las categorías.

SELECT  Employees.FirstName, Employees.LastName,
Products.ProductName, Categories.CategoryName,  count(OrderDetails.Quantity) as ventas_empleados
FROM Employees
INNER JOIN Products on Products.ProductID=OrderDetails.ProductID
INNER JOIN Categories on Categories.CategoryID=Products.CategoryID
INNER JOIN OrderDetails on OrderDetails.OrderID=Orders.OrderID
INNER JOIN Orders on Orders.EmployeeID=Employees.EmployeeID
GROUP by Employees.FirstName
ORDER by Employees.FirstName DESC

-- Ordenes hechas por proveedor, cantidades con los nombres de productos
-- y sus categorías.

SELECT Suppliers.SupplierName, Products.ProductName, Categories.CategoryName,
count(OrderDetails.ProductID) as ordenes_proveedor
FROM Suppliers
INNER JOIN Products on Products.SupplierID=Suppliers.SupplierID
INNER JOIN Categories on Categories.CategoryID=Products.CategoryID
INNER JOIN OrderDetails on OrderDetails.ProductID= Products.ProductID
GROUP by Suppliers.SupplierName
ORDER by ProductName ASC