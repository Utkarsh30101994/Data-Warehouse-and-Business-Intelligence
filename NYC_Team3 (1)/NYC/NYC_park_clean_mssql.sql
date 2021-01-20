/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      NYCDimModel.DM1
 *
 * Date Created : Thursday, October 01, 2020 12:14:41
 * Target DBMS : Microsoft SQL Server 2017
 */

/* 
 * TABLE: Dim_ActivityTask 
 */

CREATE TABLE Dim_ActivityTask(
    ActivityTaskID    int             NOT NULL,
    animal_waste      nvarchar(10)    NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (ActivityTaskID)
)
go



IF OBJECT_ID('Dim_ActivityTask') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_ActivityTask >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_ActivityTask >>>'
go

/* 
 * TABLE: Dim_Date 
 */

CREATE TABLE Dim_Date(
    SK_Date             datetime    NOT NULL,
    PK_Date             int         NOT NULL,
    DayNumberOfWeek     int         NOT NULL,
    DayNumberOfMonth    int         NOT NULL,
    DayNumberOfYear     int         NOT NULL,
    WeekNumberOfYear    int         NOT NULL,
    MonthName           int         NOT NULL,
    MonthNumber         int         NOT NULL,
    CalenderYear        int         NOT NULL,
    CreateDate          date        NOT NULL,
    ModifiedDate        date        NOT NULL,
    CalenderQuarter     int         NOT NULL,
    FiscalYear          int         NOT NULL,
    FiscalQurater       int         NOT NULL,
    CONSTRAINT PK1_1 PRIMARY KEY NONCLUSTERED (SK_Date)
)
go



IF OBJECT_ID('Dim_Date') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Date >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Date >>>'
go

/* 
 * TABLE: Dim_Route 
 */

CREATE TABLE Dim_Route(
    RouteID          int           NOT NULL,
    off_route        binary(10)    NOT NULL,
    VehicleNumber    int           NOT NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (RouteID)
)
go



IF OBJECT_ID('Dim_Route') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Route >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Route >>>'
go

/* 
 * TABLE: Dim_Sector 
 */

CREATE TABLE Dim_Sector(
    SectorID         int             NOT NULL,
    gispropnum_SK    nvarchar(10)    NOT NULL,
    omppropid_SK     nvarchar(10)    NOT NULL,
    SectorName       nvarchar(10)    NOT NULL,
    description      nvarchar(10)    NOT NULL,
    district         nvarchar(10)    NOT NULL,
    sector_desc      int             NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (SectorID)
)
go



IF OBJECT_ID('Dim_Sector') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Sector >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Sector >>>'
go

/* 
 * TABLE: Fact_Cleaning 
 */

CREATE TABLE Fact_Cleaning(
    DailyTaskID       int           NOT NULL,
    RowID             int           NOT NULL,
    animal_waste      binary(18)    NOT NULL,
    dumping           binary(10)    NOT NULL,
    graffiti          binary(10)    NOT NULL,
    medical_waste     binary(10)    NOT NULL,
    broken_glass      binary(10)    NOT NULL,
    napsw             int           NOT NULL,
    ncpw              int           NOT NULL,
    ncsa              int           NOT NULL,
    npop              int           NOT NULL,
    nnpw              int           NOT NULL,
    ncrew             int           NOT NULL,
    SK_Date           datetime      NOT NULL,
    RouteID           int           NOT NULL,
    SectorID          int           NOT NULL,
    ActivityTaskID    int           NOT NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (DailyTaskID, RowID)
)
go



IF OBJECT_ID('Fact_Cleaning') IS NOT NULL
    PRINT '<<< CREATED TABLE Fact_Cleaning >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Fact_Cleaning >>>'
go

/* 
 * TABLE: Fact_Cleaning 
 */

ALTER TABLE Fact_Cleaning ADD CONSTRAINT RefDim_Route3 
    FOREIGN KEY (RouteID)
    REFERENCES Dim_Route(RouteID)
go

ALTER TABLE Fact_Cleaning ADD CONSTRAINT RefDim_Sector4 
    FOREIGN KEY (SectorID)
    REFERENCES Dim_Sector(SectorID)
go

ALTER TABLE Fact_Cleaning ADD CONSTRAINT RefDim_ActivityTask5 
    FOREIGN KEY (ActivityTaskID)
    REFERENCES Dim_ActivityTask(ActivityTaskID)
go

ALTER TABLE Fact_Cleaning ADD CONSTRAINT RefDim_Date1 
    FOREIGN KEY (SK_Date)
    REFERENCES Dim_Date(SK_Date)
go


