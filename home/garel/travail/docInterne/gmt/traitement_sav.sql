drop table if exists litto3d_v2;
drop table if exists litto3d_v5;
/*create table litto3d_v2(
	x integer,i
	y integer,
	z numeric(6,2)
	);
select addgeometrycolumn('public', 'litto3d_v2', 'the_geom_l2_2d', 27562, 'POINT', 2);*/

/*select *
into litto3d_v2
from litto3d
where x = (x/2) * 2
  and y = (y/2) * 2
limit 100;*/

select * from litto3d_v2;
