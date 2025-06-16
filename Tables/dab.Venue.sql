use DataAPIBuilderDemo
go

/******************************************************************************
<historylog>
    <log revision="1.0" date="07/25/2024" bug="" email="Tony DiPesa">Developed by Wellesley College.</log>
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
        object_id = object_id(N'dab.Venue') and
        type in (N'U'))
begin
	begin try
		alter table dab.Concert
		drop constraint fk_Venue;
	end try
	begin catch
	end catch

    drop table dab.Venue;
end
go

create table dab.Venue(
	VenueId						int identity not null primary key,
	Name						varchar(80) not null,
	City						varchar(80) not null,
	StateCode					varchar(3) not null,
	InsertedDate				datetime not null default getdate(),
	InsertedBy					varchar(200) not null default 'dab.InsertVenue',
	UpdatedDate					datetime not null default getdate(),
	UpdatedBy					varchar(200) not null default 'dab.InsertVenue',
	);
go

create unique index Venue_u1
on dab.Venue(Name);

go

begin

	begin try
		alter table dab.Concert
		add constraint fk_Venue
		foreign key (VenueId) references dab.Venue(VenueId);
	end try
	begin catch
	end catch

end;

go
