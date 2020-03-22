# creation base de donnee
drop database if exists horaireDB;
create database horaireDB;


# utilisation bd
use horaireDB;

# creation des tables

create table horaire
(
    idHor      integer   not null primary key auto_increment,
    heureDebut timestamp not null,
    heureFin   timestamp not null
        check (heureFin > heureDebut)
);

create table etudiant
(
    idEtu     integer     not null primary key auto_increment,
    matricule integer     not null unique,
    prenomEtu varchar(50),
    nomEtu    varchar(50) not null
);

create table enseignant
(
    idEns        integer     not null primary key auto_increment,
    prenomEns    varchar(50),
    nomEns       varchar(50) not null,
    telephoneEns varchar(50),
    emailEns     varchar(50) unique
);

create table indisponibilite
(
    IdIndispo integer not null primary key auto_increment,
    IdHor     integer not null,
    IdEns     integer not null,
    raison    varchar(250),
    foreign key (IdEns) references enseignant (IdEns),
    foreign key (IdHor) references horaire (Idhor)
);

create table local
(
    idLoc      integer     not null primary key auto_increment,
    nomSite    varchar(50),
    nomLoc     varchar(50) not null,
    nbPlaces   integer     not null,
    tbi        boolean,
    sallePC    boolean,
    projecteur boolean
);



create table cavp
(
    idcavp integer not null primary key auto_increment,
    nbrue  integer not null
);

create table ue
(
    Idue      integer     not null primary key auto_increment,
    nomue     varchar(50) not null,
    nbrCours  integer     not null,
    nbrCredit integer     not null
);

create table cours
(
    IdCours     integer      not null primary key auto_increment,
    intitule    varchar(250) NOT NULL,
    nbEtudiants integer      not null,
    materiel    varchar(100) not null,
    RefIdEns    integer      not null,
    foreign key (RefIdEns) references Enseignant (IdEns)

);

create table session
(
    IdSess   integer not null primary key auto_increment,
    nomSess  varchar(50),
    RefIdEns integer not null,
    foreign key (RefIdEns) references Enseignant (IdEns)
);

create table seance
(
    IdSeance  integer not null primary key auto_increment,
    numSeance integer not null,
    refHor    integer not null,
    RefLoc    integer not null,
    refIdEns  integer not null,
    refSess   integer NOT NULL,
    foreign key (refSess) references session (idSess),
    foreign key (refIdEns) references enseignant (idEns),
    foreign key (refHor) references horaire (idHor),
    foreign key (refLoc) references local (idLoc)
);


create table cavp_etu
(
    idLienCE integer not null primary key auto_increment,
    refEtu   integer not null,
    refcavp  integer not null,
    foreign key (refcavp) references cavp (idcavp),
    foreign key (refEtu) references etudiant (idEtu)
);

create table cavp_ue
(
    idLienCU integer not null primary key auto_increment,
    refue    integer not null,
    refcavp  integer not null,
    foreign key (refcavp) references cavp (idcavp),
    foreign key (refue) references ue (idue)
);

create table ue_cours
(
    IdueCours integer not null primary key auto_increment,
    Refue     integer not null,
    RefCours  integer not null,
    foreign key (RefCours) references cours (IdCours),
    foreign key (Refue) references ue (Idue)
);

create table session_cours
(
    idSessCours integer not null primary key auto_increment,
    refCours    integer not null,
    refSess     integer NOT NULL,
    foreign key (refSess) references session (idSess),
    foreign key (refCours) references cours (idcours)

);


create table session_seance
(
    idSessSeance integer not null primary key auto_increment,
    refSess      integer NOT NULL,
    refSeance    integer not null,
    foreign key (refSeance) references seance (idSeance),
    foreign key (refSess) references session (idSess)
);

create table session_etu
(
    idsession_etu integer not null primary key auto_increment,
    refSess       integer NOT NULL,
    refEtu        integer not null,
    foreign key (refEtu) references etudiant (idEtu),
    foreign key (refSess) references session (idSess)
);



# insertion dans la base de donnee

#encodage des horaires
insert into Horaire (heureDebut, heureFin)
values ('2019-08-07 08:00:00', '2020-01-23 10:00:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-07 10:30:00', '2020-01-23 12:30:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-07 13:40:00', '2020-01-23 15:40:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-07 16:00:00', '2020-02-23 18:00:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-08 08:00:00', '2020-02-24 10:00:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-08 10:30:00', '2020-02-24 12:30:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-08 13:40:00', '2020-04-24 15:40:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-08 16:00:00', '2020-04-24 18:00:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-09 08:00:00', '2020-06-30 10:00:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-09 10:30:00', '2020-06-30 12:30:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-09 13:40:00', '2020-06-30 15:40:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-09 16:00:00', '2020-01-30 18:00:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-10 08:00:00', '2020-01-26 10:00:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-10 10:30:00', '2020-01-26 12:30:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-10 13:40:00', '2020-05-26 15:40:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-10 16:00:00', '2020-05-26 18:00:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-11 08:00:00', '2020-06-27 10:00:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-11 10:30:00', '2020-06-27 12:30:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-11 13:40:00', '2020-06-27 15:40:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-11 16:00:00', '2020-05-27 18:00:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-07 08:00:00', '2020-02-23 12:30:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-07 13:40:00', '2020-02-23 18:00:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-08 08:00:00', '2020-09-24 12:30:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-08 13:40:00', '2020-09-24 18:00:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-09 08:00:00', '2020-03-30 12:30:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-09 13:40:00', '2020-03-30 18:00:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-10 08:00:00', '2020-01-26 12:30:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-10 13:40:00', '2020-01-26 18:00:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-11 08:00:00', '2020-02-27 12:30:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-11 13:40:00', '2020-02-27 18:00:00');


#encodage des locaux
insert into local (nomSite, nomLoc, nbPlaces, tbi, sallePC, projecteur)
values ('Royal', 'R301', 20, false, false, true);
insert into local (nomSite, nomLoc, nbPlaces, tbi, sallePC, projecteur)
values ('Royal', 'R302', 20, true, false, true);
insert into local (nomSite, nomLoc, nbPlaces, tbi, sallePC, projecteur)
values ('Royal', 'R305', 20, true, true, true);
insert into local (nomSite, nomLoc, nbPlaces, tbi, sallePC, projecteur)
values ('Royal', 'R101', 16, true, false, false);
insert into local (nomSite, nomLoc, nbPlaces, tbi, sallePC, projecteur)
values ('Royal', 'R102', 16, true, true, true);
insert into local (nomSite, nomLoc, nbPlaces, tbi, sallePC, projecteur)
values ('Royal', 'R216', 12, true, false, true);
insert into local (nomSite, nomLoc, nbPlaces, tbi, sallePC, projecteur)
values ('Goujons', 'MC105', 12, true, false, false);
insert into local (nomSite, nomLoc, nbPlaces, tbi, sallePC, projecteur)
values ('Goujons', 'MD020', 30, false, false, true);
insert into local (nomSite, nomLoc, nbPlaces, tbi, sallePC, projecteur)
values ('Goujons', 'MC007', 10, true, false, true);
insert into local (nomSite, nomLoc, nbPlaces, tbi, sallePC, projecteur)
values ('Goujons', 'MC213', 20, true, false, false);
insert into local (nomSite, nomLoc, nbPlaces, tbi, sallePC, projecteur)
values ('Goujons', 'MC205', 16, true, false, true);
insert into local (nomSite, nomLoc, nbPlaces, tbi, sallePC, projecteur)
values ('Goujons', 'MC107', 12, true, false, true);


#encodage des profs
insert into Enseignant (nomEns)
values ('Bernard');
insert into Enseignant (nomEns)
values ('Haerlingen');
insert into Enseignant (nomEns)
values ('Humblet');
insert into Enseignant (nomEns)
values ('Levaillant');
insert into Enseignant (nomEns)
values ('Bernard');
insert into Enseignant (nomEns)
values ('Mattens');
insert into Enseignant (nomEns)
values ('Grobet');
insert into Enseignant (nomEns)
values ('Vanbuylaere');
insert into Enseignant (nomEns)
values ('Baiboun');
insert into Enseignant (nomEns)
values ('Gerardy');
insert into Enseignant (nomEns)
values ('Vanderschuren');
insert into Enseignant (nomEns)
values ('Classens');
insert into Enseignant (nomEns)
values ('Botin');
insert into Enseignant (nomEns)
values ('Vandencruyce');


