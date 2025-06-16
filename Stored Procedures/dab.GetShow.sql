use DataAPIBuilderDemo
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="11/13/2024" bug="" email="Tony DiPesa">Developed by Wellesley College.</log>
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
        object_id = object_id(N'dab.GetShow') and
        type in (N'P', N'PC'))
begin
    drop procedure dab.GetShow
end
go

create procedure dab.GetShow
--<parameters>
	@artist					varchar(80) = null,
	@genre					varchar(80) = null,
	@star_rating			int = null
as
declare
	@procedure_name		varchar(200) = 'dab.GetShow'

begin

	select	Artist,
			Genre,
			Tour,
			convert(varchar, [Date], 101) as ShowDate,
			StarRating,
			Stars,
			Notes
	from dab.Show
	where (Artist like @artist or @artist is null)
	and (Genre like @genre or @genre is null)
	and (StarRating = @star_rating or @star_rating is null)
	order by case when @genre is not null
					then Genre
					else Artist
			 end,
			 Artist,
			 [Date];

end;
go
