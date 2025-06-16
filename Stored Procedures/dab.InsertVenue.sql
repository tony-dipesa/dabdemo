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
        object_id = object_id(N'dab.InsertVenue') and
        type in (N'P', N'PC'))
begin
    drop procedure dab.InsertVenue
end
go

create procedure dab.InsertVenue
--<parameters>
	@venue_id				int,
	@venue_name				varchar(80),
	@city					varchar(80),
	@state_code				varchar(3)
as
declare
	@procedure_name varchar(200) = 'dab.InsertVenue',
	@current_date datetime = getdate();

begin

	set identity_insert dab.Venue on;

	delete
	from dab.Venue
	where VenueId = @venue_id;

	insert into dab.Venue(	VenueId,
							Name,
							City,
							StateCode,
							InsertedDate,
							InsertedBy,
							UpdatedDate,
							UpdatedBy)
	values
						(	@venue_id,
							@venue_name,
							@city,
							@state_code,
							@current_date,
							@procedure_name,
							@current_date,
							@procedure_name);
		
	set identity_insert dab.Venue off;

end;
go
