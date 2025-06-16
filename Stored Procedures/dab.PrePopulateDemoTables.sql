use DataAPIBuilderDemo
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="07/25/2024" bug="" email="Tony DiPesa">Developed by Wellesley College.</log>
    <log revision="1.1" date="08/01/2024" bug="" email="Tony DiPesa">Added code to delete from dab.Concert before inserting concerts.</log>
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
        object_id = object_id(N'dab.PrePopulateDemoTables') and
        type in (N'P', N'PC'))
begin
    drop procedure dab.PrePopulateDemoTables
end
go

create procedure dab.PrePopulateDemoTables
--<parameters>
as
declare
	@procedure_name varchar(200) = 'dab.PrePopulateDemoTables',
	@current_date datetime = getdate();

begin

	exec dab.PrePopulateGenres;
	exec dab.PrePopulateArtists;
	exec dab.PrePopulateTours;
	exec dab.PrePopulateVenues;

	delete from dab.Concert;  -- TPD 08/01/2024.
	exec dab.PrePopulateConcerts;

end;

go

