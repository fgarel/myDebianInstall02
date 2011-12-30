create table result
as
select * from voirie_filaire_voie
where voie_libel like '%ROS%';