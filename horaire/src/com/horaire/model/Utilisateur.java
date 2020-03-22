package com.horaire.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static com.horaire.DbQueries.*;

public class Utilisateur implements UtilisateurServices {

    private String prenom;
    private String nom;

    List<Horaire> horaires;
    List<Enseignant> enseignants;
    List<Etudiant> etudiants;
    List<Local> locals;
    List<Cours> courss;
    Connection connection = null;

    // constructeur
    public Utilisateur(String prenom, String nom) {
        this.prenom = prenom;
        this.nom = nom;
    }

    // getter and setter
    public String getPrenom() {
        return prenom;
    }


    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    // methods
    @Override
    public void getEnseignantList() {
        enseignants = new ArrayList<>();
        Statement statement = null;
        ResultSet resultat = null;
        preparerDB();
        try {
            statement = connection.createStatement();
            // Exécution de la requête
            resultat = statement.executeQuery(LISTE_ENSEIGNANT_QUERY);
            // Récupération des données
            while (resultat.next()) {
                String nomEns = resultat.getString("nomEns");
                Enseignant enseignant = new Enseignant();
                enseignant.setNom(nomEns);
                enseignants.add(enseignant);
            }
            System.out.println("Liste des enseignants");
            for (Enseignant enseignant : enseignants) {
                System.out.println(enseignant.getNom());
            }
            if (enseignants.isEmpty()) {
                System.out.println("pas d' enseignant");
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
                System.out.println("connection not yet closed");
            }
        }
    }

    @Override
    public void getHoraireEnseignant(Enseignant enseignant) {
        horaires = new ArrayList<>();
        PreparedStatement pstmtEnseignant = null;
        ResultSet resultat = null;

        preparerDB();

        try {
            pstmtEnseignant = connection.prepareStatement(HORAIRE_ENSEIGNANT_QUERY);
            pstmtEnseignant.setString(1, enseignant.getNom());

            // Exécution de la requête
            resultat = pstmtEnseignant.executeQuery();

            // Récupération des données
            while (resultat.next()) {
                String nomEns = resultat.getString("nomEns");
                String intitule = resultat.getString("intitule");
                String numSeance = resultat.getString("numSeance");
                String nomSite = resultat.getString("nomSite");
                String nomLoc = resultat.getString("nomLoc");
                String heureDebut = String.valueOf(resultat.getTimestamp("heureDebut"));
                String heureFin = String.valueOf(resultat.getTimestamp("heureFin"));

                System.out.println("horaire de l'enseignant " + nomEns + " : " +
                        "\nnom cours : " + intitule +
                        "\nnumero seance : " + numSeance +
                        "\nnom du site : " + nomSite +
                        "\nnom du local : " + nomLoc +
                        "\nheure debut : " + heureDebut +
                        "\nheure fin : " + heureFin);
            }
        } catch (SQLException e) {
            System.out.println("requete incorrecte");
        } finally {
            // Fermeture de la connexion
            try {
                if (resultat != null)
                    resultat.close();
                if (pstmtEnseignant != null)
                    pstmtEnseignant.close();
                if (connection != null)
                    connection.close();
            } catch (SQLException ignore) {
                System.out.println("connection not yet closed");
            }
        }
    }

    @Override
    public void getEtudiantList() {
        etudiants = new ArrayList<>();
        Statement statement = null;
        ResultSet resultat = null;

        preparerDB();

        try {
            statement = connection.createStatement();

            // Exécution de la requête
            resultat = statement.executeQuery(LISTE_ETUDIANT_QUERY);

            // Récupération des données
            while (resultat.next()) {
                String prenomEtu = resultat.getString("prenomEtu");
                String nomEtu = resultat.getString("nomEtu");

                Etudiant etudiant = new Etudiant();
                etudiant.setPrenom(prenomEtu);
                etudiant.setNom(nomEtu);
                etudiants.add(etudiant);
            }
            for (Etudiant etudiant : etudiants) {
                System.out.println("etudiant " + etudiant.getPrenom() + " " + etudiant.getNom());
            }
            if (etudiants.isEmpty()) {
                System.out.println("pas d'etudiant");
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
                System.out.println("connection not yet closed");
            }
        }
    }


