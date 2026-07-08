--Table Structure
select * from [dbo].[QuotationMst];
select * from [dbo].[QuotationItemDetails];
select * from [dbo].[QuotationLineItemTaxDetails];

/*
# Question 1 (JOIN + Aggregate)
Display the following for every quotation:
* QuotVisibleNo
* Customer ID
* Number of Items
* Total Quantity
* Total Item Amount
* Total Tax Amount
*/
Select 
    qm.QuotVisibleNO,
	qm.CustID,
	count(distinct qid.ItemID) as NumberOfItems,
	sum(qid.Quantity) as TotalQuantity,
	sum(qid.Amount) as TotalItemAmount,
	coalesce(qlt.TotalTaxAmount, 0) as TotalTaxAmount
From dbo.QuotationMst qm
Left join dbo.QuotationItemDetails qid
	on qm.QuotID = qid.QuotID
Left join (
   select 
    QuotItemDetID,
    sum(TaxAmount) as TotalTaxAmount
   from dbo.QuotationLineItemTaxDetails
   Group by QuotItemDetID
) qlt 
    on qid.QuotItemDetID = qlt.QuotItemDetID
Group by
    qm.QuotID,
	qm.CustID,
    qm.QuotVisibleNo,
	qlt.TotalTaxAmount;

--OR Method 2 (Directly summing TaxTotal from line items if populated)
--Select 
--    qm.QuotVisibleNo,
--    qm.CustID,
--    count(distinct qid.ItemID) as NumberOfItems,
--    sum(qid.Quantity) as TotalQuantity,
--    sum(qid.Amount) as TotalItemAmount,
--    coalesce(sum(qid.TaxTotal), 0) as TotalTaxAmount
--From dbo.QuotationMst qm
--Left join dbo.QuotationItemDetails qid 
--    on qm.QuotID = qid.QuotID
--Group by 
--    qm.QuotID, 
--    qm.QuotVisibleNo, 
--    qm.CustID;


/*
# Question 2 (GROUP BY + HAVING)
Find quotations whose total quantity exceeds 100.
*/
Select 
    qm.QuotID,
    qm.QuotVisibleNo,
    sum(qid.Quantity) as TotalQuantity
From dbo.QuotationMst qm
Inner join dbo.QuotationItemDetails qid 
    on qm.QuotID = qid.QuotID
Group by 
    qm.QuotID, 
    qm.QuotVisibleNo
Having sum(qid.Quantity) > 100;


/*
# Question 3 (Window Function)
Display every item along with its ranking based on highest Rate within each quotation.
*/
Select 
    QuotID,
    SrNo,
    ItemCode,
    ItemID,
    Rate,
    dense_rank() over (partition by QuotID order by Rate desc) as HighestRateRanking
From dbo.QuotationItemDetails;


/*
# Question 4 (ROW_NUMBER)
Find the highest priced item from every quotation.
*/
With HighestPricedItem as(
    Select
        QuotID,
        SrNo,
        ItemCode,
        ItemID,
        Rate,
        ROW_NUMBER() over (partition by QuotID order by Rate desc, Amount desc) as RowNum
    from dbo.QuotationItemDetails
)
Select
    QuotID,
    SrNo,
    ItemCode,
    ItemID,
    Rate
From HighestPricedItem
Where RowNum = 1;


/*
# Question 5 (Running Total)
Show cumulative Amount for items within each quotation ordered by SrNo.
*/
Select 
    QuotID,
    ItemID,
    SrNo,
    Amount,
    sum(Amount) over (
        partition by QuotID 
        order by SrNo
    ) as CumulativeAmount
from dbo.QuotationItemDetails
order by QuotID, SrNo;


/*
# Question 6 (CTE)
Find quotations whose total item amount is greater than the average quotation amount.
*/
With QuotationTotal as (
    select
        QuotID,
        sum(Amount) as TotalAmount
    From dbo.QuotationItemDetails
    Group by QuotID
),
GreaterAvg as (
    select
        avg(TotalAmount) as GreaterAvg
    from QuotationTotal
)
Select
    qt.QuotID,
    qt.TotalAmount,
    ga.GreaterAvg
