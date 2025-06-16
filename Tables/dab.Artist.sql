use DataAPIBuilderDemo
go

/******************************************************************************
<historylog>
    <log revision="1.0" date="07/24/2024" bug="" email="Tony DiPesa">Developed by Wellesley College.</log>
    <log revision="1.1" date="07/25/2024" bug="" email="Tony DiPesa">Added code to drop and recreate fk_Artist.</log>
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
        object_id = object_id(N'dab.Artist') and
        type in (N'U'))
begin

	begin try
		alter table dab.Concert
		drop constraint fk_Artist;
	end try
	begin catch
	end catch

    drop table dab.Artist;

end
go

create table dab.Artist(
	ArtistId					int identity not null primary key,
	Name						varchar(200) not null,
	ShortName					varchar(80) null,
	GenreId						int not null,
	InsertedDate				datetime not null default getdate(),
	InsertedBy					varchar(200) not null default 'dab.InsertArtist',
	UpdatedDate					datetime not null default getdate(),
	UpdatedBy					varchar(200) not null default 'dab.InsertArtist',
	);
go

create unique index Artist_u1
on dab.Artist(Name);

create unique index Artist_u2
on dab.Artist(ShortName);

alter table dab.Artist
add constraint fk_Genre
foreign key (GenreId) references dab.Genre(GenreId);

go

begin

	begin try
		alter table dab.Concert
		add constraint fk_Artist
		foreign key (ArtistId) references dab.Artist(ArtistId);
	end try
	begin catch
	end catch

end;
