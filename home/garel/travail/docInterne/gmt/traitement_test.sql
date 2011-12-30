drop table if exists litto3d_v1000;
create table litto3d_v1000(
    x integer,
    y integer,
    z numeric (6,2)
    --z character varying(6)
);
select addgeometrycolumn('public', 'litto3d_v1000', 'the_geom_l2_2d', 27562,'POINT', 2);
insert into litto3d_v1000
  select *
  from litto3d
  where x = (x / 1000) * 1000
    and y = (y / 1000) * 1000
  limit 10;