from QuotationTotal qt
cross join GreaterAvg ga
where qt.TotalAmount > ga.GreaterAvg;


/*
# Question 7 (Subquery)
Find quotations having more items than the average number of items per quotation.
*/
Select 
    QuotID,
    count(*) as ItemCount
From dbo.QuotationItemDetails
Group by QuotID
Having count(*) > (
    Select avg(ItemCount * 1.0) 
    From (
        Select count(*) as ItemCount 
        From dbo.QuotationItemDetails
        Group by QuotID
    ) as Sub
);


/*
# Question 8 (Complex JOIN)
Display Quotation Number, Item ID, Rate, Tax Amount Total Tax Applied on that Item
*/
Select
    qm.QuotVisibleNo,
    qid.ItemCode,
    qid.Rate,
    sum(qlt.TaxAmount) as TotalTaxAmount
from dbo.QuotationMst qm
Inner Join dbo.QuotationItemDetails qid
    on qm.QuotID = qid.QuotID
Left Join dbo.QuotationLineItemTaxDetails qlt
    ON qid.QuotItemDetID = qlt.QuotItemDetID
Group by 
    qm.QuotVisibleNo,
    qid.ItemCode,
    qid.Rate;


/*
# Question 9 (Stored Procedure)
Create a procedure that returns quotation details by QuotID.
*/
GO
create procedure sp_QuotationDetails
    @QuotID int
As
BEGIN
    Select * 
    from dbo.QuotationItemDetails
    where QuotID = @QuotID;
END;
GO

exec sp_QuotationDetails 44108;


/*
# Question 10 (Temp Table)
Store all quotations having TotalAmt greater than ₹1,00,000 in a temp table.
*/
Select
    QuotId,
    QuotVisibleNo,
    CustID,
    QuotDate,
    OrderBy,
    Subtotal,
    SubTotalWithDiscount,
    TotalAmt
Into #GreaterQuotations
From dbo.QuotationMst
Where TotalAmt > 100000;

Select * from #GreaterQuotations;
drop table if exists #GreaterQuotations;


/*
# Question 11 (Table Variable)
Rewrite Question 10 using a table variable.
*/
DECLARE @GreaterQuotation table (
    QuotId int,
    QuotVisibleNo varchar(50),
    CustID int,
    OrderBy varchar(50),
    Subtotal decimal(15,5),
    SubTotalWithDiscount decimal(15,5),
    TotalAmt decimal(15,5)
);

Insert into @GreaterQuotation (QuotId, QuotVisibleNo, CustID, OrderBy, Subtotal, SubTotalWithDiscount, TotalAmt) 
Select 
    QuotId,
    QuotVisibleNo,
    CustID,
    OrderBy,
    Subtotal,
    SubTotalWithDiscount,
    TotalAmt
From dbo.QuotationMst
Where TotalAmt > 100000;

Select * from @GreaterQuotation;


/*
# Question 12 (Function)
Create a scalar function that returns total quotation amount.
*/
GO
Create function dbo.fn_TotalQuotationAmount (
    @QuotID int
)
Returns decimal(15, 5)
As
Begin
    Declare @TotalAmt Decimal(15, 5);

    Select @TotalAmt = TotalAmt
    from dbo.QuotationMst
    where @QuotID = QuotID;

    Return coalesce(@TotalAmt, 0.00);
End;
GO

Select dbo.fn_TotalQuotationAmount(48116);


/*
# Question 13 (Inline Table-Valued Function)
Return all quotation items for a given quotation.
*/
GO
CREATE FUNCTION dbo.fn_GetQuotationItems(
    @QuotID INT
)
RETURNS TABLE
AS
RETURN(
    SELECT 
        QuotItemDetID,
        QuotID,
        SrNo,
        ItemCode,
        ItemID,
        Quantity,
        Rate,
        DiscountedRate,
        Amount,
        TaxTotal,
        SubTotalWithDiscAndTax
    FROM [dbo].[QuotationItemDetails]
    WHERE QuotID = @QuotID AND Active = 1
);
GO

Select * from dbo.fn_GetQuotationItems(47140);


