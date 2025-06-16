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
        object_id = object_id(N'dab.CreateForeignKeys') and
        type in (N'P', N'PC'))
begin
    drop procedure dab.CreateForeignKeys
end
go

create procedure dab.CreateForeignKeys
--<parameters>
as

begin

alter table dab.Artist
add constraint fk_Genre
foreign key (GenreId) references dab.Genre(GenreId);

alter table dab.Concert
add constraint fk_Artist
foreign key (ArtistId) references dab.Artist(ArtistId);

end;
