--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      AWPurchasing.DM1
--
-- Date Created : Thursday, October 08, 2020 00:13:28
-- Target DBMS : MySQL 5.x
--

DROP TABLE Dim_Date
;
DROP TABLE Dim_Employee
;
DROP TABLE Dim_EmployeePay
;
DROP TABLE Dim_Geography
;
DROP TABLE Dim_Product
;
DROP TABLE Dim_ProductInventory
;
DROP TABLE Dim_ProductStandardCost
;
DROP TABLE Dim_ProductVendor
;
DROP TABLE Dim_SalesTerritory
;
DROP TABLE Dim_ShipMethod
;
DROP TABLE Dim_Vendor
;
DROP TABLE DimProductListPrice
;
DROP TABLE Fact_OrderDetail
;
DROP TABLE FactPurchaseOrderHeader
;
-- 
-- TABLE: Dim_Date 
--

CREATE TABLE Dim_Date(
    SK_Date             DATETIME    NOT NULL,
    PK_Date             INT         NOT NULL,
    DayNumberOfWeek     INT         NOT NULL,
    DayNumberOfMonth    INT         NOT NULL,
    DayNumberOfYear     INT         NOT NULL,
    WeekNumberOfYear    INT         NOT NULL,
    MonthName           INT         NOT NULL,
    MonthNumber         INT         NOT NULL,
    CalenderYear        INT         NOT NULL,
    CreateDate          DATE        NOT NULL,
    ModifiedDate        DATE        NOT NULL,
    CalenderQuarter     INT         NOT NULL,
    FiscalYear          INT         NOT NULL,
    FiscalQurater       INT         NOT NULL,
    PRIMARY KEY (SK_Date)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_Employee 
--

CREATE TABLE Dim_Employee(
    SK_EmployeeID        CHAR(10)                NOT NULL,
    NationalIDNumber     NATIONAL VARCHAR(18)    NOT NULL,
    LoginID              NATIONAL VARCHAR(10)    NOT NULL,
    OrganizationNode     CHAR(10)                NOT NULL,
    OrganizationLevel    SMALLINT                NOT NULL,
    JobTitle             NATIONAL VARCHAR(10)    NOT NULL,
    MaritalStatus        NATIONAL CHAR(10)       NOT NULL,
    Gender               NATIONAL CHAR(10)       NOT NULL,
    CurrentFlag          BIT(1)                  NOT NULL,
    PRIMARY KEY (SK_EmployeeID)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_EmployeePay 
--

CREATE TABLE Dim_EmployeePay(
    SK_EmployeePayTable    INT               NOT NULL,
    RateChangeDate         DATE              NOT NULL,
    Rate                   DECIMAL(10, 0)    NOT NULL,
    PayFrequency           TINYINT           NOT NULL,
    SK_EmployeeID          CHAR(10),
    PRIMARY KEY (SK_EmployeePayTable)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_Geography 
--

CREATE TABLE Dim_Geography(
    GeographyID    INT         NOT NULL,
    Address        CHAR(10)    NOT NULL,
    PostalCode     INT         NOT NULL,
    Country        CHAR(10)    NOT NULL,
    State          CHAR(10)    NOT NULL,
    City           CHAR(10)    NOT NULL,
    PRIMARY KEY (GeographyID)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_Product 
--

CREATE TABLE Dim_Product(
    SK_ProductID              INT                     NOT NULL,
    Created_Date              DATETIME                NOT NULL,
    Modified_Date             DATETIME                NOT NULL,
    RowGuid                   BINARY(16)              NOT NULL,
    Weight                    INT                     NOT NULL,
    ProductSize               NATIONAL VARCHAR(10)    NOT NULL,
    ProductNumber             NATIONAL VARCHAR(10)    NOT NULL,
    Name                      NATIONAL VARCHAR(10)    NOT NULL,
    ProductCategoryName       NATIONAL VARCHAR(10)    NOT NULL,
    ProductSubCategoryName    NATIONAL VARCHAR(10)    NOT NULL,
    ProductModelName          NATIONAL VARCHAR(10)    NOT NULL,
    MakeFlag                  BINARY(10)              NOT NULL,
    FinishedGoodFlag          BINARY(10)              NOT NULL,
    DaysToManufacture         NATIONAL VARCHAR(10)    NOT NULL,
    ReOrderPoint              NATIONAL VARCHAR(10)    NOT NULL,
    Productline               NATIONAL VARCHAR(10)    NOT NULL,
    Class                     NATIONAL VARCHAR(10)    NOT NULL,
    Style                     NATIONAL VARCHAR(10)    NOT NULL,
    SellStartDate             NATIONAL VARCHAR(10)    NOT NULL,
    SellEndDate               NATIONAL VARCHAR(10)    NOT NULL,
    DiscontinuedDate          NATIONAL VARCHAR(10)    NOT NULL,
    CatalogDescription        NATIONAL VARCHAR(10)    NOT NULL,
    UniPrice                  DECIMAL(10, 0)          NOT NULL,
    DI_Job_ID                 NATIONAL VARCHAR(10)    NOT NULL,
    SOR_SK                    NATIONAL VARCHAR(10)    NOT NULL,
    Color                     NATIONAL VARCHAR(10)    NOT NULL,
    PK_ProductID              INT                     NOT NULL,
    SK_ShipMethodID           INT,
    PRIMARY KEY (SK_ProductID)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_ProductInventory 
--

CREATE TABLE Dim_ProductInventory(
    LocationID      INT                     NOT NULL,
    Quantity        SMALLINT                NOT NULL,
    Shelf           NATIONAL VARCHAR(10)    NOT NULL,
    Bin             TINYINT                 NOT NULL,
    RowGuid         BINARY(16)              NOT NULL,
    ModifiedDate    DATE                    NOT NULL,
    GeographyID     INT,
    SK_ProductID    INT                     NOT NULL
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_ProductStandardCost 
--

CREATE TABLE Dim_ProductStandardCost(
    CurrentIndicator    BINARY(10)        NOT NULL,
    CostPrice           DECIMAL(10, 0)    NOT NULL,
    EffectiveDate       DATETIME          NOT NULL,
    IneffectiveDate     DATETIME          NOT NULL
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_ProductVendor 
--

CREATE TABLE Dim_ProductVendor(
    ProductVendorID        INT               NOT NULL,
    AverageLoadTime        INT               NOT NULL,
    StandardPrice          DECIMAL(10, 0)    NOT NULL,
    MinOrderQuantity       INT               NOT NULL,
    MaxOrderQuantity       INT               NOT NULL,
    ActualOrderQuantity    INT               NOT NULL,
    PRIMARY KEY (ProductVendorID)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_SalesTerritory 
--

CREATE TABLE Dim_SalesTerritory(
    SK_SalesTerritoryID    INT                     NOT NULL,
    RowGuid                BINARY(16)              NOT NULL,
    CostLastYear           DECIMAL(10, 0)          NOT NULL,
    CostYTD                DECIMAL(10, 0)          NOT NULL,
    SalesYTD               DECIMAL(10, 0)          NOT NULL,
    SalesLastYear          DECIMAL(10, 0)          NOT NULL,
    Name                   NATIONAL VARCHAR(10)    NOT NULL,
    Territory_Group        NATIONAL VARCHAR(10)    NOT NULL,
    GeographyID            INT                     NOT NULL,
    PRIMARY KEY (SK_SalesTerritoryID)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_ShipMethod 
--

CREATE TABLE Dim_ShipMethod(
    SK_ShipMethodID    INT                     NOT NULL,
    rowguid            BINARY(16)              NOT NULL,
    ShipRate           DECIMAL(10, 0)          NOT NULL,
    ShipBase           DECIMAL(10, 0)          NOT NULL,
    Name               NATIONAL VARCHAR(10)    NOT NULL,
    PRIMARY KEY (SK_ShipMethodID)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_Vendor 
--

CREATE TABLE Dim_Vendor(
    SK_VendorID              INT                     NOT NULL,
    PreferredVendorStatus    BINARY(10)              NOT NULL,
    ActiveFlag               BINARY(10)              NOT NULL,
    AccountNumber            NATIONAL VARCHAR(10)    NOT NULL,
    Name                     NATIONAL VARCHAR(10)    NOT NULL,
    CreditRating             TINYINT                 NOT NULL,
    ProductURL               CHAR(10)                NOT NULL,
    GeographyID              INT,
    PRIMARY KEY (SK_VendorID)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimProductListPrice 
--

CREATE TABLE DimProductListPrice(
    SK_ProductListPriceStartDate    DATETIME          NOT NULL,
    Current_Indicator               BINARY(10)        NOT NULL,
    ListPrice                       DECIMAL(10, 0)    NOT NULL,
    SK_ProductID                    INT               NOT NULL,
    PRIMARY KEY (SK_ProductListPriceStartDate)
)ENGINE=MYISAM
;



-- 
-- TABLE: Fact_OrderDetail 
--

CREATE TABLE Fact_OrderDetail(
    ProductOrderDetailID    INT               NOT NULL,
    UnitPrice               CHAR(10)          NOT NULL,
    LineTotal               DECIMAL(10, 0)    NOT NULL,
    RejectedQty             DECIMAL(10, 0)    NOT NULL,
    RecievedQty             DECIMAL(10, 0)    NOT NULL,
    StockedQty              DECIMAL(10, 0)    NOT NULL,
    OrderQty                SMALLINT          NOT NULL,
    SK_Date                 DATETIME          NOT NULL,
    PRIMARY KEY (ProductOrderDetailID)
)ENGINE=MYISAM
;



-- 
-- TABLE: FactPurchaseOrderHeader 
--

CREATE TABLE FactPurchaseOrderHeader(
    PurchaseOrderID    INT                     NOT NULL,
    OrderQty           NATIONAL VARCHAR(10)    NOT NULL,
    LineTotal          DECIMAL(18, 0)          NOT NULL,
    RecievedQty        NATIONAL VARCHAR(10)    NOT NULL,
    StockedQty         NATIONAL VARCHAR(10)    NOT NULL,
    DI_JobID           NATIONAL VARCHAR(10)    NOT NULL,
    Created_Date       DATETIME                NOT NULL,
    Modified_Date      DATETIME                NOT NULL,
    RevisionNumber     TINYINT                 NOT NULL,
    SubTotal           DECIMAL(10, 0)          NOT NULL,
    TaxAmt             DECIMAL(10, 0)          NOT NULL,
    TotalDue           DECIMAL(10, 0)          NOT NULL,
    Frieght            DECIMAL(10, 0)          NOT NULL,
    Status             TINYINT                 NOT NULL,
    SK_EmployeeID      CHAR(10),
    GeographyID        INT,
    ProductVendorID    INT,
    SK_VendorID        INT,
    SK_ShipMethodID    INT,
    SK_Date            DATETIME                NOT NULL,
    o                  DATETIME                NOT NULL,
    PRIMARY KEY (PurchaseOrderID)
)ENGINE=MYISAM
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


