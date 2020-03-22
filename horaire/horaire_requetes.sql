use horaireDb;

#requete horaire enseignant
select * from vue_horaire_prof where nomEns = ?;


#horaire indisponibilite enseignant
select * from vue_horaire_indisponibilite where nomEns = ?;

# horaire disponibilite enseignant
select *
from vue_horaire_prof
where nomEns = ?
  and idHor  NOT IN
      (select idHor
       from vue_horaire_indisponibilite
       where nomEns = ?);

# horaire etudiant
select *
from vue_horaire_etudiant
where nomEtu = ?;

# horaire disponibilite etudiant
select *
from vue_horaire_etudiant
where idHor not in (select idHor from vue_horaire_etudiant where vue_horaire_etudiant.nomEtu = ?);

#horaire d'un local
select * from vue_horaire_local where idHor not in (select idHor from vue_horaire_local where vue_horaire_local.nomLoc = ?);


# possibilité remplacement
select *
from Horaire
where IdHor not in (select idHor from vue_horaire_etudiant where vue_horaire_etudiant.nomEtu = ?)
  and IdHor not in (select idHor from vue_horaire_prof where vue_horaire_prof.nomEns = ?)
  and IdHor not in (select idHor from vue_horaire_local where vue_horaire_local.nomLoc = ?);


#caracteristiques local
select *
from local;

#caracteristique cours
select *
from Cours;


#disponibilite local
select *
from Horaire
where idHor not in (select idHor from vue_horaire_local where vue_horaire_local.nomLoc = ?);


select * from vue_horaire_prof where nomEns = ?;
select * from enseignant;
select * from vue_horaire_etudiant where nomEtu = ?;
select * from vue_horaire_local where nomLoc = ?;
select intitule from cours;