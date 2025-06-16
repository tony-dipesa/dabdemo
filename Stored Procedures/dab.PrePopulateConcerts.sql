use DataAPIBuilderDemo
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="07/25/2024" bug="" email="Tony DiPesa">Developed by Wellesley College.</log>
    <log revision="1.1" date="07/31/2024" bug="" email="Tony DiPesa">Added Green Day concerts.</log>
    <log revision="1.2" date="08/01/2024" bug="" email="Tony DiPesa">Added truncate statement. Replaced dab.InsertConcert stored procedure calls with dab.InsertShow stored procedure calls. Added 30 new calls to dab.InsertShow stored procedure.</log>
    <log revision="1.3" date="08/02/2024" bug="" email="Tony DiPesa">Added Paul McCartney show.</log>
    <log revision="1.4" date="10/18/2024" bug="" email="Tony DiPesa">Updated data on recent concerts.</log>
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
        object_id = object_id(N'dab.PrePopulateConcerts') and
        type in (N'P', N'PC'))
begin
    drop procedure dab.PrePopulateConcerts
end
go

create procedure dab.PrePopulateConcerts
--<parameters>
as
declare
	@procedure_name varchar(200) = 'dab.PrePopulateConcerts',
	@current_date datetime = getdate();

begin

	-- Parameters
	--@concert_id				int,
	--@artist_id				int,
	--@venue_id				int,
	--@concert_date			datetime,
	--@tour_id				int = null,
	--@star_rating			tinyint = null,
	--@notes					varchar(4000) = null

	-- Queen
--	exec dab.InsertConcert 1, 3, 1, '1982-07-23', 1, 5, 'My first concert. Queen was amazing - Freddie Mercury was incredible!';
	
	-- Peter Gabriel
--	exec dab.InsertConcert 2, 5, 12, '1983-07-27', 5, 5, 'Still my favorite concert of all time! Rushed the stage after the opener.';
	
	-- Green Day
