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
        object_id = object_id(N'dab.Tour') and
        type in (N'U'))
begin
	begin try
		alter table dab.Concert
		drop constraint fk_Tour;
	end try
	begin catch
	end catch

    drop table dab.Tour;
end
go

create table dab.Tour(
	TourId						int identity not null primary key,
	Name						varchar(80) not null,
	InsertedDate				datetime not null default getdate(),
	InsertedBy					varchar(200) not null default 'dab.InsertTour',
	UpdatedDate					datetime not null default getdate(),
	UpdatedBy					varchar(200) not null default 'dab.InsertTour',
	);
go

create unique index Tour_u1
on dab.Tour(Name);

go

begin

	begin try
		alter table dab.Concert
		add constraint fk_Tour
		foreign key (TourId) references dab.Tour(TourId);
	end try
	begin catch
	end catch

end;

go
