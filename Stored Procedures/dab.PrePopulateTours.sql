use DataAPIBuilderDemo
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="07/25/2024" bug="" email="Tony DiPesa">Developed by Wellesley College.</log>
    <log revision="1.1" date="07/31/2024" bug="" email="Tony DiPesa">Modified code to disable / enable foreign key constraint. Added Revolution Radio Tour.</log></historylog>
    <log revision="1.2" date="08/01/2024" bug="" email="Tony DiPesa">Added quite a few tours.
    <log revision="1.3" date="08/02/2024" bug="" email="Tony DiPesa">Added Driving USA Tour and Rock or Bust World Tour.
</log></historylog>
******************************************************************************/

/******************************************************************************
	Create the procedure in the dab schema
******************************************************************************/

if  exists (
    select *
    from
        sys.objects
    where
        object_id = object_id(N'dab.PrePopulateTours') and
        type in (N'P', N'PC'))
begin
    drop procedure dab.PrePopulateTours
end
go

create procedure dab.PrePopulateTours
--<parameters>
as
declare
	@procedure_name varchar(200) = 'dab.PrePopulateTours',
	@current_date datetime = getdate();

begin

	begin try
		alter table dab.Concert
		nocheck constraint fk_Tour;
	end try
	begin catch
	end catch

	exec dab.InsertTour 1, 'Hot Space Tour'
	exec dab.InsertTour 2, 'Serious Moonlight Tour'
	exec dab.InsertTour 3, 'Hella Mega Tour'
	exec dab.InsertTour 4, 'i/o The Tour'
	exec dab.InsertTour 5, 'Security Tour'
	exec dab.InsertTour 6, 'Saviors Tour'
	exec dab.InsertTour 7, 'Revolution Radio Tour'
	exec dab.InsertTour 8, 'Friend or Foe North American Tour 2019'
	exec dab.InsertTour 9, 'Antmusic 2024 Tour'
	exec dab.InsertTour 10, 'Quadrophenia and More Tour'
	exec dab.InsertTour 11, 'Movin On Tour'
	exec dab.InsertTour 12, 'Bridges to Babylon Tour'
	exec dab.InsertTour 13, 'Secret World Tour'
	exec dab.InsertTour 14, 'Memento Mori Tour'
	exec dab.InsertTour 15, 'Escape From New York Tour'
	exec dab.InsertTour 16, 'Monsters of Alternative Rock Tour'
	exec dab.InsertTour 17, 'The Unity Tour'
	exec dab.InsertTour 18, 'Tour for Future Days'
	exec dab.InsertTour 19, 'Cosmic Tour'
	exec dab.InsertTour 20, 'The Final Tour Ever of Planet Earth'
	exec dab.InsertTour 21, 'After Hours Til Dawn Tour'
	exec dab.InsertTour 22, 'Kerosene Hat Tour 1993-1994'
	exec dab.InsertTour 23, 'Global Stadium Tour 2022-23'
	exec dab.InsertTour 24, 'Driving USA Tour'
	exec dab.InsertTour 25, 'Rock or Bust World Tour'

	

	begin try
		alter table dab.Concert
		check constraint fk_Tour
		-- foreign key (TourId) references dab.Tour(TourId);  TPD 07/31/2024.
	end try
	begin catch
	end catch

end;

go