#encodage des cavp
insert into cavp (nbrue)
values ('5');
insert into cavp (nbrue)
values ('5');
insert into cavp (nbrue)
values ('5');
insert into cavp (nbrue)
values ('5');
insert into cavp (nbrue)
values ('5');
insert into cavp (nbrue)
values ('5');
insert into cavp (nbrue)
values ('5');
insert into cavp (nbrue)
values ('6');
insert into cavp (nbrue)
values ('6');
insert into cavp (nbrue)
values ('7');
insert into cavp (nbrue)
values ('8');


#encodage des ue
insert into ue (nomue, nbrCours, nbrCredit)
values ('Gestion', 1, 5);
insert into ue (nomue, nbrCours, nbrCredit)
values ('Mécanique & thermodynamique appliquees', 3, 5);
insert into ue (nomue, nbrCours, nbrCredit)
values ('Electronique & Informatique 3', 4, 5);
insert into ue (nomue, nbrCours, nbrCredit)
values ('Electrotechnique', 3, 5);
insert into ue (nomue, nbrCours, nbrCredit)
values ('Fabrication Mecanique', 1, 5);
insert into ue (nomue, nbrCours, nbrCredit)
values ('Génie chimie', 1, 5);
insert into ue (nomue, nbrCours, nbrCredit)
values ('Physique appliquee', 1, 5);
insert into ue (nomue, nbrCours, nbrCredit)
values ('Chimie 2', 2, 5);
insert into ue (nomue, nbrCours, nbrCredit)
values ('Electricité II', 3, 2);
insert into ue (nomue, nbrCours, nbrCredit)
values ('Mécanique des milieux continus', 3, 4);
insert into ue (nomue, nbrCours, nbrCredit)
values ('Mathematique et informatique', 3, 4);


#encodage des activites d'aprentissage
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Gestion', 20, 'tbi', 1);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Mecanique & thermodynamique appliquees', 20, 'tbi + projecteur', 1);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Laboratoire de mecanique & thermodynamique appliquees', 20, 'materiel de laboratoire de mecanique', 2);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Exercice de mecanique & thermodynamique appliquees', 20, 'tbi + projecteur', 2);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Electronique', 20, 'projecteur', 3);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Electronique de puissance', 20, 'tbi', 3);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Laboratoire dinformatique 3', 15, 'tbi + sallePC + projecteur', 3);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Laboratoire delectronique', 15, 'materiel de laboratoire delectronique', 4);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Electrotechnique', 15, 'tbi + projecteur', 3);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Laboratoire delectrotechnique', 15, 'materiel de laboratoire delectrotechnique', 3);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Energie renouvelable', 15, 'tbi + projecteur', 3);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Securite generale', 15, 'projecteur', 3);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Genie chimique', 15, 'tbi + projecteur', 3);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Physique appliquee', 15, 'tbi + projecteur', 4);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Chimie 2', 15, 'tbi + projecteur', 4);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Biologie', 15, 'tbi', 4);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Electricite 2', 25, 'tbi', 4);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Exercices delectricites', 25, 'tbi + projecteur', 4);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Laboratoire delectricite', 25, 'materiel de laboratoire delectricite', 4);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Thermodynamique', 25, 'tbi + projecteur', 4);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Introduction a la mecanique des milieux continus', 25, 'tbi + projecteur', 5);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Resistance des materiaux', 12, 'tbi', 6);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Mathematique 3', 12, 'tbi + projecteur', 7);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Physique ondulatoire', 12, 'tbi + projecteur', 8);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Laboratoire de physique ondulatoire', 12, 'materiel de laboratoire de physique', 9);


#encodage des sessions a faire
insert into session (refIdEns)
values (5);
insert into session (refIdEns)
values (6);
insert into session (refIdEns)
values (10);
insert into session (refIdEns)
values (3);
insert into session (refIdEns)
values (9);
insert into session (refIdEns)
values (7);
insert into session (refIdEns)
values (11);
insert into session (refIdEns)
values (10);
insert into session (refIdEns)
values (8);
insert into session (refIdEns)
values (1);
insert into session (refIdEns)
values (9);
insert into session (refIdEns)
values (13);
insert into session (refIdEns)
values (10);
insert into session (refIdEns)
values (14);
insert into session (refIdEns)
values (8);
insert into session (refIdEns)
values (5);
insert into session (refIdEns)
values (1);
insert into session (refIdEns)
values (10);
insert into session (refIdEns)
values (2);
insert into session (refIdEns)
values (14);
insert into session (refIdEns)
values (4);
insert into session (refIdEns)
values (4);
insert into session (refIdEns)
values (12);
insert into session (refIdEns)
values (12);


#encodage des seances a faire
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 6, 1,1, 5);
insert into seance (numSeance, refHor, refIdEns,refSess,  refLoc)
values (1, 20, 4,2, 5);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 12, 2,3, 3);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 11, 3,4, 3);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 1, 7,1, 3);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 2, 1,2, 6);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 14, 2,3, 6);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 13, 2,4, 7);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 21, 2,5, 1);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 7, 3,6, 1);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 2, 3,7, 4);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 2, 3,8, 1);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 4, 1,1, 1);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 4, 2,3, 1);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 22, 4,2, 2);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 8, 4,3, 8);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 8, 5,4, 8);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 2, 5,5, 7);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 3, 5,6, 9);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 8, 5,1, 7);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 3, 6,3, 3);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 13, 7,2, 10);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 14, 7,4, 7);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 9, 8,1, 7);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 15, 8,9, 12);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 7, 9,11, 12);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 2, 10,12, 11);


#encodage des etudiants
insert into Etudiant (prenomEtu, nomEtu, matricule)
values ('Nassim', 'Giblet', '51161');
insert into Etudiant (prenomEtu, nomEtu, matricule)
values ('Mehdi', 'Mehdi', '51162');
insert into Etudiant (prenomEtu, nomEtu, matricule)
values ('Anissa', 'Anissa', '51163');
insert into Etudiant (prenomEtu, nomEtu, matricule)
values ('Younes', 'Younes', '51164');
insert into Etudiant (prenomEtu, nomEtu, matricule)
values ('Simon', 'Simon', '51165');
insert into Etudiant (prenomEtu, nomEtu, matricule)
values ('Antoine', 'Antoine', '51166');
insert into Etudiant (prenomEtu, nomEtu, matricule)
values ('Josh', 'Josh', '51167');
insert into Etudiant (prenomEtu, nomEtu, matricule)
values ('Chris ', 'Chris ', '51168');
insert into Etudiant (prenomEtu, nomEtu, matricule)
values ('Joe ', 'Joe ', '51169');
insert into Etudiant (prenomEtu, nomEtu, matricule)
values ('Aurian', 'Aurian', '51170');
insert into Etudiant (prenomEtu, nomEtu, matricule)
values ('Xavier', 'Xavier', '51171');


#encodage des cavpEtu a verifier
insert into cavp_etu (refcavp, refEtu)
values ('1', '9');
insert into cavp_etu (refcavp, refEtu)
values ('2', '4');
insert into cavp_etu (refcavp, refEtu)
values ('2', '2');
insert into cavp_etu (refcavp, refEtu)
values ('3', '11');
insert into cavp_etu (refcavp, refEtu)
values ('4', '7');
insert into cavp_etu (refcavp, refEtu)
values ('5', '5');
insert into cavp_etu (refcavp, refEtu)
values ('6', '8');
insert into cavp_etu (refcavp, refEtu)
values ('7', '1');
insert into cavp_etu (refcavp, refEtu)
values ('7', '10');
insert into cavp_etu (refcavp, refEtu)
values ('8', '6');
insert into cavp_etu (refcavp, refEtu)
values ('9', '3');