    @Override
    public void getHoraireEtudiant(Etudiant etudiant) {
        horaires = new ArrayList<>();
        PreparedStatement pstmtEtudiant = null;
        ResultSet resultat = null;

        preparerDB();

        try {
            pstmtEtudiant = connection.prepareStatement(HORAIRE_ETUDIANT_QUERY);
            pstmtEtudiant.setString(1, etudiant.getNom());

            // Exécution de la requête
            resultat = pstmtEtudiant.executeQuery();

            // Récupération des données
            while (resultat.next()) {
                String nomEns = resultat.getString("nomEns");
                String intitule = resultat.getString("intitule");
                String numSeance = resultat.getString("numSeance");
                String nomSite = resultat.getString("nomSite");
                String nomLoc = resultat.getString("nomLoc");
                String heureDebut = String.valueOf(resultat.getTimestamp("heureDebut"));
                String heureFin = String.valueOf(resultat.getTimestamp("heureFin"));
                String nomEtu = resultat.getString("nomEtu");

                System.out.println("horaire de l'etudiant " + nomEtu + " : " +
                        "\nnom cours : " + intitule +
                        "\nnumero seance : " + numSeance +
                        "\nnom enseignant : " + nomEns +
                        "\nnom du site : " + nomSite +
                        "\nnom du local : " + nomLoc +
                        "\nheure debut : " + heureDebut +
                        "\nheure fin : " + heureFin);
            }
        } catch (SQLException e) {
            System.out.println("requete incorrecte");
        } finally {
            // Fermeture de la connexion
            try {
                if (resultat != null)
                    resultat.close();
                if (pstmtEtudiant != null)
                    pstmtEtudiant.close();
                if (connection != null)
                    connection.close();
            } catch (SQLException ignore) {
                System.out.println("connection not yet closed");
            }
        }
    }

    @Override
    public void getLocalList() {
        locals = new ArrayList<>();
        Statement statement = null;
        ResultSet resultat = null;

        preparerDB();

        try {
            statement = connection.createStatement();

            // Exécution de la requête
            resultat = statement.executeQuery(LISTE_LOCAL_QUERY);

            // Récupération des données
            while (resultat.next()) {
                String nomLoc = resultat.getString("nomLoc");

                Local local = new Local();
                local.setNom(nomLoc);
                locals.add(local);
            }
            for (Local local : locals) {
                System.out.println("Local " + local.getNom());
            }
            if (locals.isEmpty()) {
                System.out.println("pas de local");
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
                System.out.println("connection not yet closed");
            }
        }
    }


    @Override
    public void getHoraireLocal(Local local) {
        PreparedStatement pstmtLocal = null;
        ResultSet resultat = null;

        preparerDB();

        try {
            pstmtLocal = connection.prepareStatement(HORAIRE_LOCAL_QUERY);
            pstmtLocal.setString(1, local.getNom());

            // Exécution de la requête
            resultat = pstmtLocal.executeQuery();

            // Récupération des données
            while (resultat.next()) {
                String nomEns = resultat.getString("nomEns");
                String intitule = resultat.getString("intitule");
                String nomSite = resultat.getString("nomSite");
                String nomLoc = resultat.getString("nomLoc");
                String heureDebut = String.valueOf(resultat.getTimestamp("heureDebut"));
                String heureFin = String.valueOf(resultat.getTimestamp("heureFin"));


                System.out.println("horaire du local " + nomLoc + " : " +
                        "\nnom du site : " + nomSite +
                        "\nnom de l'enseignant : " + nomEns +
                        "\nnom du cours : " + intitule +
                        "\nheure debut : " + heureDebut +
                        "\nheure fin : " + heureFin);
            }
        } catch (SQLException e) {
            System.out.println("mauvaise requete");
        } finally {
            // Fermeture de la connexion
            try {
                if (resultat != null)
                    resultat.close();
                if (pstmtLocal != null)
                    pstmtLocal.close();
                if (connection != null)
                    connection.close();
            } catch (SQLException ignore) {
                System.out.println("connection not yet closed");
            }
        }
    }

