*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}     https://reqres.in

*** Test Cases ***
TC1:List Users (GET)
    create session  mysession   ${base_url}
    ${response}=    get on session  mysession    /api/users

    log to console    ${response.status_code}
    log to console    ${response.content}

    #Validations
    ${status_code}=     convert to string    ${response.status_code}
    should be equal    ${status_code}   200

TC2:Create New User (POST)
    create session  mysession   ${base_url}
    ${body}=    create dictionary   name=morpheus   job=leader
    ${header}=  create dictionary    content-type=application/json
    ${response}=    post on session    mysession   /api/users    data=${body}

    log to console    ${response.status_code}
    log to console    ${response.content}

    #Validations
    ${status_code}=     convert to string    ${response.status_code}
    should be equal    ${status_code}   201

    ${res_body}=     convert to string    ${response.content}
    should contain    ${res_body}   createdAt

TC3:Get Single User (GET)
    create session  mysession   ${base_url}
    ${response}=    get on session  mysession    /api/users/2

    log to console    ${response.status_code}
    log to console    ${response.content}

    #Validations
    ${status_code}=     convert to string    ${response.status_code}
    should be equal    ${status_code}   200

    ${res_body}=     convert to string    ${response.content}
    should contain    ${res_body}   Janet

TC4:Update Existing User (PUT)
    create session  mysession   ${base_url}
    ${body}=    create dictionary   name=morpheus   job=zion resident
    ${header}=  create dictionary    content-type=application/json
    ${response}=    put on session  mysession   /api/users/2    data=${body}

    log to console    ${response.status_code}
    log to console    ${response.content}

    #Validations
    ${status_code}=     convert to string    ${response.status_code}
    should be equal    ${status_code}   200

    ${res_body}=     convert to string    ${response.content}
    should contain    ${res_body}   updatedAt

TC5:Delete User (DELETE)
    create session  mysession   ${base_url}
    ${response}=    delete on session   mysession    /api/users/3

    log to console    ${response.status_code}
    log to console    ${response.content}

    #Validations
    ${status_code}=     convert to string    ${response.status_code}
    should be equal    ${status_code}   204