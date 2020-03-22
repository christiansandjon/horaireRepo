package com.horaire;

public final class DbQueries {

    public static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";
    public static final String DB_URL = "jdbc:mysql://localhost:3306/horaireDB";
    public static final String DB_USER = "root";
    public static final String DB_PWD = "root";

    public static final String LISTE_ENSEIGNANT_QUERY = "select * from enseignant";
    public static final String LISTE_ETUDIANT_QUERY = "select * from etudiant";
    public static final String LISTE_LOCAL_QUERY = "select * from local";
    public static final String LISTE_COURS_QUERY = "select intitule from cours";

    public static final String HORAIRE_ETUDIANT_QUERY = "select * from vue_horaire_etudiant where nomEtu = ? ";
    public static final String HORAIRE_ENSEIGNANT_QUERY = "select * from vue_horaire_prof where nomEns = ?";
    public static final String HORAIRE_LOCAL_QUERY = "select * from vue_horaire_local where nomLoc = ?";

    public static final String INDISPONIBILITE_ENSEIGNANT = "select * from vue_horaire_indisponibilite where nomEns = ?";
    public static final String DISPONIBILITE_ENSEIGNANT = "select * from vue_horaire_prof where nomEns = ? and idHor  NOT IN (select idHor from vue_horaire_indisponibilite where nomEns = ?)";
    public static final String DISPONIBILITE_ETUDIANT = "select * from vue_horaire_etudiant where idHor not in (select idHor from vue_horaire_etudiant where vue_horaire_etudiant.nomEtu = ?)";
    public static final String DISPONIBILITE_LOCAL = "select * from vue_horaire_local where idHor not in (select idHor from vue_horaire_local where vue_horaire_local.nomLoc = ?)";
    public static final String CARACTERISTIQUES_LOCAL_QUERY = "select * from local where nomLoc = ?";
    public static final String CARACTERISTIQUES_COURS_QUERY = "select * from cours where intitule = ?";
}
