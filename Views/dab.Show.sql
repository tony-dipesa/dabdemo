use DataAPIBuilderDemo
go

/******************************************************************************
<historylog>
    <log revision="1.0" date="07/26/2024" bug="" email="Tony DiPesa">Developed by Wellesley College.</log>
    <log revision="1.1" date="08/01/2024" bug="" email="Tony DiPesa">Added Genre.</log>
    <log revision="1.2" date="10/18/2024" bug="" email="Tony DiPesa">Added Tour.</log>
</historylog>
******************************************************************************/

if not exists (
    select *
    from
        sys.views
    where
        object_id = object_id(N'dab.Show'))
begin
    exec('create view dab.Show as select 1 as ''stub''')
end
go

alter view dab.Show
as
select	Concert.ConcertId as ShowId,
		Artist.Name as Artist,
		Genre.Name as Genre,  -- TPD 08/01/2024.
		Venue.Name as Venue,
		Tour.Name as Tour,  -- TPD 10/18/2024.
		Concert.ConcertDate as [Date],
		Concert.StarRating as StarRating,
		replicate('*', Concert.StarRating) as Stars,
		Concert.Notes as Notes
from dab.Concert
inner join dab.Artist
	on Concert.ArtistId = Artist.ArtistId
inner join dab.Venue
	on Concert.VenueId = Venue.VenueId
left join dab.Tour
	on Concert.TourId = Tour.TourId
left join dab.Genre  -- TPD 08/01/2024.
	on Artist.GenreId = Genre.GenreId
;
go

--exec HEA.CopyExtendedProperty @FromLevel0Name = 'ResourcesFinal', @FromLevel1Name = 'ConstituentOtherAttribute', @ToLevel0Name = 'ResourcesFinal', @ToLevel1Name = 'ConstituentOtherAttribute'
-- exec HEA.UpdateExtendedProperty @Value = 'Reporting View for potential future use in Course Browser', @Level0Object = 'ResourcesFinal', @Level1Object = 'ConstituentOtherAttribute'
-- go
