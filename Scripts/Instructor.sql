use DataAPIBuilderDemo
go

/******************************************************************************
<historylog>
    <log revision="1.0" date="05/20/2024" bug="" email="Tony DiPesa">Developed by Wellesley College.</log>
    <log revision="1.1" date="05/31/2024" bug="" email="Tony DiPesa">Added unique index.</log>
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
        object_id = object_id(N'dab.Instructor') and
        type in (N'U'))
begin
    drop table dab.Instructor;
end;
go

create table dab.Instructor(
	InstructorId int identity not null primary key,
	CollegeId varchar(20) not null,
	LastName varchar(80) not null,
	FirstName varchar(80) not null,
	MiddleName varchar(80) null,
	PrimaryDepartmentId int null
	);
go

create unique index Instructor_u1 on dab.Instructor(CollegeId);  -- TPD 05/31/2024.
go
