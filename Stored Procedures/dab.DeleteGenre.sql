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
        object_id = object_id(N'dab.DeleteGenre') and
        type in (N'P', N'PC'))
begin
    drop procedure dab.DeleteGenre
end
go

create procedure dab.DeleteGenre
--<parameters>
	@genre_name				varchar(80)
as
declare
	@procedure_name varchar(200) = 'dab.DeleteGenre',
	@current_date datetime = getdate();

begin

	delete
	from dab.Genre
	where Name = @genre_name;

end;
go