#encodage des cavp_ue a verifier
insert into cavp_ue (Refcavp, Refue)
values ('1', '1');
insert into cavp_ue (Refcavp, Refue)
values ('1', '2');
insert into cavp_ue (Refcavp, Refue)
values ('1', '3');
insert into cavp_ue (Refcavp, Refue)
values ('1', '4');
insert into cavp_ue (Refcavp, Refue)
values ('1', '5');
insert into cavp_ue (Refcavp, Refue)
values ('2', '1');
insert into cavp_ue (Refcavp, Refue)
values ('2', '2');
insert into cavp_ue (Refcavp, Refue)
values ('2', '3');
insert into cavp_ue (Refcavp, Refue)
values ('2', '4');
insert into cavp_ue (Refcavp, Refue)
values ('2', '6');
insert into cavp_ue (Refcavp, Refue)
values ('3', '1');
insert into cavp_ue (Refcavp, Refue)
values ('3', '2');
insert into cavp_ue (Refcavp, Refue)
values ('3', '3');
insert into cavp_ue (Refcavp, Refue)
values ('3', '4');
insert into cavp_ue (Refcavp, Refue)
values ('3', '7');
insert into cavp_ue (Refcavp, Refue)
values ('4', '1');
insert into cavp_ue (Refcavp, Refue)
values ('4', '2');
insert into cavp_ue (Refcavp, Refue)
values ('4', '3');
insert into cavp_ue (Refcavp, Refue)
values ('4', '4');
insert into cavp_ue (Refcavp, Refue)
values ('4', '8');
insert into cavp_ue (Refcavp, Refue)
values ('5', '1');
insert into cavp_ue (Refcavp, Refue)
values ('5', '2');
insert into cavp_ue (Refcavp, Refue)
values ('5', '3');
insert into cavp_ue (Refcavp, Refue)
values ('5', '4');
insert into cavp_ue (Refcavp, Refue)
values ('5', '9');
insert into cavp_ue (Refcavp, Refue)
values ('6', '1');
insert into cavp_ue (Refcavp, Refue)
values ('6', '2');
insert into cavp_ue (Refcavp, Refue)
values ('6', '3');
insert into cavp_ue (Refcavp, Refue)
values ('6', '4');
insert into cavp_ue (Refcavp, Refue)
values ('6', '10');
insert into cavp_ue (Refcavp, Refue)
values ('7', '1');
insert into cavp_ue (Refcavp, Refue)
values ('7', '2');
insert into cavp_ue (Refcavp, Refue)
values ('7', '3');
insert into cavp_ue (Refcavp, Refue)
values ('7', '4');
insert into cavp_ue (Refcavp, Refue)
values ('7', '11');


#encodage des ueCours
insert into ue_cours (Refue, RefCours)
values ('1', '1');
insert into ue_cours (Refue, RefCours)
values ('2', '2');
insert into ue_cours (Refue, RefCours)
values ('2', '3');
insert into ue_cours (Refue, RefCours)
values ('2', '4');
insert into ue_cours (Refue, RefCours)
values ('3', '5');
insert into ue_cours (Refue, RefCours)
values ('3', '6');
insert into ue_cours (Refue, RefCours)
values ('3', '7');
insert into ue_cours (Refue, RefCours)
values ('3', '8');
insert into ue_cours (Refue, RefCours)
values ('4', '9');
insert into ue_cours (Refue, RefCours)
values ('4', '10');
insert into ue_cours (Refue, RefCours)
values ('4', '11');
insert into ue_cours (Refue, RefCours)
values ('5', '12');
insert into ue_cours (Refue, RefCours)
values ('6', '13');
insert into ue_cours (Refue, RefCours)
values ('7', '14');
insert into ue_cours (Refue, RefCours)
values ('8', '15');
insert into ue_cours (Refue, RefCours)
values ('8', '16');
insert into ue_cours (Refue, RefCours)
values ('9', '17');
insert into ue_cours (Refue, RefCours)
values ('9', '18');
insert into ue_cours (Refue, RefCours)
values ('9', '19');
insert into ue_cours (Refue, RefCours)
values ('10', '20');
insert into ue_cours (Refue, RefCours)
values ('10', '21');
insert into ue_cours (Refue, RefCours)
values ('10', '22');
insert into ue_cours (Refue, RefCours)
values ('11', '23');
insert into ue_cours (Refue, RefCours)
values ('11', '24');
insert into ue_cours (Refue, RefCours)
values ('11', '25');


#encodage des sessionsCours a faire
insert into session_cours (refCours, refSess)
values ('1', '1');
insert into session_cours (refCours, refSess)
values ('2', '2');
insert into session_cours (refCours, refSess)
values ('3', '3');
insert into session_cours (refCours, refSess)
values ('4', '4');
insert into session_cours (refCours, refSess)
values ('5', '19');
insert into session_cours (refCours, refSess)
values ('5', '20');
insert into session_cours (refCours, refSess)
values ('6', '21');
insert into session_cours (refCours, refSess)
values ('6', '22');
insert into session_cours (refCours, refSess)
values ('7', '5');
insert into session_cours (refCours, refSess)
values ('8', '6');
insert into session_cours (refCours, refSess)
values ('9', '7');
insert into session_cours (refCours, refSess)
values ('10', '8');
insert into session_cours (refCours, refSess)
values ('11', '9');
insert into session_cours (refCours, refSess)
values ('12', '10');
insert into session_cours (refCours, refSess)
values ('13', '23');
insert into session_cours (refCours, refSess)
values ('13', '24');
insert into session_cours (refCours, refSess)
values ('14', '5');
insert into session_cours (refCours, refSess)
values ('14', '6');
insert into session_cours (refCours, refSess)
values ('15', '11');
insert into session_cours (refCours, refSess)
values ('16', '12');
insert into session_cours (refCours, refSess)
values ('17', '13');
insert into session_cours (refCours, refSess)
values ('18', '14');
insert into session_cours (refCours, refSess)
values ('19', '15');
insert into session_cours (refCours, refSess)
values ('20', '16');
insert into session_cours (refCours, refSess)
values ('21', '17');
insert into session_cours (refCours, refSess)
values ('22', '18');


#encodage des sessSeances a faire
insert into session_seance (refSess, refSeance)
values ('1', '1');
insert into session_seance (refSess, refSeance)
values ('2', '2');
insert into session_seance (refSess, refSeance)
values ('3', '3');
insert into session_seance (refSess, refSeance)
values ('4', '4');
insert into session_seance (refSess, refSeance)
values ('5', '5');
insert into session_seance (refSess, refSeance)
values ('6', '6');
insert into session_seance (refSess, refSeance)
values ('6', '7');
insert into session_seance (refSess, refSeance)
values ('7', '8');
insert into session_seance (refSess, refSeance)
values ('8', '9');
insert into session_seance (refSess, refSeance)
values ('8', '10');
insert into session_seance (refSess, refSeance)
values ('9', '11');
insert into session_seance (refSess, refSeance)
values ('10', '12');
insert into session_seance (refSess, refSeance)
values ('11', '18');
insert into session_seance (refSess, refSeance)
values ('12', '19');
insert into session_seance (refSess, refSeance)
values ('13', '20');
insert into session_seance (refSess, refSeance)
values ('14', '21');
insert into session_seance (refSess, refSeance)
values ('15', '22');
insert into session_seance (refSess, refSeance)
values ('16', '23');
insert into session_seance (refSess, refSeance)
values ('16', '24');
insert into session_seance (refSess, refSeance)
values ('17', '25');
insert into session_seance (refSess, refSeance)
values ('17', '26');
insert into session_seance (refSess, refSeance)
values ('18', '27');
insert into session_seance (refSess, refSeance)
values ('19', '13');
insert into session_seance (refSess, refSeance)
values ('20', '14');
insert into session_seance (refSess, refSeance)
values ('21', '15');
insert into session_seance (refSess, refSeance)
values ('23', '16');
insert into session_seance (refSess, refSeance)
values ('5', '17');


