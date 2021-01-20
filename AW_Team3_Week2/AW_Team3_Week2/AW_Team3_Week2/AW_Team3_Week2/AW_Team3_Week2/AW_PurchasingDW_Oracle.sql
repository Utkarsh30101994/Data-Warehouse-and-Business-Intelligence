--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      AWPurchasing.DM1
--
-- Date Created : Thursday, October 08, 2020 00:08:12
-- Target DBMS : Oracle 11g
--

DROP TABLE Dim_Date CASCADE CONSTRAINTS
;
DROP TABLE Dim_Employee CASCADE CONSTRAINTS
;
DROP TABLE Dim_EmployeePay CASCADE CONSTRAINTS
;
DROP TABLE Dim_Geography CASCADE CONSTRAINTS
;
DROP TABLE Dim_Product CASCADE CONSTRAINTS
;
DROP TABLE Dim_ProductInventory CASCADE CONSTRAINTS
;
DROP TABLE Dim_ProductStandardCost CASCADE CONSTRAINTS
;
DROP TABLE Dim_ProductVendor CASCADE CONSTRAINTS
;
DROP TABLE Dim_SalesTerritory CASCADE CONSTRAINTS
;
DROP TABLE Dim_ShipMethod CASCADE CONSTRAINTS
;
DROP TABLE Dim_Vendor CASCADE CONSTRAINTS
;
DROP TABLE DimProductListPrice CASCADE CONSTRAINTS
;
DROP TABLE Fact_OrderDetail CASCADE CONSTRAINTS
;
DROP TABLE FactPurchaseOrderHeader CASCADE CONSTRAINTS
;
-- 
-- TABLE: Dim_Date 
--

CREATE TABLE Dim_Date(
    SK_Date             TIMESTAMP(6)     NOT NULL,
    PK_Date             NUMBER(38, 0)    NOT NULL,
    DayNumberOfWeek     NUMBER(38, 0)    NOT NULL,
    DayNumberOfMonth    NUMBER(38, 0)    NOT NULL,
    DayNumberOfYear     NUMBER(38, 0)    NOT NULL,
    WeekNumberOfYear    NUMBER(38, 0)    NOT NULL,
    MonthName           NUMBER(38, 0)    NOT NULL,
    MonthNumber         NUMBER(38, 0)    NOT NULL,
    CalenderYear        NUMBER(38, 0)    NOT NULL,
    CreateDate          DATE             NOT NULL,
    ModifiedDate        DATE             NOT NULL,
    CalenderQuarter     NUMBER(38, 0)    NOT NULL,
    FiscalYear          NUMBER(38, 0)    NOT NULL,
    FiscalQurater       NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY (SK_Date)
)
;



-- 
-- TABLE: Dim_Employee 
--

CREATE TABLE Dim_Employee(
    SK_EmployeeID        CHAR(10)         NOT NULL,
    NationalIDNumber     NVARCHAR2(18)    NOT NULL,
    LoginID              NVARCHAR2(10)    NOT NULL,
    OrganizationNode     CHAR(10)         NOT NULL,
    OrganizationLevel    SMALLINT         NOT NULL,
    JobTitle             NVARCHAR2(10)    NOT NULL,
    MaritalStatus        NCHAR(10)        NOT NULL,
    Gender               NCHAR(10)        NOT NULL,
    CurrentFlag          NUMBER(1, 0)     NOT NULL,
    CONSTRAINT PK6 PRIMARY KEY (SK_EmployeeID)
)
;



-- 
-- TABLE: Dim_EmployeePay 
--

CREATE TABLE Dim_EmployeePay(
    SK_EmployeePayTable    NUMBER(38, 0)    NOT NULL,
    RateChangeDate         DATE             NOT NULL,
    Rate                   NUMBER(10, 0)    NOT NULL,
    PayFrequency           NUMBER(3, 0)     NOT NULL,
    SK_EmployeeID          CHAR(10),
    CONSTRAINT PK8 PRIMARY KEY (SK_EmployeePayTable)
)
;



-- 
-- TABLE: Dim_Geography 
--

