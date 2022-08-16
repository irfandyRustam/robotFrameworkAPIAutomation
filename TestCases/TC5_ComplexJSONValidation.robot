*** Settings ***
Library    JSONLibrary
Library    os
Library    Collections
Library    RequestsLibrary

*** Variables ***
${base_url}     https://restcountries.com/

*** Test Cases ***
Get_CountryInfo:
    create session    mysession     ${base_url}
    ${response}=    get on session    mysession     /v3.1/alpha/MY
#    ${json_object}=   to json   ${response.content}

    #Single data validation
    ${country_Name}=    get value from json    ${response.json()}   $[0].name.official
    log to console  ${country_Name[0]}
    should be equal     ${country_Name[0]}    Malaysia

    #Single data validation in array
    ${border}=    get value from json    ${response.json()}   $[0].borders[0]
    log to console  ${border[0]}
    should be equal     ${border[0]}    BRN

    #Multiple data validation in array
    ${borders}=    get value from json    ${response.json()}   $[0].borders
    log to console  ${borders[0]}
    should contain any    ${borders[0]}     IDN   THA
#    should not contain any    ${borders[0]}     ABC   XYZ