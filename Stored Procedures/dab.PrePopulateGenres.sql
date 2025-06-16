use DataAPIBuilderDemo
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="07/24/2024" bug="" email="Tony DiPesa">Developed by Wellesley College.</log>
    <log revision="1.1" date="07/25/2024" bug="" email="Tony DiPesa">Added code to drop and recreate fk_Genre.</log>
    <log revision="1.2" date="07/31/2024" bug="" email="Tony DiPesa">Modified code to disable / enable foreign key constraint. Added Yacht Rock genre.</log>
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
        object_id = object_id(N'dab.PrePopulateGenres') and
        type in (N'P', N'PC'))
begin
    drop procedure dab.PrePopulateGenres
end
go

create procedure dab.PrePopulateGenres
--<parameters>
as
declare
	@procedure_name varchar(200) = 'dab.PrePopulateGenres',
	@current_date datetime = getdate();

begin

	begin try
		alter table dab.Artist
		nocheck constraint fk_Genre;
	end try
	begin catch
	end catch

	exec dab.InsertGenre 1, 'Pop';
	exec dab.InsertGenre 2, 'Classic Rock';
	exec dab.InsertGenre 3, 'Alternative Rock';
	exec dab.InsertGenre 4, 'Punk Rock';
	exec dab.InsertGenre 5, 'Heavy Metal';
	exec dab.InsertGenre 6, 'Jazz';
	exec dab.InsertGenre 7, 'Hip Hop';
	exec dab.InsertGenre 8, 'Country';
	exec dab.InsertGenre 9, 'Blues';
	exec dab.InsertGenre 10, 'Electronic Dance Music';
	exec dab.InsertGenre 11, 'Classical';
	exec dab.InsertGenre 12, 'Progressive Rock';
	exec dab.InsertGenre 13, 'Yacht Rock';

	begin try
		alter table dab.Artist
		check constraint fk_Genre
		-- foreign key (GenreId) references dab.Genre(GenreId);  TPD 07/31/2024.
	end try
	begin catch
	end catch

end;
go
