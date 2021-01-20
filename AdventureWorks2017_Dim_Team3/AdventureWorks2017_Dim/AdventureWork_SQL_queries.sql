
Use AdventureWorks2017;

/*Ranked order of Vendors by purchase amount $ */
SELECT POH.VendorID,
	   V.Name,
	   SUM(POH.SubTotal) AS Total
FROM Purchasing.PurchaseOrderHeader AS POH
LEFT JOIN Purchasing.Vendor AS V
ON (POH.VendorID = V.BusinessEntityID)
GROUP BY POH.VendorID,
		 V.Name
ORDER BY Total DESC;


/*Ranked order of products purchased by amount $ 
category,subcategory,product model,product*/

/*product*/
SELECT TOP 20 P.ProductID,
			  P.Name,
			  SUM(POD.OrderQty * POD.UnitPrice) AS Total
FROM Purchasing.PurchaseOrderDetail AS POD
LEFT JOIN Production.Product AS P
ON (POD.ProductID = P.ProductID)
GROUP BY P.ProductID,
		 P.Name
ORDER BY Total DESC;


/*model*/
SELECT TOP 20 PM.ProductModelID, 
			  PM.Name,
			  SUM(POD.OrderQty * POD.UnitPrice) AS Total
FROM Purchasing.PurchaseOrderDetail AS POD
LEFT JOIN Production.Product AS P
ON (POD.ProductID = P.ProductID)
LEFT JOIN Production.ProductModel AS PM
ON (P.ProductModelID = PM.ProductModelID)
WHERE PM.ProductModelID IS NOT NULL
GROUP BY PM.ProductModelID,
		 PM.Name
ORDER BY Total DESC;

/*subcategory*/
SELECT PS.ProductSubcategoryID,
	   PS.Name,
	   SUM(POD.OrderQty * POD.UnitPrice) AS Total
FROM Purchasing.PurchaseOrderDetail AS POD
LEFT JOIN Production.Product AS P
ON (POD.ProductID = P.ProductID)
LEFT JOIN Production.ProductSubcategory AS PS
ON (P.ProductSubcategoryID = PS.ProductSubcategoryID)
WHERE PS.ProductSubcategoryID IS NOT NULL
GROUP BY PS.ProductSubcategoryID,
		 PS.Name
ORDER BY Total DESC;


/*category*/
SELECT PC.ProductCategoryID, 
	   PC.Name, 
	   SUM(POD.OrderQty * POD.UnitPrice) AS Total
FROM Purchasing.PurchaseOrderDetail AS POD
LEFT JOIN Production.Product AS P
ON (POD.ProductID = P.ProductID)
LEFT JOIN Production.ProductSubcategory AS PS
ON (P.ProductSubcategoryID = PS.ProductSubcategoryID)
LEFT JOIN Production.ProductCategory AS PC
ON (PS.ProductCategoryID = PC.ProductCategoryID)
WHERE PC.ProductCategoryID IS NOT NULL
GROUP BY PC.ProductCategoryID,
		 PC.Name
ORDER BY Total DESC;



/*List of employees who purchased products with phone, email & address*/
SELECT E.BusinessEntityID, 
	   P.FirstName, P.LastName, 
	   A.AddressLine1, A.AddressLine2, A.City, A.PostalCode,
	   PP.PhoneNumber, 
	   EA.EmailAddress
FROM HumanResources.Employee AS E
LEFT JOIN Person.Person AS P
ON (E.BusinessEntityID = P.BusinessEntityID)
LEFT JOIN Person.BusinessEntityAddress AS BEA
ON (E.BusinessEntityID = BEA.BusinessEntityID)
LEFT JOIN Person.Address AS A
ON (BEA.AddressID = A.AddressID)
LEFT JOIN Person.EmailAddress AS EA
ON (E.BusinessEntityID = EA.BusinessEntityID)
LEFT JOIN Person.PersonPhone AS PP
ON (E.BusinessEntityID = PP.BusinessEntityID)
WHERE E.BusinessEntityID IN (
	SELECT POH.EmployeeID
	FROM Purchasing.PurchaseOrderHeader AS POH);



/*List of employees who purchased products with pay rate & raises (SCD)*/
/*SCD2 - calculated employee pay rate raise*/
SELECT EP.BusinessEntityID, 
	   EP.Rate,
	   EP.RateChangeDate, 
	   (EP.Rate - LAG(EP.Rate)
		   OVER (PARTITION BY EP.BusinessEntityID 
				 ORDER BY EP.RateChangeDate )) AS raise
FROM HumanResources.EmployeePayHistory AS EP
LEFT JOIN HumanResources.Employee AS E 
ON (EP.BusinessEntityID = E.BusinessEntityID)
WHERE E.BusinessEntityID IN (
	SELECT POH.EmployeeID
	FROM Purchasing.PurchaseOrderHeader AS POH)
ORDER BY EP.BusinessEntityID, EP.RateChangeDate;


/*List of purchasing vendor contacts with vendor name, phone, email & address*/
SELECT V.BusinessEntityID,
	   V.Name,
	   A.AddressLine1,A.AddressLine2,A.City,A.PostalCode,
	   EA.EmailAddress,
	   PP.PhoneNumber
FROM Purchasing.Vendor AS V
LEFT JOIN Person.BusinessEntityAddress AS BEA
ON (V.BusinessEntityID = BEA.BusinessEntityID)
LEFT JOIN Person.BusinessEntityContact AS BEC
on(V.BusinessEntityID=BEC.BusinessEntityID)
LEFT JOIN person.EmailAddress AS EA
ON (BEC.PersonID = EA.BusinessEntityID)
LEFT JOIN Person.PersonPhone AS PP
ON (BEC.PersonID = PP.BusinessEntityID)
LEFT JOIN Person.Address AS A
ON (BEA.AddressID = A.AddressID);


/*List of product prices by product order by product and SCD effective ascending*/
/*SCD2 because of StartDate and EndDate;*/
SELECT P.ProductID,
	   P.Name,
	   PLPH.ListPrice,
	   PLPH.StartDate,
	   PLPH.EndDate
FROM Production.ProductListPriceHistory AS PLPH
LEFT JOIN Production.Product AS P
ON (PLPH.ProductID = P.ProductID)
ORDER BY P.ProductID, PLPH.StartDate;


/*List of standard costs by product order by product and SCD effective ascending*/
/*SCD2 because of StartDate and EndDate;*/
SELECT PCH.ProductID, 
	   P.Name,
	   PCH.StartDate,
	   PCH.EndDate,
	   PCH.StandardCost
FROM Production.ProductCostHistory AS PCH
LEFT JOIN Production.Product AS P
ON (PCH.ProductID = P.ProductID)
ORDER BY PCH.ProductID, PCH.StartDate;




