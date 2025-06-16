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
        object_id = object_id(N'dab.CreateArtist') and
        type in (N'P', N'PC'))
begin
    drop procedure dab.CreateArtist
end
go

create procedure dab.CreateArtist
--<parameters>
as

exec sp_executesql N'drop table if exists dab.Artist';

create table dab.Artist(
	ArtistId					int identity not null primary key,
	Name						varchar(200) not null,
	ShortName					varchar(80) null,
	GenreId						int not null,
	InsertedDate				datetime not null default getdate(),
	InsertedBy					varchar(200) not null default 'dab.CreateArtist',
	UpdatedDate					datetime not null default getdate(),
	UpdatedBy					varchar(200) not null default 'dab.CreateArtist',
	);
go

exec sp_executesql N'create unique index Artist_u1 on dab.Artist(Name)';

exec sp_executesql N'create unique index Artist_u2 on dab.Artist(ShortName)';

go
