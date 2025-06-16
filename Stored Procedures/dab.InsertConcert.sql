use DataAPIBuilderDemo
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="07/25/2024" bug="" email="Tony DiPesa">Developed by Wellesley College.</log>
    <log revision="1.1" date="08/02/2024" bug="" email="Tony DiPesa">Changed data type of @star_rating to int.</log>
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
        object_id = object_id(N'dab.InsertConcert') and
        type in (N'P', N'PC'))
begin
    drop procedure dab.InsertConcert
end
go

create procedure dab.InsertConcert
--<parameters>
	@concert_id				int,
	@artist_id				int,
	@venue_id				int,
	@concert_date			datetime,
	@tour_id				int = null,
	@star_rating			int = null,
	@notes					varchar(4000) = null
as
declare
	@procedure_name varchar(200) = 'dab.InsertConcert',
	@current_date datetime = getdate();

begin

	set identity_insert dab.Concert on;

	delete
	from dab.Concert
	where ConcertId = @concert_id;

	insert into dab.Concert(ConcertId,
							ArtistId,
							VenueId,
							ConcertDate,
							TourId,
							StarRating,
							Notes,
							InsertedDate,
							InsertedBy,
							UpdatedDate,
							UpdatedBy)
	values
						(	@concert_id,
							@artist_id,
							@venue_id,
							@concert_date,
							@tour_id,
							@star_rating,
							@notes,
							@current_date,
							@procedure_name,
							@current_date,
							@procedure_name);
		
	set identity_insert dab.Concert off;

end;
go
