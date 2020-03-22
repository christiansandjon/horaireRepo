package com.horaire.model;

import java.util.List;

public class Cours {

    private String nom;
    private int nbEtudiants;
    private String materiel;
    private Enseignant enseignant;
    private  Local local;
    private List<Session> sessions;
    private List<Etudiant> etudiants;




    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public int getNbEtudiants() {
        return nbEtudiants;
    }

    public void setNbEtudiants(int nbEtudiants) {
        this.nbEtudiants = nbEtudiants;
    }

    public String getMateriel() {
        return materiel;
    }

    public void setMateriel(String materiel) {
        this.materiel = materiel;
    }


}
