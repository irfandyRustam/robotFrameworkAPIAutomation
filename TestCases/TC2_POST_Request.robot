*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}   https://reqres.in

*** Test Cases ***
Post_CreateNewUser
    create session  mysession   ${base_url}
    ${body}=    create dictionary   name=johny     job=plumber
    ${header}=  create dictionary    Content-Type=application/json
    ${response}=    post on session    mysession   /api/users  data=${body}

    log to console    ${response.status_code}
    log to console    ${response.content}

    #Validations
    ${status_code}=    convert to string    ${response.status_code}
    should be equal    ${status_code}   201

    ${res_body}=    convert to string    ${response.content}
    should contain    ${res_body}   createdAt

*** Keywords ***