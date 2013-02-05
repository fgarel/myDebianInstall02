
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