#encodage des sessEtu a faire
insert into session_etu (refSess, refEtu)
values ('1', '1');
insert into session_etu (refSess, refEtu)
values ('1', '2');
insert into session_etu (refSess, refEtu)
values ('1', '4');
insert into session_etu (refSess, refEtu)
values ('1', '5');
insert into session_etu (refSess, refEtu)
values ('1', '6');
insert into session_etu (refSess, refEtu)
values ('1', '8');
insert into session_etu (refSess, refEtu)
values ('1', '9');
insert into session_etu (refSess, refEtu)
values ('2', '1');
insert into session_etu (refSess, refEtu)
values ('2', '2');
insert into session_etu (refSess, refEtu)
values ('2', '3');
insert into session_etu (refSess, refEtu)
values ('2', '4');
insert into session_etu (refSess, refEtu)
values ('2', '5');
insert into session_etu (refSess, refEtu)
values ('2', '6');
insert into session_etu (refSess, refEtu)
values ('2', '8');
insert into session_etu (refSess, refEtu)
values ('2', '9');
insert into session_etu (refSess, refEtu)
values ('3', '1');
insert into session_etu (refSess, refEtu)
values ('3', '2');
insert into session_etu (refSess, refEtu)
values ('3', '4');
insert into session_etu (refSess, refEtu)
values ('3', '5');
insert into session_etu (refSess, refEtu)
values ('3', '6');
insert into session_etu (refSess, refEtu)
values ('3', '8');
insert into session_etu (refSess, refEtu)
values ('3', '9');
insert into session_etu (refSess, refEtu)
values ('4', '1');
insert into session_etu (refSess, refEtu)
values ('4', '2');
insert into session_etu (refSess, refEtu)
values ('4', '4');
insert into session_etu (refSess, refEtu)
values ('4', '5');
insert into session_etu (refSess, refEtu)
values ('4', '6');
insert into session_etu (refSess, refEtu)
values ('4', '8');
insert into session_etu (refSess, refEtu)
values ('4', '9');
insert into session_etu (refSess, refEtu)
values ('5', '5');
insert into session_etu (refSess, refEtu)
values ('5', '4');
insert into session_etu (refSess, refEtu)
values ('6', '6');
insert into session_etu (refSess, refEtu)
values ('6', '3');
insert into session_etu (refSess, refEtu)
values ('7', '6');
insert into session_etu (refSess, refEtu)
values ('7', '3');
insert into session_etu (refSess, refEtu)
values ('8', '2');
insert into session_etu (refSess, refEtu)
values ('8', '1');
insert into session_etu (refSess, refEtu)
values ('9', '8');
insert into session_etu (refSess, refEtu)
values ('9', '9');
insert into session_etu (refSess, refEtu)
values ('10', '8');
insert into session_etu (refSess, refEtu)
values ('10', '9');
insert into session_etu (refSess, refEtu)
values ('11', '7');
insert into session_etu (refSess, refEtu)
values ('12', '7');
insert into session_etu (refSess, refEtu)
values ('12', '1');
insert into session_etu (refSess, refEtu)
values ('13', '7');
insert into session_etu (refSess, refEtu)
values ('13', '1');
insert into session_etu (refSess, refEtu)
values ('14', '7');
insert into session_etu (refSess, refEtu)
values ('14', '3');
insert into session_etu (refSess, refEtu)
values ('15', '7');
insert into session_etu (refSess, refEtu)
values ('15', '3');
insert into session_etu (refSess, refEtu)
values ('16', '7');
insert into session_etu (refSess, refEtu)
values ('16', '3');
insert into session_etu (refSess, refEtu)
values ('16', '1');
insert into session_etu (refSess, refEtu)
values ('17', '7');
insert into session_etu (refSess, refEtu)
values ('17', '3');
insert into session_etu (refSess, refEtu)
values ('18', '7');
insert into session_etu (refSess, refEtu)
values ('18', '3');
insert into session_etu (refSess, refEtu)
values ('18', '1');
insert into session_etu (refSess, refEtu)
values ('19', '5');
insert into session_etu (refSess, refEtu)
values ('19', '4');
insert into session_etu (refSess, refEtu)
values ('20', '2');
insert into session_etu (refSess, refEtu)
values ('20', '6');
insert into session_etu (refSess, refEtu)
values ('20', '1');
insert into session_etu (refSess, refEtu)
values ('21', '5');
insert into session_etu (refSess, refEtu)
values ('21', '4');
insert into session_etu (refSess, refEtu)
values ('23', '1');
insert into session_etu (refSess, refEtu)
values ('23', '6');
insert into session_etu (refSess, refEtu)
values ('23', '2');
insert into session_etu (refSess, refEtu)
values ('5', '8');
insert into session_etu (refSess, refEtu)
values ('5', '9');

insert into indisponibilite (IdHor, IdEns, raison)
values (1,1,'malade');
insert into indisponibilite (IdHor, IdEns, raison)
values (1,1,'malade');
insert into indisponibilite (IdHor, IdEns, raison)
values (2,1,'malade');
insert into indisponibilite (IdHor, IdEns, raison)
values (2,6,'congés');
insert into indisponibilite (IdHor, IdEns, raison)
values (1,7,'congés');
insert into indisponibilite (IdHor, IdEns, raison)
values (5,2,'congés');
insert into indisponibilite (IdHor, IdEns, raison)
values (8,3,'accident');
insert into indisponibilite (IdHor, IdEns, raison)
values (3,9,'accident');
insert into indisponibilite (IdHor, IdEns, raison)
values (3,8,'accident');
insert into indisponibilite (IdHor, IdEns, raison)
values (7,11,'accident');
insert into indisponibilite (IdHor, IdEns, raison)
values (23,3,'accident');
insert into indisponibilite (IdHor, IdEns, raison)
values (12,14,'accident');
insert into indisponibilite (IdHor, IdEns, raison)
values (15,11,'greves');
insert into indisponibilite (IdHor, IdEns, raison)
values (6,6,'greves');
insert into indisponibilite (IdHor, IdEns, raison)
values (17,5,'greves');
insert into indisponibilite (IdHor, IdEns, raison)
values (26,4,'greves');
insert into indisponibilite (IdHor, IdEns, raison)
values (23,11,'greves');
insert into indisponibilite (IdHor, IdEns, raison)
values (4,8,'greves');
insert into indisponibilite (IdHor, IdEns, raison)
values (16,1,'greves');
insert into indisponibilite (IdHor, IdEns, raison)
values (12,4,'greves');
insert into indisponibilite (IdHor, IdEns, raison)
values (7,7,'greves');
insert into indisponibilite (IdHor, IdEns, raison)
values (3,3,'rendez- vous hopital');
insert into indisponibilite (IdHor, IdEns, raison)
values (12,2,'rendez- vous hopital');
insert into indisponibilite (IdHor, IdEns, raison)
values (11,5,'rendez- vous hopital');
insert into indisponibilite (IdHor, IdEns, raison)
values (6,11,'reunion');
insert into indisponibilite (IdHor, IdEns, raison)
values (3,3,'reunion');
insert into indisponibilite (IdHor, IdEns, raison)
values (2,3,'reunion');
insert into indisponibilite (IdHor, IdEns, raison)
values (3,5,'reunion');

######################################################
#vue horaire enseigant
create view vue_horaire_prof
as
select enseignant.nomEns,
       cours.intitule,
       seance.numSeance,
       local.nomLoc,
       local.nomSite,
       horaire.heureDebut,
       horaire.heureFin,
       session.IdSess as session,
       horaire.idHor

from seance
         inner join enseignant on seance.refIdEns = enseignant.idEns
         inner join cours on idEns = cours.RefIdEns
         inner join local on seance.RefLoc = local.idLoc
         inner join horaire on horaire.idHor = seance.refHor
         inner join session on session.IdSess = seance.refSess;

# creation base de donnee
drop database if exists horaireDB;
create database horaireDB;


# utilisation bd
use horaireDB;

# creation des tables

create table horaire
(
    idHor      integer   not null primary key auto_increment,
    heureDebut timestamp not null,
    heureFin   timestamp not null
        check (heureFin > heureDebut)
);

create table etudiant
(
    idEtu     integer     not null primary key auto_increment,
    matricule integer     not null unique,
    prenomEtu varchar(50),
    nomEtu    varchar(50) not null
);

create table enseignant
(
    idEns        integer     not null primary key auto_increment,
    prenomEns    varchar(50),
    nomEns       varchar(50) not null,
    telephoneEns varchar(50),
    emailEns     varchar(50) unique
);

create table indisponibilite
(
    IdIndispo integer not null primary key auto_increment,
    IdHor     integer not null,
    IdEns     integer not null,
    raison    varchar(250),
    foreign key (IdEns) references enseignant (IdEns),
    foreign key (IdHor) references horaire (Idhor)
);

