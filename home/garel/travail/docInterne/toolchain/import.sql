drop table point;
create table point (
    matricule varchar,
    x float,
    y float,
    z float,
    code integer);
-- import des points à partir d'un fichier csv
copy point
  from './geodata/vecteur/test/point2.csv'
  delimiters ';'
  CSV;
select addgeometrycolumn('point', 'the_geom',2154,'POINT',3);
select * from point;
insert into point (
    matricule,
    x,
    y,
    z,
    the_geom)
  values (
    1,
    6898743.87343004,
    2467468.65469455,
    0,
    ST_GeomFromEWKT(
      'SRID=2154;
      POINT(
         6898743.87343004
         2467468.65469455
         0)'
      )
    );

insert into point (
    matricule,
    x,
    y,
    z,
    the_geom)
  values (
    2,
    6898743.87343004,
    2467468.65469455,
    0,
    st_setsrid(
      st_makepoint(
         6898743.87343004,
         2467468.65469455,
         0),
      2154)
    );
select x,y,st_asewkt(the_geom) from point;
select
  x,
  y,
  st_asewkt(the_geom), 
  st_asewkt(st_transform(the_geom, 2154))
from point;

insert into point (
    matricule,
    x,
    y,
    z,
    the_geom)
  values (
    3,
    6898743.87343004,
    2467468.65469455,
    0,
    null
    );

update point set the_geom=
    st_setsrid(
      st_makepoint(
         6898743.87343004,
         2467468.65469455,
         0),
      2154)
    where matricule=3;
-- verification
select
  x,
  y,
  st_asewkt(the_geom), 
  st_asewkt(st_transform(the_geom, 2154))
from point;