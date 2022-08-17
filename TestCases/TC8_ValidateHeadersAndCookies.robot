*** Settings ***
Library    Collections
Library    RequestsLibrary

*** Variables ***
${base_url}     https://jsonplaceholder.typicode.com

*** Test Cases ***
TestHeaders
    create session    mysession     ${base_url}
    ${response}=    get on session    mysession    /photos

#    log to console      ${response.headers}

    ${contentTypeValue}=    get from dictionary    ${response.headers}  Content-Type
    should be equal    ${contentTypeValue}      application/json; charset=utf-8

    ${contentEncodeValue}=    get from dictionary    ${response.headers}  Content-Encoding
    should be equal    ${contentEncodeValue}      gzip

TestCookies
    ${response}=    GET    https://www.google.com/
#    log to console    ${response.cookies}   # Displays all the cookies from response

    ${cookieValue}=     get from dictionary    ${response.cookies}  NID
    log to console      ${cookieValue}  # Display specific cookie value