create table local
(
    idLoc      integer     not null primary key auto_increment,
    nomSite    varchar(50),
    nomLoc     varchar(50) not null,
    nbPlaces   integer     not null,
    tbi        boolean,
    sallePC    boolean,
    projecteur boolean
);



create table cavp
(
    idcavp integer not null primary key auto_increment,
    nbrue  integer not null
);

create table ue
(
    Idue      integer     not null primary key auto_increment,
    nomue     varchar(50) not null,
    nbrCours  integer     not null,
    nbrCredit integer     not null
);

create table cours
(
    IdCours     integer      not null primary key auto_increment,
    intitule    varchar(250) NOT NULL,
    nbEtudiants integer      not null,
    materiel    varchar(100) not null,
    RefIdEns    integer      not null,
    foreign key (RefIdEns) references Enseignant (IdEns)

);

create table session
(
    IdSess   integer not null primary key auto_increment,
    nomSess  varchar(50),
    RefIdEns integer not null,
    foreign key (RefIdEns) references Enseignant (IdEns)
);

create table seance
(
    IdSeance  integer not null primary key auto_increment,
    numSeance integer not null,
    refHor    integer not null,
    RefLoc    integer not null,
    refIdEns  integer not null,
    refSess   integer NOT NULL,
    foreign key (refSess) references session (idSess),
    foreign key (refIdEns) references enseignant (idEns),
    foreign key (refHor) references horaire (idHor),
    foreign key (refLoc) references local (idLoc)
);


create table cavp_etu
(
    idLienCE integer not null primary key auto_increment,
    refEtu   integer not null,
    refcavp  integer not null,
    foreign key (refcavp) references cavp (idcavp),
    foreign key (refEtu) references etudiant (idEtu)
);

create table cavp_ue
(
    idLienCU integer not null primary key auto_increment,
    refue    integer not null,
    refcavp  integer not null,
    foreign key (refcavp) references cavp (idcavp),
    foreign key (refue) references ue (idue)
);

create table ue_cours
(
    IdueCours integer not null primary key auto_increment,
    Refue     integer not null,
    RefCours  integer not null,
    foreign key (RefCours) references cours (IdCours),
    foreign key (Refue) references ue (Idue)
);

create table session_cours
(
    idSessCours integer not null primary key auto_increment,
    refCours    integer not null,
    refSess     integer NOT NULL,
    foreign key (refSess) references session (idSess),
    foreign key (refCours) references cours (idcours)

);


create table session_seance
(
    idSessSeance integer not null primary key auto_increment,
    refSess      integer NOT NULL,
    refSeance    integer not null,
    foreign key (refSeance) references seance (idSeance),
    foreign key (refSess) references session (idSess)
);

create table session_etu
(
    idsession_etu integer not null primary key auto_increment,
    refSess       integer NOT NULL,
    refEtu        integer not null,
    foreign key (refEtu) references etudiant (idEtu),
    foreign key (refSess) references session (idSess)
);



# insertion dans la base de donnee

#encodage des horaires
insert into Horaire (heureDebut, heureFin)
values ('2019-08-07 08:00:00', '2020-01-23 10:00:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-07 10:30:00', '2020-01-23 12:30:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-07 13:40:00', '2020-01-23 15:40:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-07 16:00:00', '2020-02-23 18:00:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-08 08:00:00', '2020-02-24 10:00:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-08 10:30:00', '2020-02-24 12:30:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-08 13:40:00', '2020-04-24 15:40:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-08 16:00:00', '2020-04-24 18:00:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-09 08:00:00', '2020-06-30 10:00:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-09 10:30:00', '2020-06-30 12:30:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-09 13:40:00', '2020-06-30 15:40:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-09 16:00:00', '2020-01-30 18:00:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-10 08:00:00', '2020-01-26 10:00:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-10 10:30:00', '2020-01-26 12:30:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-10 13:40:00', '2020-05-26 15:40:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-10 16:00:00', '2020-05-26 18:00:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-11 08:00:00', '2020-06-27 10:00:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-11 10:30:00', '2020-06-27 12:30:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-11 13:40:00', '2020-06-27 15:40:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-11 16:00:00', '2020-05-27 18:00:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-07 08:00:00', '2020-02-23 12:30:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-07 13:40:00', '2020-02-23 18:00:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-08 08:00:00', '2020-09-24 12:30:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-08 13:40:00', '2020-09-24 18:00:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-09 08:00:00', '2020-03-30 12:30:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-09 13:40:00', '2020-03-30 18:00:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-10 08:00:00', '2020-01-26 12:30:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-10 13:40:00', '2020-01-26 18:00:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-11 08:00:00', '2020-02-27 12:30:00');
insert into Horaire (heureDebut, heureFin)
values ('2019-08-11 13:40:00', '2020-02-27 18:00:00');


#encodage des locaux
insert into local (nomSite, nomLoc, nbPlaces, tbi, sallePC, projecteur)
values ('Royal', 'R301', 20, false, false, true);
insert into local (nomSite, nomLoc, nbPlaces, tbi, sallePC, projecteur)
values ('Royal', 'R302', 20, true, false, true);
insert into local (nomSite, nomLoc, nbPlaces, tbi, sallePC, projecteur)
values ('Royal', 'R305', 20, true, true, true);
insert into local (nomSite, nomLoc, nbPlaces, tbi, sallePC, projecteur)
values ('Royal', 'R101', 16, true, false, false);
insert into local (nomSite, nomLoc, nbPlaces, tbi, sallePC, projecteur)
values ('Royal', 'R102', 16, true, true, true);
insert into local (nomSite, nomLoc, nbPlaces, tbi, sallePC, projecteur)
values ('Royal', 'R216', 12, true, false, true);
insert into local (nomSite, nomLoc, nbPlaces, tbi, sallePC, projecteur)
values ('Goujons', 'MC105', 12, true, false, false);
insert into local (nomSite, nomLoc, nbPlaces, tbi, sallePC, projecteur)
values ('Goujons', 'MD020', 30, false, false, true);
insert into local (nomSite, nomLoc, nbPlaces, tbi, sallePC, projecteur)
values ('Goujons', 'MC007', 10, true, false, true);
insert into local (nomSite, nomLoc, nbPlaces, tbi, sallePC, projecteur)
values ('Goujons', 'MC213', 20, true, false, false);
insert into local (nomSite, nomLoc, nbPlaces, tbi, sallePC, projecteur)
values ('Goujons', 'MC205', 16, true, false, true);
insert into local (nomSite, nomLoc, nbPlaces, tbi, sallePC, projecteur)
values ('Goujons', 'MC107', 12, true, false, true);


#encodage des profs
insert into Enseignant (nomEns)
values ('Bernard');
insert into Enseignant (nomEns)
values ('Haerlingen');
insert into Enseignant (nomEns)
values ('Humblet');
insert into Enseignant (nomEns)
values ('Levaillant');
insert into Enseignant (nomEns)
values ('Bernard');
insert into Enseignant (nomEns)
values ('Mattens');
insert into Enseignant (nomEns)
values ('Grobet');
insert into Enseignant (nomEns)
values ('Vanbuylaere');
insert into Enseignant (nomEns)
values ('Baiboun');
insert into Enseignant (nomEns)
values ('Gerardy');
insert into Enseignant (nomEns)
values ('Vanderschuren');
insert into Enseignant (nomEns)
values ('Classens');
insert into Enseignant (nomEns)
values ('Botin');
insert into Enseignant (nomEns)
values ('Vandencruyce');


#encodage des cavp
insert into cavp (nbrue)
values ('5');
insert into cavp (nbrue)
values ('5');
insert into cavp (nbrue)
values ('5');
insert into cavp (nbrue)
values ('5');
insert into cavp (nbrue)
values ('5');
insert into cavp (nbrue)
values ('5');
insert into cavp (nbrue)
values ('5');
insert into cavp (nbrue)
values ('6');
insert into cavp (nbrue)
values ('6');
insert into cavp (nbrue)
values ('7');
insert into cavp (nbrue)
values ('8');


