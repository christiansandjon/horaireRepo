package com.horaire.model;

import java.sql.Timestamp;

public class Indisponibilite {

    private int id;
    private Timestamp dateDebut;
    private Timestamp dateFin;

    public Timestamp getDateDebut() {
        return dateDebut;
    }

    public void setDateDebut(Timestamp dateDebut) {
        this.dateDebut = dateDebut;
    }

    public Timestamp getDateFin() {
        return dateFin;
    }

    public void setDateFin(Timestamp dateFin) {
        this.dateFin = dateFin;
    }
}