/*
# Question 14 (Trigger)
Create a trigger that updates Subtotal in QuotationMst whenever items are inserted.
*/
GO
Create Trigger dbo.trg_UpdateSubtotal_OnItemChange
on dbo.QuotationItemDetails
After Insert, Update, Delete
As
Begin
    Set Nocount on;

    With AffectedQuots As (
        Select QuotID From inserted
        UNION
        Select QuotID From deleted
    )
    Update qm
    Set 
        Subtotal = Coalesce(calc.NewSubtotal, 0),
        SubTotalWithDiscount = Coalesce(calc.NewSubtotal, 0) - Coalesce(qm.TotalDiscount, 0)
    From dbo.QuotationMst qm
    Inner Join AffectedQuots aq on qm.QuotID = aq.QuotID
    Outer Apply (
        Select Sum(Amount) as NewSubtotal
        From dbo.QuotationItemDetails qi
        Where qi.QuotID = qm.QuotID AND qi.Active = 1
    ) calc;
End;
GO

SELECT QuotID, Subtotal FROM dbo.QuotationMst WHERE QuotID = 47140;

INSERT INTO dbo.QuotationItemDetails (
    QuotID, ItemID, SrNo, Quantity, Rate, Amount, 
    ExpectedDeliveryDate, AssessableValue, BasicTotal, TaxTotal, SubTotalWithDiscAndTax, Active
)
VALUES (
    47140, 55, 1, 2, 50.00, 100.00, 
    DATEADD(day, 7, GETDATE()), 100.00, 100.00, 0.00, 100.00, 1
);

SELECT QuotID, Subtotal FROM dbo.QuotationMst WHERE QuotID = 47140;


/*
# Question 15 (Transactions + TRY...CATCH)
Write a stored procedure that inserts a quotation and its items in a single transaction. Roll back everything if any insert fails.
*/
GO
CREATE PROCEDURE dbo.usp_CreateQuotationWithItem
    @QuotVisibleNo VARCHAR(50),
    @CustID INT,
    @Subtotal DECIMAL(18, 2),
    @TotalAmt DECIMAL(18, 2),
    @ItemCode VARCHAR(50) = NULL,
    @ItemID INT,
    @SrNo INT,
    @Quantity DECIMAL(18, 2),
    @Rate DECIMAL(18, 2),
    @Currency VARCHAR(10) = 'INR',
    @CurrencyValue DECIMAL(18, 4) = 1.0000,
    @QuotDate DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON; 

    IF @QuotDate IS NULL 
        SET @QuotDate = GETDATE();

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @NewQuotID INT;

        INSERT INTO [dbo].[QuotationMst] (
            QuotVisibleNo, 
            CustID, 
            QuotDate, 
            Currency,
            CurrencyValue,
            Subtotal, 
            PercentDiscount, 
            TotalDiscount, 
            SubTotalWithDiscount, 
            LineItemTaxesTotal, 
            OverallTaxesTotal, 
            TotalAmt,
            Active,
            InsDate
        )
        VALUES (
            @QuotVisibleNo, 
            @CustID, 
            @QuotDate, 
            @Currency,
            @CurrencyValue,
            @Subtotal, 
            0.00,            
            0.00,             
            @Subtotal,       
            0.00,             
            0.00,             
            @TotalAmt,
            1,                
            GETDATE()         
        );

        SET @NewQuotID = SCOPE_IDENTITY();

        INSERT INTO [dbo].[QuotationItemDetails] (
            QuotID, 
            SrNo, 
            ItemCode,
            ItemID, 
            Quantity, 
            Rate, 
            DiscountedRate,
            Amount,
            AssessableValue,
            BasicTotal,
            TaxTotal,
            SubTotalWithDiscAndTax,
            Active
        )
        VALUES (
            @NewQuotID, 
            @SrNo, 
            @ItemCode,
            @ItemID, 
            @Quantity, 
            @Rate, 
            @Rate, 
            (@Quantity * @Rate), 
            (@Quantity * @Rate), 
            (@Quantity * @Rate), 
            0.00, 
            (@Quantity * @Rate),
            1                 
        );

        COMMIT TRANSACTION;
        
        SELECT @NewQuotID AS GeneratedQuotID;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END

        THROW;
    END CATCH;
END;
GO