#encodage des ue
insert into ue (nomue, nbrCours, nbrCredit)
values ('Gestion', 1, 5);
insert into ue (nomue, nbrCours, nbrCredit)
values ('Mécanique & thermodynamique appliquees', 3, 5);
insert into ue (nomue, nbrCours, nbrCredit)
values ('Electronique & Informatique 3', 4, 5);
insert into ue (nomue, nbrCours, nbrCredit)
values ('Electrotechnique', 3, 5);
insert into ue (nomue, nbrCours, nbrCredit)
values ('Fabrication Mecanique', 1, 5);
insert into ue (nomue, nbrCours, nbrCredit)
values ('Génie chimie', 1, 5);
insert into ue (nomue, nbrCours, nbrCredit)
values ('Physique appliquee', 1, 5);
insert into ue (nomue, nbrCours, nbrCredit)
values ('Chimie 2', 2, 5);
insert into ue (nomue, nbrCours, nbrCredit)
values ('Electricité II', 3, 2);
insert into ue (nomue, nbrCours, nbrCredit)
values ('Mécanique des milieux continus', 3, 4);
insert into ue (nomue, nbrCours, nbrCredit)
values ('Mathematique et informatique', 3, 4);


#encodage des activites d'aprentissage
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Gestion', 20, 'tbi', 1);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Mecanique & thermodynamique appliquees', 20, 'tbi + projecteur', 1);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Laboratoire de mecanique & thermodynamique appliquees', 20, 'materiel de laboratoire de mecanique', 2);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Exercice de mecanique & thermodynamique appliquees', 20, 'tbi + projecteur', 2);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Electronique', 20, 'projecteur', 3);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Electronique de puissance', 20, 'tbi', 3);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Laboratoire dinformatique 3', 15, 'tbi + sallePC + projecteur', 3);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Laboratoire delectronique', 15, 'materiel de laboratoire delectronique', 4);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Electrotechnique', 15, 'tbi + projecteur', 3);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Laboratoire delectrotechnique', 15, 'materiel de laboratoire delectrotechnique', 3);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Energie renouvelable', 15, 'tbi + projecteur', 3);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Securite generale', 15, 'projecteur', 3);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Genie chimique', 15, 'tbi + projecteur', 3);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Physique appliquee', 15, 'tbi + projecteur', 4);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Chimie 2', 15, 'tbi + projecteur', 4);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Biologie', 15, 'tbi', 4);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Electricite 2', 25, 'tbi', 4);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Exercices delectricites', 25, 'tbi + projecteur', 4);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Laboratoire delectricite', 25, 'materiel de laboratoire delectricite', 4);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Thermodynamique', 25, 'tbi + projecteur', 4);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Introduction a la mecanique des milieux continus', 25, 'tbi + projecteur', 5);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Resistance des materiaux', 12, 'tbi', 6);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Mathematique 3', 12, 'tbi + projecteur', 7);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Physique ondulatoire', 12, 'tbi + projecteur', 8);
insert into Cours (intitule, nbEtudiants, materiel, RefIdEns)
values ('Laboratoire de physique ondulatoire', 12, 'materiel de laboratoire de physique', 9);


#encodage des sessions a faire
insert into session (refIdEns)
values (5);
insert into session (refIdEns)
values (6);
insert into session (refIdEns)
values (10);
insert into session (refIdEns)
values (3);
insert into session (refIdEns)
values (9);
insert into session (refIdEns)
values (7);
insert into session (refIdEns)
values (11);
insert into session (refIdEns)
values (10);
insert into session (refIdEns)
values (8);
insert into session (refIdEns)
values (1);
insert into session (refIdEns)
values (9);
insert into session (refIdEns)
values (13);
insert into session (refIdEns)
values (10);
insert into session (refIdEns)
values (14);
insert into session (refIdEns)
values (8);
insert into session (refIdEns)
values (5);
insert into session (refIdEns)
values (1);
insert into session (refIdEns)
values (10);
insert into session (refIdEns)
values (2);
insert into session (refIdEns)
values (14);
insert into session (refIdEns)
values (4);
insert into session (refIdEns)
values (4);
insert into session (refIdEns)
values (12);
insert into session (refIdEns)
values (12);


#encodage des seances a faire
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 6, 1,1, 5);
insert into seance (numSeance, refHor, refIdEns,refSess,  refLoc)
values (1, 20, 4,2, 5);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 12, 2,3, 3);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 11, 3,4, 3);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 1, 7,1, 3);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 2, 1,2, 6);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 14, 2,3, 6);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 13, 2,4, 7);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 21, 2,5, 1);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 7, 3,6, 1);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 2, 3,7, 4);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 2, 3,8, 1);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 4, 1,1, 1);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 4, 2,3, 1);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 22, 4,2, 2);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 8, 4,3, 8);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 8, 5,4, 8);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 2, 5,5, 7);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 3, 5,6, 9);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 8, 5,1, 7);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 3, 6,3, 3);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 13, 7,2, 10);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 14, 7,4, 7);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 9, 8,1, 7);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 15, 8,9, 12);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 7, 9,11, 12);
insert into seance (numSeance, refHor, refIdEns,refSess, refLoc)
values (1, 2, 10,12, 11);


#encodage des etudiants
insert into Etudiant (prenomEtu, nomEtu, matricule)
values ('Nassim', 'Giblet', '51161');
insert into Etudiant (prenomEtu, nomEtu, matricule)
values ('Mehdi', 'Mehdi', '51162');
insert into Etudiant (prenomEtu, nomEtu, matricule)
values ('Anissa', 'Anissa', '51163');
insert into Etudiant (prenomEtu, nomEtu, matricule)
values ('Younes', 'Younes', '51164');
insert into Etudiant (prenomEtu, nomEtu, matricule)
values ('Simon', 'Simon', '51165');
insert into Etudiant (prenomEtu, nomEtu, matricule)
values ('Antoine', 'Antoine', '51166');
insert into Etudiant (prenomEtu, nomEtu, matricule)
values ('Josh', 'Josh', '51167');
insert into Etudiant (prenomEtu, nomEtu, matricule)
values ('Chris ', 'Chris ', '51168');
insert into Etudiant (prenomEtu, nomEtu, matricule)
values ('Joe ', 'Joe ', '51169');
insert into Etudiant (prenomEtu, nomEtu, matricule)
values ('Aurian', 'Aurian', '51170');
insert into Etudiant (prenomEtu, nomEtu, matricule)
values ('Xavier', 'Xavier', '51171');


#encodage des cavpEtu a verifier
insert into cavp_etu (refcavp, refEtu)
values ('1', '9');
insert into cavp_etu (refcavp, refEtu)
values ('2', '4');
insert into cavp_etu (refcavp, refEtu)
values ('2', '2');
insert into cavp_etu (refcavp, refEtu)
values ('3', '11');
insert into cavp_etu (refcavp, refEtu)
values ('4', '7');
insert into cavp_etu (refcavp, refEtu)
values ('5', '5');
insert into cavp_etu (refcavp, refEtu)
values ('6', '8');
insert into cavp_etu (refcavp, refEtu)
values ('7', '1');
insert into cavp_etu (refcavp, refEtu)
values ('7', '10');
insert into cavp_etu (refcavp, refEtu)
values ('8', '6');
insert into cavp_etu (refcavp, refEtu)
values ('9', '3');


