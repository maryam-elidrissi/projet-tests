*** Settings ***
Library    Selenium2Library
Resource    commun.resource
Test Setup      Ouvrir Le Navigateur Et Accéder A La Page d'Accueil
Test Template    Un Message d'Erreur Doit Etre Visible Apres Une Connexion Incorrecte


*** Test Cases ***

#cas de test                                           #nom_utilisateur        #password
test nom utlisateur valid et mote de passe vide          robot                  ${EMPTY}
test nom utilisateur vide et mote de passe valid         ${EMPTY}                robot
Test Utilisateur Vide Mot De Passe Vide                  ${EMPTY}              ${EMPTY} 
test nom utilisateur valid et mote de passe invalid      robot                   nonvalid
test nom utilisateur invalid et mote de passe valid      nonvalid                robot
test nom utilisateur invalid et mote de passe invalid    nonvalid                nonvalid    
  
  





*** Keywords ***

Un Message d'Erreur Doit Etre Visible Apres Une Connexion Incorrecte
    [Arguments]    ${nom_utilisateur}    ${mot_passe}
    Accéder A La Page De Connexion
    Entrer Le Nom d'Utilisateur     ${nom_utilisateur}
    Entrer Le Mot De Passe     ${mot_passe}
    Soumettre Le Formulaire De Connexion
    Vérifier Que Le Message d'Erreur Est Visible

  

Vérifier Que Le Message d'Erreur Est Visible
   Wait Until Element Is Visible    ${ESPACE POUR AFFICHER LES ERREURS}
   Element Text Should Not Be    ${ESPACE POUR AFFICHER LES ERREURS}    ${EMPTY}
   #Element Text Should Be     ${ESPACE POUR AFFICHER LES ERREURS}   Invalid username or email
    #Element Text Should Be     ${ESPACE POUR AFFICHER LES ERREURS}   The password you entered for the username test is incorrect.
    

