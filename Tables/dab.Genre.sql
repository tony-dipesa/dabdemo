use DataAPIBuilderDemo
go

/******************************************************************************
<historylog>
    <log revision="1.0" date="07/24/2024" bug="" email="Tony DiPesa">Developed by Wellesley College.</log>
    <log revision="1.1" date="07/25/2024" bug="" email="Tony DiPesa">Added code to drop and recreate fk_Genre.</log>
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
        object_id = object_id(N'dab.Genre') and
        type in (N'U'))
begin

	begin try
		alter table dab.Artist
		drop constraint fk_Genre;
	end try
	begin catch
	end catch

    drop table dab.Genre;
end
go

create table dab.Genre(
	GenreId						int identity not null primary key,
	Name						varchar(80) not null,
	InsertedDate				datetime not null default getdate(),
	InsertedBy					varchar(200) not null default 'dab.InsertGenre',
	UpdatedDate					datetime not null default getdate(),
	UpdatedBy					varchar(200) not null default 'dab.InsertGenre',
	);
go

create unique index Genre_u1
on dab.Genre(Name);

begin

	begin try
		alter table dab.Artist
		add constraint fk_Genre
		foreign key (GenreId) references dab.Genre(GenreId);
	end try
	begin catch
	end catch

end;

go

go

