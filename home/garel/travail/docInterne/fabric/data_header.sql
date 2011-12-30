create table data(
    numero integer,
    x double precision,
    y double precision
);

copy data ("numero", "x", "y") from stdin delimiter ';';
