*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${Base_URL}         https://mock-api-h0g7.onrender.com/
${API_KEY}          Cle-API-ReqRes-test-academy
${Id_Ressource}     2

*** Test Cases ***
Test Requete GET Resource By ID
    &{headers}=         Create Dictionary    Authorization=Bearer ${API_KEY}
    ${Reponse}=         GET    ${Base_URL}api/unknown/${Id_Ressource}    headers=${headers}    expected_status=200
    ${ReponseJson}=     Set Variable    ${Reponse.json()}
    Log                 ${ReponseJson}
    Dictionary Should Contain Key    ${ReponseJson}    data
    Dictionary Should Contain Key    ${ReponseJson}    support
    ${Ressource}=       Get From Dictionary    ${ReponseJson}    data
    ${id}=              Get From Dictionary    ${Ressource}    id
    Should Be Equal As Numbers    ${id}    ${Id_Ressource}
    Dictionary Should Contain Key    ${Ressource}    name
    Dictionary Should Contain Key    ${Ressource}    year
    Dictionary Should Contain Key    ${Ressource}    color
    Dictionary Should Contain Key    ${Ressource}    pantone_value
    ${name}=            Get From Dictionary    ${Ressource}    name
    Should Be Equal As Strings    ${name}    fuchsia rose
