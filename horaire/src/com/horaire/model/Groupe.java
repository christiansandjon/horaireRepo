package com.horaire.model;

import java.sql.Connection;
import java.util.List;

public class Groupe {
    private int id;
    private String nom;
    private List<Etudiant> etudiants;

    private Connection connection;
    private Horaire horaire;
    private List<Horaire> horaires;

    public Groupe() {
    }

    public Groupe(String nom) {
        this.nom = nom;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Horaire getHoraire() {
        return horaire;
    }

    public void setHoraire(Horaire horaire) {
        this.horaire = horaire;
    }

}
