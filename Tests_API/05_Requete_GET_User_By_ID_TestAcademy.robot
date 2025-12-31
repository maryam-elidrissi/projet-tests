*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${Base_URL}         https://mock-api-h0g7.onrender.com/
${API_KEY}          Cle-API-ReqRes-test-academy
${Id_Utilisateur}   2

*** Test Cases ***
Test Requete GET User By ID
    &{headers}=         Create Dictionary    Authorization=Bearer ${API_KEY}
    ${Reponse}=         GET    ${Base_URL}api/users/${Id_Utilisateur}    headers=${headers}    expected_status=200
    ${ReponseJson}=     Set Variable    ${Reponse.json()}
    Log                 ${ReponseJson}
    Dictionary Should Contain Key    ${ReponseJson}    data
    Dictionary Should Contain Key    ${ReponseJson}    support
    ${Utilisateur}=     Get From Dictionary    ${ReponseJson}    data
    ${id}=              Get From Dictionary    ${Utilisateur}    id
    Should Be Equal As Numbers    ${id}    ${Id_Utilisateur}
    Dictionary Should Contain Key    ${Utilisateur}    email
    Dictionary Should Contain Key    ${Utilisateur}    first_name
    Dictionary Should Contain Key    ${Utilisateur}    last_name
    Dictionary Should Contain Key    ${Utilisateur}    avatar
    ${first_name}=      Get From Dictionary    ${Utilisateur}    first_name
    #Should Be Equal As Strings    ${first_name}    Emma
