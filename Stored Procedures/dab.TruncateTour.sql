use DataAPIBuilderDemo
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="07/31/2024" bug="" email="Tony DiPesa">Developed by Wellesley College.</log>
</historylog>
******************************************************************************/

/******************************************************************************
	Create the procedure in the dab schema
******************************************************************************/

if  exists (
    select *
    from
        sys.objects
    where
        object_id = object_id(N'dab.TruncateTour') and
        type in (N'P', N'PC'))
begin
    drop procedure dab.TruncateTour
end
go

create procedure dab.TruncateTour
--<parameters>
as
declare
	@procedure_name varchar(200) = 'dab.TruncateTour',
	@current_date datetime = getdate();

begin

	truncate table dab.Tour;

end;

go

