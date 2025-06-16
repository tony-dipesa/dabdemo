use DataAPIBuilderDemo
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="07/24/2024" bug="" email="Tony DiPesa">Developed by Wellesley College.</log>
    <log revision="1.1" date="07/25/2024" bug="" email="Tony DiPesa">Added code to drop and recreate fk_Artist.</log>
    <log revision="1.2" date="07/31/2024" bug="" email="Tony DiPesa">Modified code to disable / enable foreign key constraint. Added several artists.</log>
    <log revision="1.3" date="08/01/2024" bug="" email="Tony DiPesa">Added around 20 more artists.</log>
    <log revision="1.3" date="08/02/2024" bug="" email="Tony DiPesa">Added Paul McCartney, David Bowie and AC/DC.</log>
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
        object_id = object_id(N'dab.PrePopulateArtists') and
        type in (N'P', N'PC'))
begin
    drop procedure dab.PrePopulateArtists
end
go

create procedure dab.PrePopulateArtists
--<parameters>
as
declare
	@procedure_name varchar(200) = 'dab.PrePopulateArtists',
	@current_date datetime = getdate();

begin

	begin try
		alter table dab.Concert
		nocheck constraint fk_Artist;
	end try
	begin catch
	end catch

	exec dab.InsertArtist 1, 'The Who', 'The Who', 2;
	exec dab.InsertArtist 2, 'The Rolling Stones', 'The Stones', 2;
	exec dab.InsertArtist 3, 'Queen', 'Queen', 2;
	exec dab.InsertArtist 4, 'Billy Squier', 'Billy Squier', 2;
	exec dab.InsertArtist 5, 'Peter Gabriel', 'Gabriel', 12;
	exec dab.InsertArtist 6, 'Green Day', 'Green Day', 4;
	exec dab.InsertArtist 7, 'Depeche Mode', 'Depeche Mode', 3;
	exec dab.InsertArtist 8, 'The Ramones', 'Ramones', 4;
	exec dab.InsertArtist 9, 'The Thompson Twins', 'Thompson Twins', 3;
	exec dab.InsertArtist 10, 'The B-52s', 'B-52s', 3;
	exec dab.InsertArtist 11, 'The Red Hot Chili Peppers', 'Chili Peppers', 3;
	exec dab.InsertArtist 12, 'New Order', 'New Order', 3;
	exec dab.InsertArtist 13, 'Public Image Limited', 'PIL', 3;
	exec dab.InsertArtist 14, 'The Tom Tom Club', 'Tom Tom Club', 3;
	exec dab.InsertArtist 15, 'Adam Ant', 'Adam Ant', 3;
	exec dab.InsertArtist 16, 'Jimmy Buffet', 'Buffet', 13;
	exec dab.InsertArtist 17, 'The Weeknd', 'The Weeknd', 1;
	exec dab.InsertArtist 18, 'Willie Nelson', 'Willie Nelson', 8;
	exec dab.InsertArtist 19, 'Cracker', 'Cracker', 3;
	exec dab.InsertArtist 20, 'Squeeze', 'Squeeze', 3;
	exec dab.InsertArtist 21, 'Boy George', 'Boy George', 1;
	exec dab.InsertArtist 22, 'The Psychedelic Furs', 'Psych Furs', 3;
	exec dab.InsertArtist 23, 'The Jesus and Mary Chain', 'Jesus and Mary Chain', 3;
	exec dab.InsertArtist 24, 'Deborah Harry', 'Debbie Harry', 3;
	exec dab.InsertArtist 25, 'Jerry Harrison', 'Jerry Harrison', 3;
	exec dab.InsertArtist 26, 'The Sugarcubes', 'The Sugarcubes', 3;
	exec dab.InsertArtist 27, 'The Pet Shop Boys', 'Pet Shop Boys', 3;
	exec dab.InsertArtist 28, 'Orchestral Manoeuvres in the Dark', 'OMD', 3;
	exec dab.InsertArtist 29, 'Paul McCartney', 'Sir Paul', 1;
	exec dab.InsertArtist 30, 'David Bowie', 'Bowie', 12;
	exec dab.InsertArtist 31, 'AC/DC', 'AC/DC', 5;

	begin try
		alter table dab.Concert
		check constraint fk_Artist;
		-- foreign key (ArtistId) references dab.Artist(ArtistId);  -- TPD 07/31/2024.
	end try
	begin catch
	end catch

end;
go
