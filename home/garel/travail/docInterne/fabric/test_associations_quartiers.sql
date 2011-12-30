select cq_nom from population_comite_quartier;

select numero_val,
       numero_lib
from voirie_filaire_numero
where numero_val = 19
  and numero_lib like '%ROSEAUX%';

select numero_val,
       numero_lib,
       cq_nom
from voirie_filaire_numero,
     population_comite_quartier
where numero_val = 19
  and numero_lib like '%ROSEAUX%'
  and intersects(voirie_filaire_numero.the_geom, population_comite_quartier.the_geom);

select numero_val,
       numero_lib,
       cq_nom
from voirie_filaire_numero,
     population_comite_quartier
where numero_val = 171
  and numero_lib like '%GUITON%'
  and intersects(voirie_filaire_numero.the_geom, population_comite_quartier.the_geom);