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
        object_id = object_id(N'dab.InsertArtist') and
        type in (N'P', N'PC'))
begin
    drop procedure dab.InsertArtist
end
go

create procedure dab.InsertArtist
--<parameters>
	@artist_id					int,
	@artist_name				varchar(200),
	@artist_short_name			varchar(80),
	@genre_id					int
as
declare
	@procedure_name varchar(200) = 'dab.InsertArtist',
	@current_date datetime = getdate();

begin

	set identity_insert dab.Artist on;

	delete
	from dab.Artist
	where ArtistId = @artist_id;

	insert into dab.Artist(	ArtistId,
							Name,
							ShortName,
							GenreId,
							InsertedDate,
							InsertedBy,
							UpdatedDate,
							UpdatedBy)
	values
						(	@artist_id,
							@artist_name,
							@artist_short_name,
							@genre_id,
							@current_date,
							@procedure_name,
							@current_date,
							@procedure_name);
		
	set identity_insert dab.Artist off;

end;
go