    @Override
    public void getIndisponibiliteEnseignant(Enseignant enseignant) {
        PreparedStatement pstmtEnseignant = null;
        ResultSet resultat = null;

        preparerDB();

        try {
            pstmtEnseignant = connection.prepareStatement(INDISPONIBILITE_ENSEIGNANT);
            pstmtEnseignant.setString(1, enseignant.getNom());

            // Exécution de la requête
            resultat = pstmtEnseignant.executeQuery();

            // Récupération des données
            while (resultat.next()) {
                String nomEns = resultat.getString("nomEns");
                String heureDebut = String.valueOf(resultat.getTimestamp("heureDebut"));
                String heureFin = String.valueOf(resultat.getTimestamp("heureFin"));
                String raison = resultat.getString("raison");

                System.out.println("Indisponibilite de l'enseignant " + nomEns + " : " +
                        "\nheure debut : " + heureDebut +
                        "\nheure fin : " + heureFin +
                        "\nraison : " + raison);
            }
        } catch (SQLException e) {
            System.out.println("requete incorrecte");
        } finally {
            // Fermeture de la connexion
            try {
                if (resultat != null)
                    resultat.close();
                if (pstmtEnseignant != null)
                    pstmtEnseignant.close();
                if (connection != null)
                    connection.close();
            } catch (SQLException ignore) {
                System.out.println("connection not yet closed");
            }
        }
    }

    @Override
    public void getDisponibiliteEnseignant(Enseignant enseignant) {
        PreparedStatement pstmtEnseignant = null;
        ResultSet resultat = null;

        preparerDB();

        try {
            pstmtEnseignant = connection.prepareStatement(DISPONIBILITE_ENSEIGNANT);
            pstmtEnseignant.setString(1, enseignant.getNom());
            pstmtEnseignant.setString(2, enseignant.getNom());

            // Exécution de la requête
            resultat = pstmtEnseignant.executeQuery();

            // Récupération des données
            while (resultat.next()) {
                String nomEns = resultat.getString("nomEns");
                String heureDebut = String.valueOf(resultat.getTimestamp("heureDebut"));
                String heureFin = String.valueOf(resultat.getTimestamp("heureFin"));


                System.out.println("Disponibilite de l'enseignant " + nomEns + " : " +
                        "\nheure debut : " + heureDebut +
                        "\nheure fin : " + heureFin);
            }
        } catch (SQLException e) {
            System.out.println("requete incorrecte");
        } finally {
            // Fermeture de la connexion
            try {
                if (resultat != null)
                    resultat.close();
                if (pstmtEnseignant != null)
                    pstmtEnseignant.close();
                if (connection != null)
                    connection.close();
            } catch (SQLException ignore) {
                System.out.println("connection not yet closed");
            }
        }
    }

    @Override
    public void getDisponibiliteEtudiant(Etudiant etudiant) {
        PreparedStatement pstmtEtudiant = null;
        ResultSet resultat = null;

        preparerDB();

        try {
            pstmtEtudiant = connection.prepareStatement(DISPONIBILITE_ETUDIANT);
            pstmtEtudiant.setString(1, etudiant.getNom());

            // Exécution de la requête
            resultat = pstmtEtudiant.executeQuery();

            // Récupération des données
            while (resultat.next()) {
                String heureDebut = String.valueOf(resultat.getTimestamp("heureDebut"));
                String heureFin = String.valueOf(resultat.getTimestamp("heureFin"));
                String nomEtu = resultat.getString("nomEtu");

                System.out.println("Disponibilite de l'etudiant " + nomEtu + " : " +
                        "\nheure debut : " + heureDebut +
                        "\nheure fin : " + heureFin);
            }
        } catch (SQLException e) {
            System.out.println("requete incorrecte");
        } finally {
            // Fermeture de la connexion
            try {
                if (resultat != null)
                    resultat.close();
                if (pstmtEtudiant != null)
                    pstmtEtudiant.close();
                if (connection != null)
                    connection.close();
            } catch (SQLException ignore) {
                System.out.println("connection not yet closed");
            }
        }
    }



    @Override
    public void getDisponibiliteLocal(Local local) {
        PreparedStatement pstmtLocal = null;
        ResultSet resultat = null;

        preparerDB();

        try {
            pstmtLocal = connection.prepareStatement(DISPONIBILITE_LOCAL);
            pstmtLocal.setString(1, local.getNom());

            // Exécution de la requête
            resultat = pstmtLocal.executeQuery();

            // Récupération des données
            while (resultat.next()) {

                String nomLocal = resultat.getString("nomLoc");
                String heureDebut = String.valueOf(resultat.getTimestamp("heureDebut"));
                String heureFin = String.valueOf(resultat.getTimestamp("heureFin"));



                System.out.println("Disponibilite du local " + nomLocal + " : " +
                        "\nheure debut : " + heureDebut +
                        "\nheure fin : " + heureFin);
            }
        } catch (SQLException e) {
            System.out.println("requete incorrecte");
        } finally {
            // Fermeture de la connexion
            try {
                if (resultat != null)
                    resultat.close();
                if (pstmtLocal != null)
                    pstmtLocal.close();
                if (connection != null)
                    connection.close();
            } catch (SQLException ignore) {
                System.out.println("connection not yet closed");
            }
        }
    }

