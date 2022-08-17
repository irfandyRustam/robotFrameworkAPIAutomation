*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    OperatingSystem

*** Variables ***
${base_url}     https://maps.googleapis.com
${req_uri}      /maps/api/place/nearbysearch/json?
${apiKey}       [PUT YOUR API KEY HERE]

*** Test Cases ***
GoogleMapsPlacesAPITC
    create session    mysession     ${base_url}
    ${params}=  create dictionary   location=-33.8670522,151.1957362    radius=500  types=food  name=harbour    key=${apiKey}
    ${response}=  get on session    mysession     ${req_uri}  params=${params}

    log to console    ${response.status_code}
    log to console    ${response.content}