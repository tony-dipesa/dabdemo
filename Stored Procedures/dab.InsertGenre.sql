use DataAPIBuilderDemo
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="07/24/2024" bug="" email="Tony DiPesa">Developed by Wellesley College.</log>
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
        object_id = object_id(N'dab.InsertGenre') and
        type in (N'P', N'PC'))
begin
    drop procedure dab.InsertGenre
end
go

create procedure dab.InsertGenre
--<parameters>
	@genre_id				int,
	@genre_name				varchar(80)
as
declare
	@procedure_name varchar(200) = 'dab.InsertGenre',
	@current_date datetime = getdate();

begin

	set identity_insert dab.Genre on;

	delete
	from dab.Genre
	where GenreId = @genre_id;

	insert into dab.Genre(	GenreId,
							Name,
							InsertedDate,
							InsertedBy,
							UpdatedDate,
							UpdatedBy)
	values
						(	@genre_id,
							@genre_name,
							@current_date,
							@procedure_name,
							@current_date,
							@procedure_name);
		
	set identity_insert dab.Genre off;

end;
go
