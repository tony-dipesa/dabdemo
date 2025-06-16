use DataAPIBuilderDemo
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="08/01/2024" bug="" email="Tony DiPesa">Developed by Wellesley College.</log>
    <log revision="1.1" date="08/02/2024" bug="" email="Tony DiPesa">Changed data type of @star_rating to int. Changed @show_date data type to varchar(20) to allow for GraphQL schema introspection. Modified to insert @show_date_time after converting via tryconvert.</log>
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
        object_id = object_id(N'dab.InsertShow') and
        type in (N'P', N'PC'))
begin
    drop procedure dab.InsertShow
end
go

create procedure dab.InsertShow
--<parameters>
	@artist					varchar(80),
	@venue					varchar(80),
	@show_date				varchar(20),
	@tour					varchar(80) = null,
	@star_rating			int = null,
	@notes					varchar(4000) = null
as
declare
	@procedure_name		varchar(200) = 'dab.InsertShow',
	@current_date		datetime = getdate(),
	@artist_id			int,
	@venue_id			int,
	@tour_id			int,
	@show_date_time		datetime

begin

	set @artist_id = (select ArtistId from dab.Artist where Artist.Name = @artist
					  union
					  select ArtistId from dab.Artist where Artist.ShortName = @artist);
	set @venue_id = (select VenueId from dab.Venue where Venue.Name = @venue);
	set @tour_id = (select TourId from dab.Tour where Tour.Name = @tour);

	set @show_date_time = try_convert(datetime, @show_date, 121)  -- TPD 08/02/2024.

	insert into dab.Concert(ArtistId,
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
						(	@artist_id,
							@venue_id,
							@show_date_time,  -- TPD 08/02/2024.
							@tour_id,
							@star_rating,
							@notes,
							@current_date,
							@procedure_name,
							@current_date,
							@procedure_name);
		
end;
go
