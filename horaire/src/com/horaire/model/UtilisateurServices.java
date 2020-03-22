package com.horaire.model;

import java.util.List;

public interface UtilisateurServices {

    public void getEnseignantList();
    public void getHoraireEnseignant(Enseignant enseignant);
    public void getIndisponibiliteEnseignant(Enseignant enseignant);
    public void getDisponibiliteEnseignant(Enseignant enseignant);

    public void getLocalList();
    public void getHoraireLocal(Local local);
    public void getDisponibiliteLocal(Local local);
    public void getCaracteristiquesLocal(Local local);

    public void getEtudiantList();
    public void getHoraireEtudiant(Etudiant etudiant);
    public void getDisponibiliteEtudiant(Etudiant etudiant);

    public void getCoursList();
    public void getCaracteristiquesCours(Cours cours);






}
