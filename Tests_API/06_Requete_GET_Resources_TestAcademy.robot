*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${Base_URL}    https://mock-api-h0g7.onrender.com/
${API_KEY}     Cle-API-ReqRes-test-academy

*** Test Cases ***
Test Requete GET Resources
    &{Params}=              Create Dictionary    page=1    per_page=6
    &{headers}=             Create Dictionary    Authorization=Bearer ${API_KEY}
    ${Reponse}=             GET    ${Base_URL}api/unknown    params=${Params}    headers=${headers}    expected_status=200
    ${ReponseJson}=         Set Variable    ${Reponse.json()}
    Log                     ${ReponseJson}
    ${page}=                Get From Dictionary    ${ReponseJson}    page
    Should Be Equal As Numbers    ${page}    1
    ${per_page}=            Get From Dictionary    ${ReponseJson}    per_page
    Should Be Equal As Numbers    ${per_page}    6
    Dictionary Should Contain Key    ${ReponseJson}    total
    Dictionary Should Contain Key    ${ReponseJson}    total_pages
    Dictionary Should Contain Key    ${ReponseJson}    data
    ${ListeRessources}=     Get Value From Json    ${ReponseJson}    data[:]
    ${PremiereRessource}=   Get From List    ${ListeRessources}    0
    Dictionary Should Contain Key    ${PremiereRessource}    id
    Dictionary Should Contain Key    ${PremiereRessource}    name
    Dictionary Should Contain Key    ${PremiereRessource}    year
    Dictionary Should Contain Key    ${PremiereRessource}    color
    Dictionary Should Contain Key    ${PremiereRessource}    pantone_value
