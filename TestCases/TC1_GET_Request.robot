*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}   https://reqres.in
${user}     2

*** Test Cases ***
Get_UserInfo
    create session  mysession   ${base_url}
    ${response}=    get on session  mysession    /api/users/${user}
#    log to console    ${response.status_code}
#    log to console    ${response.content}
#    log to console    ${response.headers}

    # Validations
    ${statusCode}=   convert to string  ${response.status_code}
    should be equal    ${statusCode}    200

    ${body}=   convert to string  ${response.content}
    should contain    ${body}    Janet

    ${contentTypeValue}=   get from dictionary    ${response.headers}  Content-Type
    should be equal    ${contentTypeValue}    application/json; charset=utf-8

*** Keywords ***
