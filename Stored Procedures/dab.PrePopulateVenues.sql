use DataAPIBuilderDemo
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="07/25/2024" bug="" email="Tony DiPesa">Developed by Wellesley College.</log>
    <log revision="1.1" date="07/31/2024" bug="" email="Tony DiPesa">Modified code to disable / enable foreign key constraint. Added Wang Theatre and Orpheum Theatre venues.</log>
    <log revision="1.2" date="08/01/2024" bug="" email="Tony DiPesa">Added Worcester Centrum / DCU Center, Shubert Theater and Wilbur Theatre.</log>
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
        object_id = object_id(N'dab.PrePopulateVenues') and
        type in (N'P', N'PC'))
begin
    drop procedure dab.PrePopulateVenues
end
go

create procedure dab.PrePopulateVenues
--<parameters>
as
declare
	@procedure_name varchar(200) = 'dab.PrePopulateVenues',
	@current_date datetime = getdate();

begin

	begin try
		alter table dab.Concert
		nocheck constraint fk_Venue;
	end try
	begin catch
	end catch

	exec dab.InsertVenue 1, 'Boston Garden', 'Boston', 'MA';
	exec dab.InsertVenue 2, 'TD Garden', 'Boston', 'MA';
	exec dab.InsertVenue 3, 'Paradise Rock Club', 'Boston', 'MA';
	exec dab.InsertVenue 4, 'Axis', 'Boston', 'MA';
	exec dab.InsertVenue 5, 'Fenway Park', 'Boston', 'MA';
	exec dab.InsertVenue 6, 'MGM Music Hall at Fenway', 'Boston', 'MA';
	exec dab.InsertVenue 7, 'Leader Bank Pavilion', 'Boston', 'MA';
	exec dab.InsertVenue 8, 'The Metro', 'Boston', 'MA';
	exec dab.InsertVenue 9, 'Xfinity Center / Great Woods', 'Mansfield', 'MA';
	exec dab.InsertVenue 10, 'House of Blues', 'Boston', 'MA';
	exec dab.InsertVenue 11, 'The Cabaret', 'San Jose', 'CA';
	exec dab.InsertVenue 12, 'E. M. Loew''s Theatre of Performing Arts', 'Worcester', 'MA';
	exec dab.InsertVenue 13, 'MIT', 'Cambridge', 'MA';
	exec dab.InsertVenue 14, 'Billy Bob''s', 'Fort Worth', 'TX';
	exec dab.InsertVenue 15, 'Sullivan Stadium', 'Foxboro', 'MA';
	exec dab.InsertVenue 16, 'Foxboro Stadium', 'Foxboro', 'MA';
	exec dab.InsertVenue 17, 'Wang Theatre at the Boch Center', 'Boston', 'MA';
	exec dab.InsertVenue 18, 'Orpheum Theatre', 'Boston', 'MA';
	exec dab.InsertVenue 19, 'Worcester Centrum / DCU Center', 'Worcester', 'MA';
	exec dab.InsertVenue 20, 'Shubert Theatre', 'Boston', 'MA';
	exec dab.InsertVenue 21, 'Wilbur Theatre', 'Boston', 'MA';

	begin try
		alter table dab.Concert
		check constraint fk_Venue
		-- foreign key (VenueId) references dab.Venue(VenueId);  TPD 07/31//2024.
	end try
	begin catch
	end catch

end;
go
