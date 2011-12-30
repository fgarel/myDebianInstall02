--drop table litto3d;
delete from geometry_columns;

--select adgeometrycolumns
--select addgeometrycolumn('public', 'litto3d', 'the_geom', 2154,'POINT', 2);

select dropgeometrycolumn('public', 'litto3d', 'the_geom_l93_2d');
select dropgeometrycolumn('public', 'litto3d', 'the_geom_l93_3d');
select dropgeometrycolumn('public', 'litto3d', 'the_geom_l2_2d');
select dropgeometrycolumn('public', 'litto3d', 'the_geom_l2_3d');
select addgeometrycolumn('public', 'litto3d', 'the_geom_l93_2d', 2154,'POINT', 2);
select addgeometrycolumn('public', 'litto3d', 'the_geom_l93_3d', 2154,'POINT', 3);
select addgeometrycolumn('public', 'litto3d', 'the_geom_l2_2d', 27562,'POINT', 2);
select addgeometrycolumn('public', 'litto3d', 'the_geom_l2_3d', 27562,'POINT', 3);

update litto3d set the_geom_l93_2d = st_setsrid(st_makepoint(x,y),2154);
update litto3d set the_geom_l93_3d = st_setsrid(st_makepoint(x,y,z),2154);
update litto3d set the_geom_l2_2d = st_transform(st_setsrid(st_makepoint(x,y),2154),27562);
update litto3d set the_geom_l2_3d = st_transform(st_setsrid(st_makepoint(x,y,z),2154),27562);

-- on ne garde que le l2_2d
select dropgeometrycolumn('public', 'litto3d', 'the_geom_l93_2d');
select dropgeometrycolumn('public', 'litto3d', 'the_geom_l93_3d');
select dropgeometrycolumn('public', 'litto3d', 'the_geom_l2_3d');


-- on fait une table litto3d_v2 qui ne contiendra qu'un point sur 500
drop table if exists litto3d_v0500;
create table litto3d_v0500(
    x integer,
    y integer,
    z numeric (6,2)
    --z character varying(6)
);
select addgeometrycolumn('public', 'litto3d_v0500', 'the_geom_l2_2d', 27562,'POINT', 2);
insert into litto3d_v0500
  select *
  from litto3d
  where x = (x / 500) * 500
    and y = (y / 500) * 500;

-- on fait une table litto3d_v2 qui ne contiendra qu'un point sur 200
drop table if exists litto3d_v0200;
create table litto3d_v0200(
    x integer,
    y integer,
    z numeric (6,2)
    --z character varying(6)
);
select addgeometrycolumn('public', 'litto3d_v0200', 'the_geom_l2_2d', 27562,'POINT', 2);
insert into litto3d_v0200
  select *
  from litto3d
  where x = (x / 200) * 200
    and y = (y / 200) * 200;

-- on fait une table litto3d_v2 qui ne contiendra qu'un point sur 100
drop table if exists litto3d_v0100;
create table litto3d_v0100(
    x integer,
    y integer,
    z numeric (6,2)
    --z character varying(6)
);
select addgeometrycolumn('public', 'litto3d_v0100', 'the_geom_l2_2d', 27562,'POINT', 2);
insert into litto3d_v0100
  select *
  from litto3d
  where x = (x / 100) * 100
    and y = (y / 100) * 100;

-- on fait une table litto3d_v2 qui ne contiendra qu'un point sur 50
drop table if exists litto3d_v0050;
create table litto3d_v0050(
    x integer,
    y integer,
    z numeric (6,2)
    --z character varying(6)
);
select addgeometrycolumn('public', 'litto3d_v0050', 'the_geom_l2_2d', 27562,'POINT', 2);
insert into litto3d_v0050
  select *
  from litto3d
  where x = (x / 50) * 50
    and y = (y / 50) * 50;

-- on fait une table litto3d_v2 qui ne contiendra qu'un point sur 20
drop table if exists litto3d_v0020;
create table litto3d_v0020(
    x integer,
    y integer,
    z numeric (6,2)
    --z character varying(6)
);
select addgeometrycolumn('public', 'litto3d_v0020', 'the_geom_l2_2d', 27562,'POINT', 2);
insert into litto3d_v0020
  select *
  from litto3d
  where x = (x / 20) * 20
    and y = (y / 20) * 20;

-- on fait une table litto3d_v2 qui ne contiendra qu'un point sur 10
drop table if exists litto3d_v0010;
create table litto3d_v0010(
    x integer,
    y integer,
    z numeric (6,2)
    --z character varying(6)
);
select addgeometrycolumn('public', 'litto3d_v0010', 'the_geom_l2_2d', 27562,'POINT', 2);
insert into litto3d_v0010
  select *
  from litto3d
  where x = (x / 10) * 10
    and y = (y / 10) * 10;
    
-- on fait une table litto3d_v2 qui ne contiendra qu'un point sur 5
drop table if exists litto3d_v0005;
create table litto3d_v0005(
    x integer,
    y integer,
    z numeric (6,2)
    --z character varying(6)
);
select addgeometrycolumn('public', 'litto3d_v0005', 'the_geom_l2_2d', 27562,'POINT', 2);
insert into litto3d_v0005
  select *
  from litto3d
  where x = (x / 5) * 5
    and y = (y / 5) * 5;

-- on fait une table litto3d_v2 qui ne contiendra qu'un point sur 2
drop table if exists litto3d_v0002;
create table litto3d_v0002(
    x integer,
    y integer,
    z numeric (6,2)
    --z character varying(6)
);
select addgeometrycolumn('public', 'litto3d_v0002', 'the_geom_l2_2d', 27562,'POINT', 2);
insert into litto3d_v0002
  select *
  from litto3d
  where x = (x / 2) * 2
    and y = (y / 2) * 2;



/*
select x,
       y,
       z,
       st_asewkt(the_geom_l93_2d) as l93_2d,
       st_asewkt(the_geom_l93_3d) as l93_3d,
       st_asewkt(the_geom_l2_2d) as l2_2d,
       st_asewkt(the_geom_l2_3d) as l2_3d
  from litto3d;
*/
