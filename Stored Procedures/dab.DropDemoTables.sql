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
        object_id = object_id(N'dab.DropDemoTables') and
        type in (N'P', N'PC'))
begin
    drop procedure dab.DropDemoTables
end
go

create procedure dab.DropDemoTables
--<parameters>
as
declare
	@procedure_name varchar(200) = 'dab.DropDemoTables',
	@current_date datetime = getdate();

begin

	drop table if exists dab.Concert;
	drop table if exists dab.Artist;
	drop table if exists dab.Genre;
	drop table if exists dab.Tour;
	drop table if exists dab.Venue;


end;

go

