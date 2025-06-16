use DataAPIBuilderDemo
go

/******************************************************************************
<historylog>
    <log revision="1.0" date="07/25/2024" bug="" email="Tony DiPesa">Developed by Wellesley College.</log>
    <log revision="1.1" date="08/02/2024" bug="" email="Tony DiPesa">Changed data type of StarRating to int. Made ConcertDate nullable.</log>
</historylog>
******************************************************************************/

/******************************************************************************
	Create the table in the dab schema
******************************************************************************/

if  exists (
    select *
    from
        sys.objects
    where
        object_id = object_id(N'dab.Concert') and
        type in (N'U'))
begin
    drop table dab.Concert
end
go

create table dab.Concert(
	ConcertId					int identity not null primary key,
	ArtistId					int not null,
	VenueId						int not null,
	ConcertDate					datetime null,  -- TPD 08/02/2024.
	TourId						int null,
	StarRating					int null,
	Notes						varchar(4000) null,
	InsertedDate				datetime not null default getdate(),
	InsertedBy					varchar(200) not null default 'dab.InsertConcert',
	UpdatedDate					datetime not null default getdate(),
	UpdatedBy					varchar(200) not null default 'dab.InsertConcert',
	);
go

alter table dab.Concert
add constraint fk_Artist
foreign key (ArtistId) references dab.Artist(ArtistId);

alter table dab.Concert
add constraint fk_Venue
foreign key (VenueId) references dab.Venue(VenueId);

alter table dab.Concert
add constraint fk_Tour
foreign key (TourId) references dab.Tour(TourId);

go

