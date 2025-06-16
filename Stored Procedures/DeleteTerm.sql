use DataAPIBuilderDemo
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="05/31/2024" bug="" email="Tony DiPesa">Developed by Wellesley College.</log>
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
        object_id = object_id(N'dab.DeleteTerm') and
        type in (N'P', N'PC'))
begin
    drop procedure dab.DeleteTerm
end
go

create procedure dab.DeleteTerm
--<parameters>
	@term_code varchar(20)
as
declare
	@procedure_name varchar(200) = 'dab.DeleteTerm';

begin

	delete from dab.Term
	where TermCode = @term_code;

end;
go
