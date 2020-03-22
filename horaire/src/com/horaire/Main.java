package com.horaire;

import com.horaire.model.*;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        Utilisateur utilisateur = new Utilisateur("nassim", "Giblet");
        Groupe groupe = new Groupe();
        Enseignant enseignant = new Enseignant();
        Etudiant etudiant = new Etudiant();
        Local local = new Local();
        Cours cours = new Cours();

        System.out.println("bonjour " + utilisateur.getPrenom() + " " + utilisateur.getNom() + " bienvenue dans l'application \n");
        System.out.println("Gestion d'un horaire ! Que voulez-vous obtenir ? :" +
                        "\n------------------------------------" +
                        "\n1- l'horaire d'un enseignant" +
                        "\n2- l'horaire d'un etudiant" +
                        "\n3- l'horaire d'un local" +
                        "\n4- l'horaire d'indisponibilité d'un enseignant" +
                        "\n5- l'horaire de disponibilité d'un enseignant" +
                        "\n6- l'horaire de disponibilité d'un Etudiant" +
                        "\n7- l'horaire de disponibilité d'un local" +
                        "\n8- les caractéristiques d'un local" +
                        "\n9- les caractéristiques d'un cours "
                //"\n10- les possibilités de déplacement d'une séance d'une session d'AA."
        );
        System.out.println();

        Scanner scanner = new Scanner(System.in);
        int reponse = scanner.nextInt();
        scanner.nextLine();

        switch (reponse) {
            case 1:
                System.out.println("voici la liste des enseignants");
                utilisateur.getEnseignantList();
                System.out.println("De quel enseignant(nom) voulez-vous l'horaire ?");
                String nomEns = scanner.nextLine();
                enseignant.setNom(nomEns);
                utilisateur.getHoraireEnseignant(enseignant);
                break;
            case 2:
                System.out.println("voici la liste des etudiants");
                utilisateur.getEtudiantList();
                System.out.println("De quel etudiant(nom) voulez vous l'horaire ?");
                String nomEtu = scanner.nextLine();
                etudiant.setNom(nomEtu);
                utilisateur.getHoraireEtudiant(etudiant);
                break;
            case 3:
                System.out.println("voici la liste des locaux");
                utilisateur.getLocalList();
                System.out.println("De quel local(nom) voulez vous l'horaire ?");
                String nomLocal = scanner.nextLine();
                local.setNom(nomLocal);
                utilisateur.getHoraireLocal(local);
                break;

            case 4:
                System.out.println("voici la liste des enseignants");
                utilisateur.getEnseignantList();
                System.out.println("De quel enseignant(nom) voulez vous l'indisponibilite ?");
                String indispoEns = scanner.nextLine();
                enseignant.setNom(indispoEns);
                utilisateur.getIndisponibiliteEnseignant(enseignant);
                break;

            case 5:
                System.out.println("voici la liste des enseignants");
                utilisateur.getEnseignantList();
                System.out.println("De quel enseignant(nom) voulez vous la disponibilite ?");
                String dispoEns = scanner.nextLine();
                enseignant.setNom(dispoEns);
                utilisateur.getDisponibiliteEnseignant(enseignant);
                break;
            case 6:
                System.out.println("voici la liste des etudiants");
                utilisateur.getEtudiantList();
                System.out.println("De quel etudiant(nom) voulez vous la disponibilite ?");
                String rep8 = scanner.nextLine();
                etudiant.setNom(rep8);
                utilisateur.getDisponibiliteEtudiant(etudiant);
                break;
            case 7:
                System.out.println("voici la liste des locaux");
                utilisateur.getLocalList();
                System.out.println("De quel local(nom) voulez vous la disponibilite ?");
                String dispoLocal = scanner.nextLine();
                local.setNom(dispoLocal);
                utilisateur.getDisponibiliteLocal(local);
                break;

            case 8:
                System.out.println("voici la liste des locals");
                utilisateur.getLocalList();
                System.out.println("De quel local(nom) voulez vous les caracteristiques ?");
                String localCar = scanner.nextLine();
                local.setNom(localCar);
                utilisateur.getCaracteristiquesLocal(local);
                break;
            case 9:
                System.out.println("voici la liste des session");
                utilisateur.getCoursList();
                System.out.println("De quel session(nom) voulez vous les caracteristiques ?");
                String sessionCar = scanner.nextLine();
                cours.setNom(sessionCar);
                utilisateur.getCaracteristiquesCours(cours);
                break;
            case 10:
                System.out.println("les possibilites de deplacements de session sont les horaires non utilisées");
                break;
            default:
                System.out.println("choix inexistant");
        }
    }

}
