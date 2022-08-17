*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    OperatingSystem

*** Variables ***
${base_url}     https://transaction.elementexpress.com
${bearerToken}  "Bearer E4F284BFADA11D01A52508ED7B92FFD7EE0905659F5DED06A4B73FC7739B48A287648801"

*** Test Cases ***
BearerAuthTest
    create session    mysession     ${base_url}
    ${headers}=  create dictionary    Authorization=${bearerToken}  Content-Type=text/xml
    ${req_body}=    get file    TestData/PostData.txt

    ${response}=    post on session    mysession    /   data=${req_body}    headers=${headers}
    log to console    ${response.status_code}
    log to console    ${response.content}