package com.horaire.model;

import java.sql.Timestamp;

public class Horaire {

    private int id;
    private Timestamp heureDebut;
    private Timestamp heureFin;

    public Timestamp getHeureDebut() {
        return heureDebut;
    }

    public void setHeureDebut(Timestamp heureDebut) {
        this.heureDebut = heureDebut;
    }

    public Timestamp getHeureFin() {
        return heureFin;
    }

    public void setHeureFin(Timestamp heureFin) {
        this.heureFin = heureFin;
    }
}
