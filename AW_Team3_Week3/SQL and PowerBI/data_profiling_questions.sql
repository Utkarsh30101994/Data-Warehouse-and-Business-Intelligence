Use AWPurchasing;

# rank order of vender
select factpurchaseorderheader.VendorID,dim_vendor.Name, sum(factpurchaseorderheader.SubTotal) as tot from 
factpurchaseorderheader left join dim_vendor
on (factpurchaseorderheader.VendorID=dim_vendor.NK_VendorID)
group by dim_vendor.NK_VendorID
order by tot desc;

#ranked category
select dim_product.ProductCategoryName,sum(fact_orderdetail.LineTotal) as tot from
fact_orderdetail left join dim_product
on (fact_orderdetail.ProductID=dim_product.NK_ProductID)
where dim_product.ProductCategoryName is not null
group by dim_product.ProductCategoryName
order by tot desc;

#ranked subcatecory
select dim_product.ProductSubCategoryName,sum(fact_orderdetail.LineTotal) as tot from
fact_orderdetail left join dim_product
on (fact_orderdetail.ProductID=dim_product.NK_ProductID)
where dim_product.ProductSubCategoryName is not null
group by dim_product.ProductSubCategoryName
order by tot desc;

#ranked model
select dim_product.ProductModelName,sum(fact_orderdetail.LineTotal) as tot from
fact_orderdetail left join dim_product
on (fact_orderdetail.ProductID=dim_product.NK_ProductID)
where dim_product.ProductModelName is not null
group by dim_product.ProductModelName
order by tot desc
limit 20;

#ranked product
select dim_product.ProductName,sum(fact_orderdetail.LineTotal) as tot from
fact_orderdetail left join dim_product
on (fact_orderdetail.ProductID=dim_product.NK_ProductID)
where dim_product.ProductName is not null
group by dim_product.ProductName
order by tot desc
limit 20;

#employee phone, email, address
select distinct(employee_info.BusinessEntityID),employee_info.FirstName, employee_info.LastName, employee_info.MiddleName,
employee_info.AddressLine1,employee_info.AddressLine2,employee_info.City,dim_geography.StateName,dim_geography.CountryName,employee_info.PostalCode,
employee_info.EmailAddress,employee_info.PhoneNumber
from
(select distinct(dim_employee.BusinessEntityID), dim_employee.FirstName, dim_employee.LastName, dim_employee.MiddleName,
dim_employee.AddressLine1,dim_employee.AddressLine2,dim_employee.City,dim_employee.SK_GeographyID,dim_employee.PostalCode,
dim_employee.EmailAddress,dim_employee.PhoneNumber
 from dim_employee) as employee_info
 left join (select factpurchaseorderheader.EmployeeID from factpurchaseorderheader) as order_info
 on (employee_info.BusinessEntityID=order_info.EmployeeID)
 left join dim_geography
 on (employee_info.SK_GeographyID=dim_geography.SK_GeographyID)
 where order_info.EmployeeID is not null;



# Employee pay and raise
select *,
(pay_hist.Rate-LAG(pay_hist.Rate,1)
OVER (PARTITION BY pay_hist.BusinessEntityID
				 ORDER BY pay_hist.RateChangeDate )) as raise
from
(select distinct dim_employee.BusinessEntityID,dim_employee.FirstName,dim_employee.LastName,dim_employee.MiddleName,
dim_employeepay.Rate,dim_employeepay.RateChangeDate
from 
dim_employeepay left join dim_employee
on (dim_employeepay.SK_EmployeeID=dim_employee.SK_EmployeeID)) as pay_hist;


#vendor name, phone, email
select dim_vendor.NK_VendorID, dim_vendor.Name, dim_vendorcontacts.PhoneNumber, dim_vendorcontacts.EmailAddress
 from dim_vendor left join dim_vendorcontacts
on (dim_vendor.NK_VendorID=dim_vendorcontacts.NK_VendorID);

#prduct prices SCD
select dimproductlistprice.ProductID,dim_product.ProductName,dimproductlistprice.ListPrice,
dimproductlistprice.StartDate,dimproductlistprice.EndDate
from dimproductlistprice left join dim_product on (dimproductlistprice.ProductID=dim_product.NK_ProductID)
where ProductName is not null
order by ProductID, StartDate;


# Standard cost SCD
select (dim_productstandardcost.NK_ProductID) as Product_ID,
dim_product.ProductName, dim_productstandardcost.StandardCost,
 dim_productstandardcost.StartDate,dim_productstandardcost.EndDate from 
dim_productstandardcost left join dim_product
on (dim_productstandardcost.NK_ProductID=dim_product.NK_ProductID)
order by Product_ID, StartDate;

