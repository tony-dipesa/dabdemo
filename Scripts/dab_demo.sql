use DataAPIBuilderDemo
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="05/30/2024" bug="" email="Tony DiPesa">Developed by Wellesley College.</log>
    <log revision="1.1" date="05/31/2024" bug="" email="Tony DiPesa">Added grant statements.</log>
    <log revision="1.2" date="07/25/2024" bug="" email="Tony DiPesa">Changed dab_demo login's password.</log>
</historylog>
******************************************************************************/

use DataAPIBuilderDemo
go

create login dab_demo with password = 'put an actual password here';

create user dab_demo for login dab_demo;

grant select, insert, update, delete, execute, alter on schema::dab to dab_demo;

grant create procedure to dab_demo;  -- TPD 05/31/2024.

grant create table to dab_demo;  -- TPD 05/31/2024.

grant create view to dab_demo;  -- TPD 05/31/2024.

grant references to dab_demo;  -- TPD 05/31/2024.

alter login dab_demo with password = 'put another actual password here';
