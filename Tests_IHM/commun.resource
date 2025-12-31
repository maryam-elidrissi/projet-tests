*** Settings***
Library    Selenium2Library


*** Variables ***
${AUTHOR}    zaina
${SERVEUR}    http://livraison3.testacademy.fr
${NAVIGATEUR}   edge
${LIEN SE CONNECTER}    xpath=//a[contains(text(),'Se connecter')]
${LIEN DECONNECTER}     xpath=(//a[contains(text(),'Se déconnecter')])[3]
${CHAMP NOM UTILISATEUR}    name=username
${CHAMP MOT DE PASSE}    name=password
${UTILISATEUR NON VALIDE}     nonvalide
${MOT DE PASSE NON VALIDE}    nonvalide
${UTILISATEUR VALIDE}    robot 
${MOT DE PASSE VALIDE}    robot
${BOUTON VALIDER}    css=.homey_login_button
${TITRE TABLEAU DE BORD}    Tableau de bord - Livraison 3
${ESPACE POUR AFFICHER LES ERREURS}    css=#modal-login .error

# Variables pour Contacter l'hôte
${BOUTTON RECHERCHE}    css=.search-button > .btn-primary:nth-child(1)
${LIEN ANNONCE}    xpath=(//a[contains(@href, '/listing/') and not(contains(@class, 'homey_logo'))])[1]
${BOUTON CONTACTER HOTE}    css=.btn-full-width:nth-child(2)
${FORMULAIRE CONTACT}    css=#modal-contact-host
${CHAMP NOM CONTACT}    xpath=//input[@name='name']
${CHAMP EMAIL CONTACT}    xpath=//input[@name='email']
${CHAMP PHONE CONTACT}    xpath=//input[@name='phone']
${CHAMP MESSAGE CONTACT}    xpath=//textarea[@name='message']
${BOUTON ENVOYER MESSAGE}    css=.contact_listing_host
${MESSAGE SUCCES CONTACT}    css=div.homey_contact_messages
${MESSAGE ERREUR CONTACT}    css=div.homey_contact_messages

# Variables de données de test additionnelles
${EMAIL NON VALID}    nonvalidemail
${EMAIL NON VALID FORMAT}    jean.dupont.email.com
${TELEPHONE NON VALID}    123
${NOM TROP LONG}    Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont Jean Dupont
${MESSAGE TROP LONG}    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


*** Keywords ***
Ouvrir Le Navigateur Et Accéder A La Page d'Accueil
    Open Browser    ${SERVEUR}    ${NAVIGATEUR}    
    Maximize Browser Window

Accéder A La Page De Connexion
     Click Element    ${LIEN SE CONNECTER}  
     Wait Until Element Is Visible    ${CHAMP NOM UTILISATEUR}  

Entrer Le Nom d'Utilisateur 
   [Arguments]    ${nom_utilisateur}
   Click Element    ${CHAMP NOM UTILISATEUR}
   Input Text    ${CHAMP NOM UTILISATEUR}    ${nom_utilisateur} 

Entrer Le Mot De Passe
   [Arguments]    ${mot_passe}
   Click Element    ${CHAMP MOT DE PASSE}     
   Input Text    ${CHAMP MOT DE PASSE}    ${mot_passe} 

Soumettre Le Formulaire De Connexion
    Click Button    ${BOUTON VALIDER}

# Keywords pour Contacter l'hôte
CLIQUE SUR BUTTOUN RECHERCHE
    Click Button    ${BOUTTON RECHERCHE} 
    Wait Until Element Is Visible    ${LIEN ANNONCE}  
    

Accéder A Une Annonce
    Click Element    ${LIEN ANNONCE}
    Wait Until Element Is Visible    ${BOUTON CONTACTER HOTE}

Ouvrir Le Formulaire De Contact
    Click Element    ${BOUTON CONTACTER HOTE}
    # Augmenter le délai d'attente à 10 secondes
    Wait Until Element Is Visible    ${FORMULAIRE CONTACT}    timeout=10s

Remplir Le Formulaire De Contact
    [Arguments]    ${nom}    ${email}    ${telephone}    ${message}
    Input Text    ${CHAMP NOM CONTACT}    ${nom}
    Input Text    ${CHAMP EMAIL CONTACT}    ${email}
    Input Text    ${CHAMP PHONE CONTACT}    ${telephone}
    Input Text    ${CHAMP MESSAGE CONTACT}    ${message}

Envoyer Le Message
    Click Button    ${BOUTON ENVOYER MESSAGE}

Vérifier Message Succès Contact
    Wait Until Element Is Visible    ${MESSAGE SUCCES CONTACT}    timeout=15s
    Element Should Be Visible    ${MESSAGE SUCCES CONTACT}

Vérifier Message Erreur Contact
    Wait Until Element Is Visible    ${MESSAGE ERREUR CONTACT}    timeout=15s
    Element Should Be Visible    ${MESSAGE ERREUR CONTACT}