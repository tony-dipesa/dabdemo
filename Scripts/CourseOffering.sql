use DataAPIBuilderDemo
go

/******************************************************************************
<historylog>
    <log revision="1.0" date="05/20/2024" bug="" email="Tony DiPesa">Developed by Wellesley College.</log>
    <log revision="1.1" date="05/31/2024" bug="" email="Tony DiPesa">Added foreign key constraints.</log>
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
        object_id = object_id(N'dab.CourseOffering') and
        type in (N'U'))
begin
    drop table dab.CourseOffering
end
go

create table dab.CourseOffering(
	CourseOfferingId int identity not null primary key,
	TermId int not null,
	CourseId int not null,
	DepartmentId int not null,
	PrimaryInstructorId int null,
	MaximumEnrollment int null
	);
go

alter table dab.CourseOffering  -- TPD 05/31/2024.
add constraint CourseOffering_fk1 foreign key (TermId) references dab.Term(TermId);
go

alter table dab.CourseOffering  -- TPD 05/31/2024.
add constraint CourseOffering_fk2 foreign key (CourseId) references dab.Course(CourseId);
go

alter table dab.CourseOffering  -- TPD 05/31/2024.
add constraint CourseOffering_fk3 foreign key (DepartmentId) references dab.Department(DepartmentId);
go
alter table dab.CourseOffering  -- TPD 05/31/2024.
add constraint CourseOffering_fk4 foreign key (PrimaryInstructorId) references dab.Instructor(InstructorId);
go
