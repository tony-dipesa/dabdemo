use DataAPIBuilderDemo
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="07/25/2024" bug="" email="Tony DiPesa">Developed by Wellesley College.</log>
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
        object_id = object_id(N'dab.InsertTour') and
        type in (N'P', N'PC'))
begin
    drop procedure dab.InsertTour
end
go

create procedure dab.InsertTour
--<parameters>
	@tour_id				int,
	@tour_name				varchar(80)

as
declare
	@procedure_name varchar(200) = 'dab.InsertTour',
	@current_date datetime = getdate();

begin

	set identity_insert dab.Tour on;

	delete
	from dab.Tour
	where TourId = @tour_id;

	insert into dab.Tour(	TourId,
							Name,
							InsertedDate,
							InsertedBy,
							UpdatedDate,
							UpdatedBy)
	values
						(	@tour_id,
							@tour_name,
							@current_date,
							@procedure_name,
							@current_date,
							@procedure_name);
		
	set identity_insert dab.Tour off;

end;
go
