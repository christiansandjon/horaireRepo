package com.horaire.model;

import java.sql.Connection;
import java.util.List;

public class Local {
    private int id;
    private String nom;
    private String site;
    private int nbPlaces;
    private String tbi;
    private boolean projecteur;
    private boolean pc;

    private Connection connection;
    private Horaire horaire;
    private List<Horaire> horaires;

    public Local() {
    }

    public Local(String nom) {
        this.nom = nom;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }

    public int getNbPlaces() {
        return nbPlaces;
    }

    public void setNbPlaces(int nbPlaces) {
        this.nbPlaces = nbPlaces;
    }

    public String getTbi() {
        return tbi;
    }

    public void setTbi(String tbi) {
        this.tbi = tbi;
    }

    public boolean isProjecteur() {
        return projecteur;
    }

    public void setProjecteur(boolean projecteur) {
        this.projecteur = projecteur;
    }

    public boolean isPc() {
        return pc;
    }

    public void setPc(boolean pc) {
        this.pc = pc;
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    public Horaire getHoraire() {
        return horaire;
    }

    public void setHoraire(Horaire horaire) {
        this.horaire = horaire;
    }

    public List<Horaire> getHoraires() {
        return horaires;
    }

    public void setHoraires(List<Horaire> horaires) {
        this.horaires = horaires;
    }

    /*
    public List<Horaire> horaireList(Local local) {
        horaires = new ArrayList<>();
        Statement statement = null;
        ResultSet resultat = null;

        preparerDB();

        try {
            PreparedStatement pstmtLocal = connection.prepareStatement(SELECT_HORAIRE_LOCAL_QUERY);
            pstmtLocal.setString(1, local.getNom());

            // Exécution de la requête
            resultat = pstmtLocal.executeQuery();

            // Récupération des données
            while (resultat.next()) {
                String heure = resultat.getString("horaire");

                Horaire horaire = new Horaire();
                horaire.setHeureDebut(heure);

                horaires.add(horaire);
            }
        } catch (SQLException e) {
        } finally {
            // Fermeture de la connexion
            try {
                if (resultat != null)
                    resultat.close();
                if (statement != null)
                    statement.close();
                if (connection != null)
                    connection.close();
            } catch (SQLException ignore) {
            }
        }

        return horaires;
    }

    public void afficherHoraires(Local local) {
        horaireList(local);
        for (Horaire h : horaires) {
            System.out.println("horaire de l'local " + local.getNom() + " : " + h.getHoraireValue());
        }
        if (horaires.isEmpty()) {
            System.out.println("cet local n'a pas d'horaires");
        }
    }

    // caracteristiques d'un local

    public Local caracteristiques(Local local) {
        Statement statement = null;
        ResultSet resultat = null;

        preparerDB();

        try {
            PreparedStatement pstmtLocal = connection.prepareStatement(SELECT_CARACTERISTIQUES_LOCAL_QUERY);
            pstmtLocal.setString(1, local.getNom());

            // Exécution de la requête
            resultat = pstmtLocal.executeQuery();

            // Récupération des données
            String site = resultat.getString("site");
            int nbPlaces = resultat.getInt("nbplaces");
            String tbi = resultat.getString("tbi");
            boolean projecteur = resultat.getBoolean("projecteur");
            boolean pc = resultat.getBoolean("horaire");


            local.setNbPlaces(nbPlaces);
            local.setSite(site);
            local.setTbi(tbi);
            local.setProjecteur(projecteur);
            local.setPc(pc);

        } catch (SQLException e) {
        } finally {
            // Fermeture de la connexion
            try {
                if (resultat != null)
                    resultat.close();
                if (statement != null)
                    statement.close();
                if (connection != null)
                    connection.close();
            } catch (SQLException ignore) {
            }
        }
        return local;
    }


    // CHARGEMENT DE LA BASE DE DONNEES
    public void preparerDB() {
        Connection connection = null;
        try {
            Class.forName(DB_DRIVER);
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD);
        } catch (Exception e) {
            System.out.println("echec connexion");
            ;
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    System.out.println("connexion not yet closed");
                }
            }
        }
    }

     */
}