#encodage des cavp_ue a verifier
insert into cavp_ue (Refcavp, Refue)
values ('1', '1');
insert into cavp_ue (Refcavp, Refue)
values ('1', '2');
insert into cavp_ue (Refcavp, Refue)
values ('1', '3');
insert into cavp_ue (Refcavp, Refue)
values ('1', '4');
insert into cavp_ue (Refcavp, Refue)
values ('1', '5');
insert into cavp_ue (Refcavp, Refue)
values ('2', '1');
insert into cavp_ue (Refcavp, Refue)
values ('2', '2');
insert into cavp_ue (Refcavp, Refue)
values ('2', '3');
insert into cavp_ue (Refcavp, Refue)
values ('2', '4');
insert into cavp_ue (Refcavp, Refue)
values ('2', '6');
insert into cavp_ue (Refcavp, Refue)
values ('3', '1');
insert into cavp_ue (Refcavp, Refue)
values ('3', '2');
insert into cavp_ue (Refcavp, Refue)
values ('3', '3');
insert into cavp_ue (Refcavp, Refue)
values ('3', '4');
insert into cavp_ue (Refcavp, Refue)
values ('3', '7');
insert into cavp_ue (Refcavp, Refue)
values ('4', '1');
insert into cavp_ue (Refcavp, Refue)
values ('4', '2');
insert into cavp_ue (Refcavp, Refue)
values ('4', '3');
insert into cavp_ue (Refcavp, Refue)
values ('4', '4');
insert into cavp_ue (Refcavp, Refue)
values ('4', '8');
insert into cavp_ue (Refcavp, Refue)
values ('5', '1');
insert into cavp_ue (Refcavp, Refue)
values ('5', '2');
insert into cavp_ue (Refcavp, Refue)
values ('5', '3');
insert into cavp_ue (Refcavp, Refue)
values ('5', '4');
insert into cavp_ue (Refcavp, Refue)
values ('5', '9');
insert into cavp_ue (Refcavp, Refue)
values ('6', '1');
insert into cavp_ue (Refcavp, Refue)
values ('6', '2');
insert into cavp_ue (Refcavp, Refue)
values ('6', '3');
insert into cavp_ue (Refcavp, Refue)
values ('6', '4');
insert into cavp_ue (Refcavp, Refue)
values ('6', '10');
insert into cavp_ue (Refcavp, Refue)
values ('7', '1');
insert into cavp_ue (Refcavp, Refue)
values ('7', '2');
insert into cavp_ue (Refcavp, Refue)
values ('7', '3');
insert into cavp_ue (Refcavp, Refue)
values ('7', '4');
insert into cavp_ue (Refcavp, Refue)
values ('7', '11');


#encodage des ueCours
insert into ue_cours (Refue, RefCours)
values ('1', '1');
insert into ue_cours (Refue, RefCours)
values ('2', '2');
insert into ue_cours (Refue, RefCours)
values ('2', '3');
insert into ue_cours (Refue, RefCours)
values ('2', '4');
insert into ue_cours (Refue, RefCours)
values ('3', '5');
insert into ue_cours (Refue, RefCours)
values ('3', '6');
insert into ue_cours (Refue, RefCours)
values ('3', '7');
insert into ue_cours (Refue, RefCours)
values ('3', '8');
insert into ue_cours (Refue, RefCours)
values ('4', '9');
insert into ue_cours (Refue, RefCours)
values ('4', '10');
insert into ue_cours (Refue, RefCours)
values ('4', '11');
insert into ue_cours (Refue, RefCours)
values ('5', '12');
insert into ue_cours (Refue, RefCours)
values ('6', '13');
insert into ue_cours (Refue, RefCours)
values ('7', '14');
insert into ue_cours (Refue, RefCours)
values ('8', '15');
insert into ue_cours (Refue, RefCours)
values ('8', '16');
insert into ue_cours (Refue, RefCours)
values ('9', '17');
insert into ue_cours (Refue, RefCours)
values ('9', '18');
insert into ue_cours (Refue, RefCours)
values ('9', '19');
insert into ue_cours (Refue, RefCours)
values ('10', '20');
insert into ue_cours (Refue, RefCours)
values ('10', '21');
insert into ue_cours (Refue, RefCours)
values ('10', '22');
insert into ue_cours (Refue, RefCours)
values ('11', '23');
insert into ue_cours (Refue, RefCours)
values ('11', '24');
insert into ue_cours (Refue, RefCours)
values ('11', '25');


#encodage des sessionsCours a faire
insert into session_cours (refCours, refSess)
values ('1', '1');
insert into session_cours (refCours, refSess)
values ('2', '2');
insert into session_cours (refCours, refSess)
values ('3', '3');
insert into session_cours (refCours, refSess)
values ('4', '4');
insert into session_cours (refCours, refSess)
values ('5', '19');
insert into session_cours (refCours, refSess)
values ('5', '20');
insert into session_cours (refCours, refSess)
values ('6', '21');
insert into session_cours (refCours, refSess)
values ('6', '22');
insert into session_cours (refCours, refSess)
values ('7', '5');
insert into session_cours (refCours, refSess)
values ('8', '6');
insert into session_cours (refCours, refSess)
values ('9', '7');
insert into session_cours (refCours, refSess)
values ('10', '8');
insert into session_cours (refCours, refSess)
values ('11', '9');
insert into session_cours (refCours, refSess)
values ('12', '10');
insert into session_cours (refCours, refSess)
values ('13', '23');
insert into session_cours (refCours, refSess)
values ('13', '24');
insert into session_cours (refCours, refSess)
values ('14', '5');
insert into session_cours (refCours, refSess)
values ('14', '6');
insert into session_cours (refCours, refSess)
values ('15', '11');
insert into session_cours (refCours, refSess)
values ('16', '12');
insert into session_cours (refCours, refSess)
values ('17', '13');
insert into session_cours (refCours, refSess)
values ('18', '14');
insert into session_cours (refCours, refSess)
values ('19', '15');
insert into session_cours (refCours, refSess)
values ('20', '16');
insert into session_cours (refCours, refSess)
values ('21', '17');
insert into session_cours (refCours, refSess)
values ('22', '18');


#encodage des sessSeances a faire
insert into session_seance (refSess, refSeance)
values ('1', '1');
insert into session_seance (refSess, refSeance)
values ('2', '2');
insert into session_seance (refSess, refSeance)
values ('3', '3');
insert into session_seance (refSess, refSeance)
values ('4', '4');
insert into session_seance (refSess, refSeance)
values ('5', '5');
insert into session_seance (refSess, refSeance)
values ('6', '6');
insert into session_seance (refSess, refSeance)
values ('6', '7');
insert into session_seance (refSess, refSeance)
values ('7', '8');
insert into session_seance (refSess, refSeance)
values ('8', '9');
insert into session_seance (refSess, refSeance)
values ('8', '10');
insert into session_seance (refSess, refSeance)
values ('9', '11');
insert into session_seance (refSess, refSeance)
values ('10', '12');
insert into session_seance (refSess, refSeance)
values ('11', '18');
insert into session_seance (refSess, refSeance)
values ('12', '19');
insert into session_seance (refSess, refSeance)
values ('13', '20');
insert into session_seance (refSess, refSeance)
values ('14', '21');
insert into session_seance (refSess, refSeance)
values ('15', '22');
insert into session_seance (refSess, refSeance)
values ('16', '23');
insert into session_seance (refSess, refSeance)
values ('16', '24');
insert into session_seance (refSess, refSeance)
values ('17', '25');
insert into session_seance (refSess, refSeance)
values ('17', '26');
insert into session_seance (refSess, refSeance)
values ('18', '27');
insert into session_seance (refSess, refSeance)
values ('19', '13');
insert into session_seance (refSess, refSeance)
values ('20', '14');
insert into session_seance (refSess, refSeance)
values ('21', '15');
insert into session_seance (refSess, refSeance)
values ('23', '16');
insert into session_seance (refSess, refSeance)
values ('5', '17');


