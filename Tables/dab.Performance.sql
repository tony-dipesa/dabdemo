use DataAPIBuilderDemo
go

/******************************************************************************
<historylog>
    <log revision="1.0" date="11/10/2024" bug="" email="Tony DiPesa">Developed by Wellesley College.</log>
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
        object_id = object_id(N'dab.Performance') and
        type in (N'U'))
begin

	begin try
		drop table dab.Performance;
	end try
	begin catch
	end catch

end
go

begin

	begin try
		select	ShowId as PerformanceId,
				Artist as Artist,
				Genre as Genre,
				Venue as Venue,
				Tour as Tour,  -- TPD 10/18/2024.
				[Date] as [Date],
				StarRating as StarRating,
				Stars as Stars,
				Notes as Notes
		into dab.Performance
		from dab.Show;

		alter table dab.Performance
		add constraint pk_performance primary key (PerformanceId);

	end try
	begin catch
	end catch

end;
