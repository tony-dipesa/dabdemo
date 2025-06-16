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
        object_id = object_id(N'dab.TruncateArtist') and
        type in (N'P', N'PC'))
begin
    drop procedure dab.TruncateArtist
end
go

create procedure dab.TruncateArtist
--<parameters>
as
declare
	@procedure_name varchar(200) = 'dab.TruncateArtist',
	@current_date datetime = getdate();

begin

	truncate table dab.Artist;

end;

go