--	exec dab.InsertConcert 3, 6, 5, '2024-08-07', 6, null, 'Looking forward to it!';
--	exec dab.InsertConcert 4, 6, 10, '2016-10-01', null, 5, 'Amazing show! On the floor, about 20 feet from the stage. Avoided the mosh pit. Diana won tickets on 92.9 FM';
--	exec dab.InsertConcert 5, 6, 5, '2021-08-05', 3, 4, 'Really good show! Unfortunately Fall Out Boy dropped out due to Covid.';
--	exec dab.InsertConcert 6, 6, 9, '2017-08-28', 7, 4, 'Another great show, but a lot further away than House of Blues show.';

	-- TPD 08/01/2024.
	truncate table dab.Concert;
	exec dab.InsertShow 'Queen', 'Boston Garden', '1982-07-23', 'Hot Space Tour', 5, 'My first concert. Queen was amazing - Freddie Mercury was incredible!';
	exec dab.InsertShow 'Peter Gabriel', 'E. M. Loew''s Theatre of Performing Arts', '1983-07-27', 'Security Tour', 5, 'Still my favorite concert of all time! Rushed the stage after the opener.';
	exec dab.InsertShow 'Green Day', 'Fenway Park', '2024-08-07', 'Saviors Tour', 4, 'Music was really good, but seats were too far from the stage.';
	exec dab.InsertShow 'Green Day', 'House of Blues', '2016-10-01', 'Revolution Radio Tour', 5, 'Amazing show! On the floor, about 20 feet from the stage. Avoided the mosh pit. Diana won tickets on 92.9 FM';
	exec dab.InsertShow 'Green Day', 'Fenway Park', '2021-08-05', 'Hella Mega Tour', 4, 'Excellent show! Would have given them five stars, but Fall Out Boy dropped out due to Covid.';
	exec dab.InsertShow 'Green Day', 'Worcester Centrum / DCU Center', '2017-03-17', 'Revolution Radio Tour', 4, 'Another great show, but a lot further away than House of Blues show.';
	exec dab.InsertShow 'The Who', 'TD Garden', '2012-11-16', 'Quadrophenia and More Tour', 4, 'Pete and Roger with several other musicians';
	exec dab.InsertShow 'The Who', 'Fenway Park', '2019-09-13', 'Movin On Tour', 3, 'Pete and Roger with a 20-piece orchestra';
	exec dab.InsertShow 'The Rolling Stones', 'Foxboro Stadium', '1997-10-20', 'Bridges to Babylon Tour', 3, 'Liked it, but didn''t love it. Although Mick still has the moves!';
	exec dab.InsertShow 'Peter Gabriel', 'Worcester Centrum / DCU Center', '1993-06-20', 'Secret World Tour', 5, 'Excellent show! So much energy!'
	exec dab.InsertShow 'Peter Gabriel', 'TD Garden', '2023-09-14', 'i/o The Tour', 2, 'Disappointed that he didn''t play more of his hits.'
	exec dab.InsertShow 'Depeche Mode', 'TD Garden', '2023-10-31', 'Memento Mori Tour', 5, 'They still sound great!'
	exec dab.InsertShow 'The Ramones', 'Xfinity Center / Great Woods', '1990-07-06', 'Escape From New York Tour', 3, 'Don''t really remember too much?'
	exec dab.InsertShow 'The Thompson Twins', 'Worcester Centrum / DCU Center', '1985-12-21', 'Tour for Future Days', 5, 'Fantastic show! Two terrific bands live!'
	exec dab.InsertShow 'Orchestral Manoeuvres in the Dark', 'Worcester Centrum / DCU Center', '1985-12-21', 'Tour for Future Days', 5, 'Fantastic show! Two terrific bands live!'
	exec dab.InsertShow 'The B-52s', 'Orpheum Theatre', '1989-11-11', 'Cosmic Tour', 5, 'Great band! Great show!'
	exec dab.InsertShow 'The B-52s', 'MGM Music Hall at Fenway', '2022-09-30', 'The Final Tour Ever of Planet Earth', 2, 'Unfortunately, not nearly as good as before.'
	exec dab.InsertShow 'The Red Hot Chili Peppers', 'Fenway Park', '2022-09-10', 'Global Stadium Tour 2022-23', 3, 'Good show. Crowd was really into it.'
	exec dab.InsertShow 'New Order', 'Leader Bank Pavilion', '2022-09-19', 'The Unity Tour', 5, 'They are still great!'
	exec dab.InsertShow 'The Pet Shop Boys', 'Leader Bank Pavilion', '2022-09-19', 'The Unity Tour', 4, 'Excellent show! Pet Shop Boys were surprisingly good!'
	exec dab.InsertShow 'Public Image Limited', 'Xfinity Center / Great Woods', '1989-07-10', 'Monsters of Alternative Rock Tour', 4, 'Liked PIL. Glad I got to see Johnny Rotten!'
	exec dab.InsertShow 'New Order', 'Xfinity Center / Great Woods', '1989-07-10', 'Monsters of Alternative Rock Tour', 5, 'New Order was awesome, of course!'
	exec dab.InsertShow 'The Sugarcubes', 'Xfinity Center / Great Woods', '1989-07-10', 'Monsters of Alternative Rock Tour', 3, 'They were pretty good.'
	exec dab.InsertShow 'The Tom Tom Club', 'Xfinity Center / Great Woods', '1990-07-06', 'Escape From New York Tour', 4, 'Tom Tom Club was really good. Would have loved to have seen Talking Heads!'
	exec dab.InsertShow 'Jerry Harrison', 'Xfinity Center / Great Woods', '1990-07-06', 'Escape From New York Tour', 3, 'Jerry Harrison was decent. Would have loved to have seen Talking Heads!'
	exec dab.InsertShow 'Deborah Harry', 'Xfinity Center / Great Woods', '1990-07-06', 'Escape From New York Tour', 4, 'Debbie Harry is classic!'
	exec dab.InsertShow 'Adam Ant', 'Shubert Theatre', '2019-09-17', 'Friend or Foe North American Tour 2019', 4, 'Played lots of Adam and the Ants songs! Excellent drums!'
	exec dab.InsertShow 'Adam Ant', 'Wilbur Theatre', '2024-04-01', 'Antmusic 2024 Tour', 4, 'Really good again! Incredible drums, of course!'
	exec dab.InsertShow 'Jimmy Buffet', 'Xfinity Center / Great Woods', '1991-08-18', null, 4, 'Fun concert. Chilled on the lawn. Great people watching - Parrotheads!'
	exec dab.InsertShow 'The Weeknd', 'Foxboro Stadium', '2022-07-21', 'After Hours Til Dawn Tour', 3, 'Nathan liked it. Glad I could take him!'
	exec dab.InsertShow 'Willie Nelson', 'Billy Bob''s', '1987-11-20', null, 4, 'Not a country music fan, but I have to admit Willie was terrific!'
	exec dab.InsertShow 'Cracker', 'Paradise Rock Club', '1993-11-14', 'Kerosene Hat Tour 1993-1994', 4, 'Dinner with the band before the show!'
	exec dab.InsertShow 'Squeeze', 'Wang Theatre at the Boch Center', '2024-09-12', 'Squeeze Me Boy George Tour', 4, 'They really rocked it out and musicians were great, but vocals were drowned out.'
	exec dab.InsertShow 'Boy George', 'Wang Theatre at the Boch Center', '2024-09-12', 'Squeeze Me Boy George Tour', 3, 'He still has a good voice.'
	exec dab.InsertShow 'The Psychedelic Furs', 'Orpheum Theatre', '2024-10-02', 'The Psychedelic Furs and The Jesus and Mary Chain', 5, 'Sounded great!'
	exec dab.InsertShow 'The Jesus and Mary Chain', 'Orpheum Theatre', '2024-10-02', 'The Psychedelic Furs and The Jesus and Mary Chain', 4, 'Really good also.'
	exec dab.InsertShow 'Paul McCartney', 'TD Garden', '2002-04-19', 'Driving USA Tour', 4, 'He was really good, but I was really stressed!'

end;
go