    @Override
    public void getCaracteristiquesLocal(Local local) {
        PreparedStatement pstmtLocal = null;
        ResultSet resultat = null;

        preparerDB();

        try {
            pstmtLocal = connection.prepareStatement(CARACTERISTIQUES_LOCAL_QUERY);
            pstmtLocal.setString(1, local.getNom());

            // Exécution de la requête
            resultat = pstmtLocal.executeQuery();

            // Récupération des données
            while (resultat.next()) {
                String nomLoc = resultat.getString("nomLoc");
                String nomSite = resultat.getString("nomSite");
                String nbPlaces = resultat.getString("nbPlaces");
                boolean tbi = resultat.getBoolean("tbi");
                boolean sallePC = resultat.getBoolean("sallePC");
                boolean projecteur = resultat.getBoolean("projecteur");

                System.out.println("caracteristiques du local " + nomLoc + " : " +
                        "\nnom du site : " + nomSite +
                        "\nnombre de places : " + nbPlaces);
                if (tbi) {
                    System.out.println(" dispose d'un tbi");
                }
                if (sallePC) {
                    System.out.println(" dispose d'une salle PC");
                }
                if (projecteur) {
                    System.out.println(" dispose d'un projecteur");
                }
            }
        } catch (SQLException e) {
            System.out.println("requete incorrecte");
        } finally {
            // Fermeture de la connexion
            try {
                if (resultat != null)
                    resultat.close();
                if (pstmtLocal != null)
                    pstmtLocal.close();
                if (connection != null)
                    connection.close();
            } catch (SQLException ignore) {
                System.out.println("connection not yet closed");
            }
        }
    }


    @Override
    public void getCoursList() {
        courss = new ArrayList<>();
        Statement statement = null;
        ResultSet resultat = null;

        preparerDB();

        try {
            statement = connection.createStatement();

            // Exécution de la requête
            resultat = statement.executeQuery(LISTE_COURS_QUERY);

            // Récupération des données
            while (resultat.next()) {
                String intitule = resultat.getString("intitule");

                Cours cours = new Cours();
                cours.setNom(intitule);
                courss.add(cours);
            }
            System.out.println("liste des cours");
            for (Cours cours : courss) {
                System.out.println(cours.getNom());
            }
            if (courss.isEmpty()) {
                System.out.println("pas de cours");
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
                System.out.println("connection not yet closed");
            }
        }
    }


    @Override
    public void getCaracteristiquesCours(Cours cours) {
        PreparedStatement pstmtCours = null;
        ResultSet resultat = null;

        preparerDB();

        try {
            pstmtCours = connection.prepareStatement(CARACTERISTIQUES_COURS_QUERY);
            pstmtCours.setString(1, cours.getNom());

            // Exécution de la requête
            resultat = pstmtCours.executeQuery();

            // Récupération des données
            while (resultat.next()) {
                String intitule = resultat.getString("intitule");
                int nbEtudiants = resultat.getInt("nbEtudiants");
                String materiel = resultat.getString("materiel");

                System.out.println("caracteristiques du cours " + intitule + " : " +
                        "\n nombre d'etudiants "+nbEtudiants+
                        "\n materiel "+materiel);
            }
        } catch (SQLException e) {
            System.out.println("requete incorrecte");
        } finally {
            // Fermeture de la connexion
            try {
                if (resultat != null)
                    resultat.close();
                if (pstmtCours != null)
                    pstmtCours.close();
                if (connection != null)
                    connection.close();
            } catch (SQLException ignore) {
                System.out.println("connection not yet closed");
            }
        }
    }

    // CHARGEMENT DE LA BASE DE DONNEES
    public void preparerDB() {
        try {
            Class.forName(DB_DRIVER);
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD);
        } catch (Exception e) {
            System.out.println("echec connexion");
        }
    }

}
