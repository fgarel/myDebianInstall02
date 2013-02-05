
select * from point;

select x,y,st_asewkt(the_geom) from point;
select
  x,
  y,
  st_asewkt(the_geom), 
  st_asewkt(st_transform(the_geom, 2154))
from point;


    
-- verification
select
  x,
  y,
  st_asewkt(the_geom), 
  st_asewkt(st_transform(the_geom, 2154))
from point;