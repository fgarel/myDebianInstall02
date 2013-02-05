

update point set the_geom=
    st_setsrid(
      st_makepoint(
         x,
         y,
         z),
      2154);
    

--update point set the_geom=
--    st_setsrid(
--      st_makepoint(
--         6898743.87343004,
--         2467468.65469455,
--         0),
--      2154)
--    where matricule=3;
    