CREATE TABLE Dim_Geography(
    GeographyID    NUMBER(38, 0)    NOT NULL,
    Address        CHAR(10)         NOT NULL,
    PostalCode     NUMBER(38, 0)    NOT NULL,
    Country        CHAR(10)         NOT NULL,
    State          CHAR(10)         NOT NULL,
    City           CHAR(10)         NOT NULL,
    CONSTRAINT PK2 PRIMARY KEY (GeographyID)
)
;



-- 
-- TABLE: Dim_Product 
--

CREATE TABLE Dim_Product(
    SK_ProductID              NUMBER(38, 0)    NOT NULL,
    Created_Date              TIMESTAMP(6)     NOT NULL,
    Modified_Date             TIMESTAMP(6)     NOT NULL,
    RowGuid                   RAW(16)          NOT NULL,
    Weight                    NUMBER(38, 0)    NOT NULL,
    ProductSize               NVARCHAR2(10)    NOT NULL,
    ProductNumber             NVARCHAR2(10)    NOT NULL,
    Name                      NVARCHAR2(10)    NOT NULL,
    ProductCategoryName       NVARCHAR2(10)    NOT NULL,
    ProductSubCategoryName    NVARCHAR2(10)    NOT NULL,
    ProductModelName          NVARCHAR2(10)    NOT NULL,
    MakeFlag                  RAW(10)          NOT NULL,
    FinishedGoodFlag          RAW(10)          NOT NULL,
    DaysToManufacture         NVARCHAR2(10)    NOT NULL,
    ReOrderPoint              NVARCHAR2(10)    NOT NULL,
    Productline               NVARCHAR2(10)    NOT NULL,
    Class                     NVARCHAR2(10)    NOT NULL,
    Style                     NVARCHAR2(10)    NOT NULL,
    SellStartDate             NVARCHAR2(10)    NOT NULL,
    SellEndDate               NVARCHAR2(10)    NOT NULL,
    DiscontinuedDate          NVARCHAR2(10)    NOT NULL,
    CatalogDescription        NVARCHAR2(10)    NOT NULL,
    UniPrice                  NUMBER(10, 0)    NOT NULL,
    DI_Job_ID                 NVARCHAR2(10)    NOT NULL,
    SOR_SK                    NVARCHAR2(10)    NOT NULL,
    Color                     NVARCHAR2(10)    NOT NULL,
    PK_ProductID              NUMBER(38, 0)    NOT NULL,
    SK_ShipMethodID           NUMBER(38, 0),
    CONSTRAINT PK4 PRIMARY KEY (SK_ProductID)
)
;



-- 
-- TABLE: Dim_ProductInventory 
--

CREATE TABLE Dim_ProductInventory(
    LocationID      NUMBER(38, 0)    NOT NULL,
    Quantity        SMALLINT         NOT NULL,
    Shelf           NVARCHAR2(10)    NOT NULL,
    Bin             NUMBER(3, 0)     NOT NULL,
    RowGuid         RAW(16)          NOT NULL,
    ModifiedDate    DATE             NOT NULL,
    GeographyID     NUMBER(38, 0),
    SK_ProductID    NUMBER(38, 0)    NOT NULL
)
;



-- 
-- TABLE: Dim_ProductStandardCost 
--

CREATE TABLE Dim_ProductStandardCost(
    CurrentIndicator    RAW(10)          NOT NULL,
    CostPrice           NUMBER(10, 0)    NOT NULL,
    EffectiveDate       TIMESTAMP(6)     NOT NULL,
    IneffectiveDate     TIMESTAMP(6)     NOT NULL
)
;



-- 
-- TABLE: Dim_ProductVendor 
--

CREATE TABLE Dim_ProductVendor(
    ProductVendorID        NUMBER(38, 0)    NOT NULL,
    AverageLoadTime        NUMBER(38, 0)    NOT NULL,
    StandardPrice          NUMBER(10, 0)    NOT NULL,
    MinOrderQuantity       NUMBER(38, 0)    NOT NULL,
    MaxOrderQuantity       NUMBER(38, 0)    NOT NULL,
    ActualOrderQuantity    NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK12 PRIMARY KEY (ProductVendorID)
)
;