#encodage des sessEtu a faire
insert into session_etu (refSess, refEtu)
values ('1', '1');
insert into session_etu (refSess, refEtu)
values ('1', '2');
insert into session_etu (refSess, refEtu)
values ('1', '4');
insert into session_etu (refSess, refEtu)
values ('1', '5');
insert into session_etu (refSess, refEtu)
values ('1', '6');
insert into session_etu (refSess, refEtu)
values ('1', '8');
insert into session_etu (refSess, refEtu)
values ('1', '9');
insert into session_etu (refSess, refEtu)
values ('2', '1');
insert into session_etu (refSess, refEtu)
values ('2', '2');
insert into session_etu (refSess, refEtu)
values ('2', '3');
insert into session_etu (refSess, refEtu)
values ('2', '4');
insert into session_etu (refSess, refEtu)
values ('2', '5');
insert into session_etu (refSess, refEtu)
values ('2', '6');
insert into session_etu (refSess, refEtu)
values ('2', '8');
insert into session_etu (refSess, refEtu)
values ('2', '9');
insert into session_etu (refSess, refEtu)
values ('3', '1');
insert into session_etu (refSess, refEtu)
values ('3', '2');
insert into session_etu (refSess, refEtu)
values ('3', '4');
insert into session_etu (refSess, refEtu)
values ('3', '5');
insert into session_etu (refSess, refEtu)
values ('3', '6');
insert into session_etu (refSess, refEtu)
values ('3', '8');
insert into session_etu (refSess, refEtu)
values ('3', '9');
insert into session_etu (refSess, refEtu)
values ('4', '1');
insert into session_etu (refSess, refEtu)
values ('4', '2');
insert into session_etu (refSess, refEtu)
values ('4', '4');
insert into session_etu (refSess, refEtu)
values ('4', '5');
insert into session_etu (refSess, refEtu)
values ('4', '6');
insert into session_etu (refSess, refEtu)
values ('4', '8');
insert into session_etu (refSess, refEtu)
values ('4', '9');
insert into session_etu (refSess, refEtu)
values ('5', '5');
insert into session_etu (refSess, refEtu)
values ('5', '4');
insert into session_etu (refSess, refEtu)
values ('6', '6');
insert into session_etu (refSess, refEtu)
values ('6', '3');
insert into session_etu (refSess, refEtu)
values ('7', '6');
insert into session_etu (refSess, refEtu)
values ('7', '3');
insert into session_etu (refSess, refEtu)
values ('8', '2');
insert into session_etu (refSess, refEtu)
values ('8', '1');
insert into session_etu (refSess, refEtu)
values ('9', '8');
insert into session_etu (refSess, refEtu)
values ('9', '9');
insert into session_etu (refSess, refEtu)
values ('10', '8');
insert into session_etu (refSess, refEtu)
values ('10', '9');
insert into session_etu (refSess, refEtu)
values ('11', '7');
insert into session_etu (refSess, refEtu)
values ('12', '7');
insert into session_etu (refSess, refEtu)
values ('12', '1');
insert into session_etu (refSess, refEtu)
values ('13', '7');
insert into session_etu (refSess, refEtu)
values ('13', '1');
insert into session_etu (refSess, refEtu)
values ('14', '7');
insert into session_etu (refSess, refEtu)
values ('14', '3');
insert into session_etu (refSess, refEtu)
values ('15', '7');
insert into session_etu (refSess, refEtu)
values ('15', '3');
insert into session_etu (refSess, refEtu)
values ('16', '7');
insert into session_etu (refSess, refEtu)
values ('16', '3');
insert into session_etu (refSess, refEtu)
values ('16', '1');
insert into session_etu (refSess, refEtu)
values ('17', '7');
insert into session_etu (refSess, refEtu)
values ('17', '3');
insert into session_etu (refSess, refEtu)
values ('18', '7');
insert into session_etu (refSess, refEtu)
values ('18', '3');
insert into session_etu (refSess, refEtu)
values ('18', '1');
insert into session_etu (refSess, refEtu)
values ('19', '5');
insert into session_etu (refSess, refEtu)
values ('19', '4');
insert into session_etu (refSess, refEtu)
values ('20', '2');
insert into session_etu (refSess, refEtu)
values ('20', '6');
insert into session_etu (refSess, refEtu)
values ('20', '1');
insert into session_etu (refSess, refEtu)
values ('21', '5');
insert into session_etu (refSess, refEtu)
values ('21', '4');
insert into session_etu (refSess, refEtu)
values ('23', '1');
insert into session_etu (refSess, refEtu)
values ('23', '6');
insert into session_etu (refSess, refEtu)
values ('23', '2');
insert into session_etu (refSess, refEtu)
values ('5', '8');
insert into session_etu (refSess, refEtu)
values ('5', '9');

insert into indisponibilite (IdHor, IdEns, raison)
values (1,1,'malade');
insert into indisponibilite (IdHor, IdEns, raison)
values (1,1,'malade');
insert into indisponibilite (IdHor, IdEns, raison)
values (2,1,'malade');
insert into indisponibilite (IdHor, IdEns, raison)
values (2,6,'congés');
insert into indisponibilite (IdHor, IdEns, raison)
values (1,7,'congés');
insert into indisponibilite (IdHor, IdEns, raison)
values (5,2,'congés');
insert into indisponibilite (IdHor, IdEns, raison)
values (8,3,'accident');
insert into indisponibilite (IdHor, IdEns, raison)
values (3,9,'accident');
insert into indisponibilite (IdHor, IdEns, raison)
values (3,8,'accident');
insert into indisponibilite (IdHor, IdEns, raison)
values (7,11,'accident');
insert into indisponibilite (IdHor, IdEns, raison)
values (23,3,'accident');
insert into indisponibilite (IdHor, IdEns, raison)
values (12,14,'accident');
insert into indisponibilite (IdHor, IdEns, raison)
values (15,11,'greves');
insert into indisponibilite (IdHor, IdEns, raison)
values (6,6,'greves');
insert into indisponibilite (IdHor, IdEns, raison)
values (17,5,'greves');
insert into indisponibilite (IdHor, IdEns, raison)
values (26,4,'greves');
insert into indisponibilite (IdHor, IdEns, raison)
values (23,11,'greves');
insert into indisponibilite (IdHor, IdEns, raison)
values (4,8,'greves');
insert into indisponibilite (IdHor, IdEns, raison)
values (16,1,'greves');
insert into indisponibilite (IdHor, IdEns, raison)
values (12,4,'greves');
insert into indisponibilite (IdHor, IdEns, raison)
values (7,7,'greves');
insert into indisponibilite (IdHor, IdEns, raison)
values (3,3,'rendez- vous hopital');
insert into indisponibilite (IdHor, IdEns, raison)
values (12,2,'rendez- vous hopital');
insert into indisponibilite (IdHor, IdEns, raison)
values (11,5,'rendez- vous hopital');
insert into indisponibilite (IdHor, IdEns, raison)
values (6,11,'reunion');
insert into indisponibilite (IdHor, IdEns, raison)
values (3,3,'reunion');
insert into indisponibilite (IdHor, IdEns, raison)
values (2,3,'reunion');
insert into indisponibilite (IdHor, IdEns, raison)
values (3,5,'reunion');

######################################################
#vue horaire enseigant
create view vue_horaire_prof
as
select enseignant.nomEns,
       cours.intitule,
       seance.numSeance,
       local.nomLoc,
       local.nomSite,
       horaire.heureDebut,
       horaire.heureFin,
       session.IdSess as session,
       horaire.idHor

from seance
         inner join enseignant on seance.refIdEns = enseignant.idEns
         inner join cours on idEns = cours.RefIdEns
         inner join local on seance.RefLoc = local.idLoc
         inner join horaire on horaire.idHor = seance.refHor
         inner join session on session.IdSess = seance.refSess;

# vue indisponibilite enseignant
create view vue_horaire_indisponibilite
as
select Enseignant.nomEns, Horaire.idHor, Horaire.heureDebut, Horaire.HeureFin, Indisponibilite.raison
from Indisponibilite
         inner join Horaire on Horaire.idHor = Indisponibilite.idHor
         inner join Enseignant on Enseignant.idEns = Indisponibilite.IdEns;

#horaire d'un local
create view vue_horaire_local
as
select Horaire.idHor,
       local.nomSite,
       local.nomLoc,
       Cours.intitule,
       Enseignant.nomEns,
       horaire.heureDebut,
       horaire.heureFin
from seance
         inner join Horaire on Horaire.idHor = seance.RefHor
         inner join local on seance.RefLoc = local.IdLoc
         inner join session_seance on seance.Idseance = session_seance.RefSeance
         inner join Session on Session.IdSess = session_seance.idSessSeance
         inner join session_cours on Session.IdSess = session_cours.idSessCours
         inner join Enseignant on Session.RefIdEns = Enseignant.idEns
         inner join Cours on Cours.IdCours = session_cours.idSessCours;

#Horaire Etudiant
create view vue_horaire_etudiant
as
select Etudiant.nomEtu,
       Cours.intitule,
       seance.numSeance,
       Enseignant.nomEns,
       local.nomSite,
       local.nomLoc,
       horaire.heureDebut,
       horaire.heureFin,
       Horaire.idHor,
       Session.IdSess
from seance
         inner join local on seance.RefLoc = local.IdLoc
         inner join Horaire on Horaire.idHor = seance.RefHor
         inner join session_seance on seance.Idseance = session_seance.RefSeance
         inner join session on session.IdSess = session_seance.refSess
         inner join session_etu on session.IdSess = session_etu.refSess
         inner join etudiant on session_etu.refEtu = etudiant.idEtu
         inner join Enseignant on Session.RefIdEns = Enseignant.idEns
         inner join Cours on Cours.IdCours = seance.refSess;