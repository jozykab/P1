*** Settings ***
Library  Collections
Library  RequestsLibrary
Library  HttpLibrary.HTTP
*** Test Cases ***
Verify API Response is Valid
    [Documentation]  Google Geo Code API
    [Tags]  api
    Create Session  google  http://maps.googleapis.com/maps/api/geocode
    ${params} =   Create Dictionary   address=chicago     sensor=false
    ${result} =  get request  google    /json?  params=${params}    #8221
    should be equal as strings  ${result.status_code}  200
    ${json} =  Set Variable  ${result.json()}
    #${jsonObj} =  to json  ${result}

    ${status} =  Get From Dictionary  ${json}  status

    #${framework} =  Get From Dictionary  ${json}  framework
    #Should Be Equal  ${framework}  robot-framework
    #${api} =  Get From Dictionary  ${json}  api
    Should Be Equal  ${status}  OK

Get Json and expect Fail
    Create Session  google  http://maps.googleapis.com/maps/api/geocode
    ${params} =   Create Dictionary   address=chicago     sensor=false
    ${result} =  get request  google    /json?  params=${params}    #8221
    should be equal as strings  ${result.status_code}  200
    ${json} =  Set Variable  ${result.json()}
    #${jsonObj} =  to json  ${result}

    ${status} =  Get From Dictionary  ${json}  status
    run keyword and expect error    OK != ok   Should Be Equal  ${status}  ok

Json Manip Test
    [Documentation]  Google Geo Code API
    [Tags]  api

    Create Session  google  http://maps.googleapis.com/maps/api/geocode
    ${params} =   Create Dictionary   address=chicago     sensor=false
    ${result} =  get request  google    /json?  params=${params}    #8221
    should be equal as strings  ${result.status_code}  200
    ${json} =  Set Variable  ${result.json()}
    set test variable   ${jsonObj}    ${result}
    log     ${jsonObj}
    ${status} =  Get From Dictionary  ${json}  status