-- 
-- TABLE: Dim_SalesTerritory 
--

CREATE TABLE Dim_SalesTerritory(
    SK_SalesTerritoryID    NUMBER(38, 0)    NOT NULL,
    RowGuid                RAW(16)          NOT NULL,
    CostLastYear           NUMBER(10, 0)    NOT NULL,
    CostYTD                NUMBER(10, 0)    NOT NULL,
    SalesYTD               NUMBER(10, 0)    NOT NULL,
    SalesLastYear          NUMBER(10, 0)    NOT NULL,
    Name                   NVARCHAR2(10)    NOT NULL,
    Territory_Group        NVARCHAR2(10)    NOT NULL,
    GeographyID            NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK7 PRIMARY KEY (SK_SalesTerritoryID)
)
;



-- 
-- TABLE: Dim_ShipMethod 
--

CREATE TABLE Dim_ShipMethod(
    SK_ShipMethodID    NUMBER(38, 0)    NOT NULL,
    rowguid            RAW(16)          NOT NULL,
    ShipRate           NUMBER(10, 0)    NOT NULL,
    ShipBase           NUMBER(10, 0)    NOT NULL,
    Name               NVARCHAR2(10)    NOT NULL,
    CONSTRAINT PK18 PRIMARY KEY (SK_ShipMethodID)
)
;



-- 
-- TABLE: Dim_Vendor 
--

CREATE TABLE Dim_Vendor(
    SK_VendorID              NUMBER(38, 0)    NOT NULL,
    PreferredVendorStatus    RAW(10)          NOT NULL,
    ActiveFlag               RAW(10)          NOT NULL,
    AccountNumber            NVARCHAR2(10)    NOT NULL,
    Name                     NVARCHAR2(10)    NOT NULL,
    CreditRating             NUMBER(3, 0)     NOT NULL,
    ProductURL               CHAR(10)         NOT NULL,
    GeographyID              NUMBER(38, 0),
    CONSTRAINT PK17 PRIMARY KEY (SK_VendorID)
)
;



-- 
-- TABLE: DimProductListPrice 
--

CREATE TABLE DimProductListPrice(
    SK_ProductListPriceStartDate    TIMESTAMP(6)     NOT NULL,
    Current_Indicator               RAW(10)          NOT NULL,
    ListPrice                       NUMBER(10, 0)    NOT NULL,
    SK_ProductID                    NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK13 PRIMARY KEY (SK_ProductListPriceStartDate)
)
;



-- 
-- TABLE: Fact_OrderDetail 
--

CREATE TABLE Fact_OrderDetail(
    ProductOrderDetailID    NUMBER(38, 0)    NOT NULL,
    UnitPrice               CHAR(10)         NOT NULL,
    LineTotal               NUMBER(10, 0)    NOT NULL,
    RejectedQty             NUMBER(10, 0)    NOT NULL,
    RecievedQty             NUMBER(10, 0)    NOT NULL,
    StockedQty              NUMBER(10, 0)    NOT NULL,
    OrderQty                SMALLINT         NOT NULL,
    SK_Date                 TIMESTAMP(6)     NOT NULL,
    CONSTRAINT PK14 PRIMARY KEY (ProductOrderDetailID)
)
;



-- 
-- TABLE: FactPurchaseOrderHeader 
--

CREATE TABLE FactPurchaseOrderHeader(
    PurchaseOrderID    NUMBER(38, 0)    NOT NULL,
    OrderQty           NVARCHAR2(10)    NOT NULL,
    LineTotal          NUMBER(18, 0)    NOT NULL,
    RecievedQty        NVARCHAR2(10)    NOT NULL,
    StockedQty         NVARCHAR2(10)    NOT NULL,
    DI_JobID           NVARCHAR2(10)    NOT NULL,
    Created_Date       TIMESTAMP(6)     NOT NULL,
    Modified_Date      TIMESTAMP(6)     NOT NULL,
    RevisionNumber     NUMBER(3, 0)     NOT NULL,
    SubTotal           NUMBER(10, 0)    NOT NULL,
    TaxAmt             NUMBER(10, 0)    NOT NULL,
    TotalDue           NUMBER(10, 0)    NOT NULL,
    Frieght            NUMBER(10, 0)    NOT NULL,
    Status             NUMBER(3, 0)     NOT NULL,
    SK_EmployeeID      CHAR(10),
    GeographyID        NUMBER(38, 0),
    ProductVendorID    NUMBER(38, 0),
    SK_VendorID        NUMBER(38, 0),
    SK_ShipMethodID    NUMBER(38, 0),
    SK_Date            TIMESTAMP(6)     NOT NULL,
    o                  TIMESTAMP(6)     NOT NULL,
    CONSTRAINT PK11 PRIMARY KEY (PurchaseOrderID)
)
;



