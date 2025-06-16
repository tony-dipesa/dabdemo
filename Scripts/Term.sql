use DataAPIBuilderDemo
go

/******************************************************************************
<historylog>
    <log revision="1.0" date="05/20/2024" bug="" email="Tony DiPesa">Developed by Wellesley College.</log>
    <log revision="1.1" date="05/31/2024" bug="" email="Tony DiPesa">Added unique indexes.</log>
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
        object_id = object_id(N'dab.Term') and
        type in (N'U'))
begin
    drop table dab.Term;
end;
go

create table dab.Term(
	TermId int identity not null primary key,
	TermCode varchar(20) not null,
	TermName varchar(80) not null
	);
go

create unique index Term_u1 on dab.Term(TermCode);  -- TPD 05/31/2024.
go

create unique index Term_u2 on dab.Term(TermName);  -- TPD 05/31/2024.
go
