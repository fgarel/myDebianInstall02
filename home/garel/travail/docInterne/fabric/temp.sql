create table data(
    numero integer,
    x double precision,
    y double precision
);

copy data ("numero", "x", "y") from stdin delimiter ';';
1;100000;300000
2;100010;300000
3;100010;300010
4;100000;300000
