*** Settings ***
Documentation  MPS Admin Access Tests
Library           Selenium2Library
Library  String
Variables  variables.py

*** Variables ***

*** Keywords ***

Selectect Site
   [Arguments]    ${site}
    ${sitePath} =  replace string   ${siteXpath}   xxx   ${site}
    click element  ${sitePath}

Auth Page Should Be Open
    Title Should Be    MPS (stage) Authenticate • Oauth2

Sitechooser Page Should Be Open
    Title Should Be    MPS (stage) Sitechooser


Go To Login Page
    click element   ${homePageLoginButton}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Sign in - Google Accounts

Home Page Should Be Open
    Title Should Be    MPS (stage) Master Page Service

Input Username
    [Arguments]    ${username}
    wait until element is visible  ${usernamefield}
    Input Text    ${userNameField}    ${username}
    click button  ${nextbutton}

Input Password
    [Arguments]    ${password}
    wait until element is visible  ${passwordfield}
    Input Text    ${passwordfield}    ${password}
    click button  ${signinbutton}


Submit Credentials
    Click Button    ${signInButton}

Welcome Page Should Be Open

*** Test Cases ***

Open Choose Site Page
    [Documentation]  Selecting a site
    [Tags]  login

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sitechooser Page Should Be Open
    capture page screenshot  scrcap/siteChooser.png
    Selectect Site  bravo-web
    Auth Page Should Be Open
    Go To Login Page
    Input Username  ${mpsUser}
    Input Password  ${mpsPassword}
    Home Page Should Be Open
    [Teardown]  close browser