-- 
-- TABLE: Dim_EmployeePay 
--

ALTER TABLE Dim_EmployeePay ADD CONSTRAINT RefDim_Employee81 
    FOREIGN KEY (SK_EmployeeID)
    REFERENCES Dim_Employee(SK_EmployeeID)
;


-- 
-- TABLE: Dim_Product 
--

ALTER TABLE Dim_Product ADD CONSTRAINT RefDim_ShipMethod351 
    FOREIGN KEY (SK_ShipMethodID)
    REFERENCES Dim_ShipMethod(SK_ShipMethodID)
;

-- 
-- TABLE: Dim_ProductInventory 
--

ALTER TABLE Dim_ProductInventory ADD CONSTRAINT RefDim_Product441 
    FOREIGN KEY (SK_ProductID)
    REFERENCES Dim_Product(SK_ProductID)
;


-- 
-- TABLE: Dim_SalesTerritory 
--

ALTER TABLE Dim_SalesTerritory ADD CONSTRAINT RefDim_Geography21 
    FOREIGN KEY (GeographyID)
    REFERENCES Dim_Geography(GeographyID)
;


-- 
-- TABLE: Dim_Vendor 
--

ALTER TABLE Dim_Vendor ADD CONSTRAINT RefDim_Geography91 
    FOREIGN KEY (GeographyID)
    REFERENCES Dim_Geography(GeographyID)
;


-- 
-- TABLE: DimProductListPrice 
--

ALTER TABLE DimProductListPrice ADD CONSTRAINT RefDim_Product431 
    FOREIGN KEY (SK_ProductID)
    REFERENCES Dim_Product(SK_ProductID)
;


-- 
-- TABLE: Fact_OrderDetail 
--

ALTER TABLE Fact_OrderDetail ADD CONSTRAINT RefDim_Date421 
    FOREIGN KEY (SK_Date)
    REFERENCES Dim_Date(SK_Date)
;


-- 
-- TABLE: FactPurchaseOrderHeader 
--

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDim_Vendor141 
    FOREIGN KEY (SK_VendorID)
    REFERENCES Dim_Vendor(SK_VendorID)
;

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDim_Vendor151 
    FOREIGN KEY (SK_VendorID)
    REFERENCES Dim_Vendor(SK_VendorID)
;

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDim_Employee271 
    FOREIGN KEY (SK_EmployeeID)
    REFERENCES Dim_Employee(SK_EmployeeID)
;

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDim_Geography281 
    FOREIGN KEY (GeographyID)
    REFERENCES Dim_Geography(GeographyID)
;

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDim_ProductVendor301 
    FOREIGN KEY (ProductVendorID)
    REFERENCES Dim_ProductVendor(ProductVendorID)
;

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDim_ShipMethod341 
    FOREIGN KEY (SK_ShipMethodID)
    REFERENCES Dim_ShipMethod(SK_ShipMethodID)
;

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDim_Date381 
    FOREIGN KEY (SK_Date)
    REFERENCES Dim_Date(SK_Date)
;

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDim_Date391 
    FOREIGN KEY (SK_Date)
    REFERENCES Dim_Date(SK_Date)
;

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDim_Date401 
    FOREIGN KEY (SK_Date)
    REFERENCES Dim_Date(SK_Date)
;

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDim_Date411 
    FOREIGN KEY (o)
    REFERENCES Dim_Date(SK_Date)
;


