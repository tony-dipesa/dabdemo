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
        object_id = object_id(N'dab.Course') and
        type in (N'U'))
begin
    drop table dab.Course
end
go

create table dab.Course(
	CourseId int identity not null primary key,
	CourseName varchar(200) not null,
	PrimaryDepartmentId int null
	);
go

create unique index Course_u1
on dab.Course(CourseName);
go

