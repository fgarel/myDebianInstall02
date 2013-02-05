-- creation d'une table
create table point (
    matricule varchar,
    x float,
    y float,
    z float,
    code integer);
-- import des points à partir d'un fichier csv
copy point
  from '/home/garel/geodata/vecteur/test/point2.csv'
  delimiters ','
  CSV;
