drop table parcelle;
create table parcelle 
  (
    id serial not null,
    name character varying(255) NOT NULL,
    geom_ewkt character varying,
    geom_kml character varying
  );
select addgeometrycolumn('parcelle',
                         'the_geom', 
                         2154,
                         'POLYGON',
                         2);


insert into parcelle values (1, 'ch385', 'POLYGON((
        +1379183.05 +5227390.18,
        +1379211.08 +5227398.44,
        +1379219.57 +5227400.89,
        +1379222.45 +5227403.04,
        +1379228.10 +5227407.36,
        +1379229.01 +5227406.43,
        +1379237.75 +5227396.28,
        +1379232.24 +5227394.38,
        +1379226.49 +5227392.59,
        +1379222.59 +5227391.24,
        +1379220.18 +5227390.46,
        +1379216.85 +5227389.34,
        +1379215.81 +5227389.00,
        +1379214.09 +5227388.45,
        +1379189.86 +5227380.38,
        +1379187.81 +5227383.27,
        +1379183.28 +5227389.94,
        +1379183.05 +5227390.18
        ))');                         
insert into parcelle values (2, 'ch386', 'POLYGON((
        +1379219.13 +5227417.51,
        +1379212.44 +5227411.95,
        +1379177.72 +5227396.52,
        +1379177.95 +5227396.18,
        +1379183.05 +5227390.18,
        +1379211.08 +5227398.44,
        +1379219.57 +5227400.89,
        +1379222.45 +5227403.04,
        +1379228.10 +5227407.36,
        +1379227.99 +5227407.47,
        +1379224.58 +5227411.50,
        +1379224.47 +5227411.51,
        +1379219.24 +5227417.40,
        +1379219.13 +5227417.51
        ))');
insert into parcelle values (3, 'bornage385', 'POLYGON((
        1379228.100000 5227407.360000,
        1379237.750000 5227396.280000,
        1379189.860000 5227380.380000,
        1379183.050000 5227390.180000,
        1379219.570000 5227400.890000,
        1379228.100000 5227407.360000
        ))');
insert into parcelle values (4, 'bornage386', 'POLYGON((
        1379228.100000 5227407.360000,
        1379219.130000 5227417.510000,
        1379212.440000 5227411.950000,
        1379177.720000 5227396.520000,
        1379183.050000 5227390.180000,
        1379219.570000 5227400.890000,
        1379228.100000 5227407.360000
        ))');
insert into parcelle values (5, 'bati_old', 'POLYGON((
        1379228.100000 5227407.360000,
        1379237.750000 5227396.280000,
        1379226.490000 5227392.590000,
        1379219.570000 5227400.890000,
        1379228.100000 5227407.360000
        ))');
insert into parcelle values (6, 'test', 'POLYGON((
        +379504.05 +6571930.18,
        +379498.05 +6571924.18,
        +379505.05 +6571916.18,
        +379514.05 +6571919.18,
        +379504.05 +6571930.18
        ))');
--copy parcelle from '/home/garel/perso/projetConstruction/data.txt';
--copy parcelle to '/home/garel/perso/projetConstruction/data2.txt';
--2, 'ch_386','POLYGON((0 0, 0 1, 1 1, 1 0, 0 0))'
--3, 'ch_387','POLYGON((0 0, 0 1, 1 1, 1 0, 0 0))')
--;
update parcelle set the_geom=geomfromtext(geom_ewkt,2154);
update parcelle set geom_kml=askml(the_geom);
select name,askml(the_geom) from parcelle;
select geom_kml from parcelle where name = 'ch385';

drop table test;
create table test 
  (
    id serial not null
  );

select addgeometrycolumn('test',
                         'the_geom', 
                         2154,
                         'POINT',
                         2);
insert into test values (1);
insert into test values (2);
insert into test values (3);
insert into test values (4);
insert into test values (5);

update test set the_geom=geomfromtext('POINT(+379504.05 +6571930.18)',2154) where id=1;
update test set the_geom=geomfromtext('POINT(+379514.05 +6571919.18)',2154) where id=2;
update test set the_geom=geomfromtext('POINT(+379498.05 +6571924.18)',2154) where id=3;
update test set the_geom=geomfromtext('POINT(+379505.05 +6571916.18)',2154) where id=4;

select *, asewkt(the_geom) from test;
select * from spatial_ref_sys where srid=2154;
                         
