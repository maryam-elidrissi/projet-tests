*** Settings ***
Library    RequestsLibrary    # Import de la bibliothèque pour les requêtes HTTP
Library    Collections         # Import pour manipuler les dictionnaires

*** Variables ***
${Base_URL}         https://mock-api-h0g7.onrender.com/    # Définition de l'URL de base de l'API
${API_KEY}          Cle-API-ReqRes-test-academy            # Clé API pour l'authentification

*** Test Cases ***
Test Requete DELETE
    # Créer un utilisateur d'abord
    &{headers}=        Create Dictionary    Authorization=Bearer ${API_KEY}
    &{Corps_Requete}=  Create Dictionary    first_name=Test    last_name=User    email=test.delete@api.testacademy.fr
    ${Reponse_POST}=   POST    ${Base_URL}api/users    json=${Corps_Requete}    headers=${headers}    expected_status=201
    ${Id_Utilisateur}=    Get From Dictionary    ${Reponse_POST.json()}    id
    
    # Supprimer l'utilisateur créé
    ${Reponse_DELETE}=    DELETE    ${Base_URL}api/users/${Id_Utilisateur}    headers=${headers}    expected_status=204