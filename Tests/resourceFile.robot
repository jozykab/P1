*** Settings ***
Documentation  MPS Admin Access Tests
Library           Selenium2Library
Library  String
Library  variables.py
#Variables  variables

*** Variables ***
#${SERVER}         localhost:7272
${BROWSER}        ff
${DELAY}          0
#${VALID USER}     demo
#${VALID PASSWORD}    mode
#${LOGIN URL}      http://${SERVER}/
#${WELCOME URL}    http://${SERVER}/welcome.html
${URL}      http://o-stage-mps.nbcuni.com
${homePageLoginButton} =  //*[@id="maincontent"]/div/a/img
${nextButton} =  //*[@id="next"]
${signInButton} =  //*[@id="signIn"]
${siteXpath} =  //a[contains(@href, 'xxx')]
${userNameField} =  //*[@id='Email']
${passwordField} =  //*[@id='Passwd']
${nextButton} =  //*[@id='next']
${signInButton} =  //*[@id='signIn']

*** Keywords ***
Selectect Site
   [Arguments]    ${site}
    ${sitePath} =  replace string   ${siteXpath}   xxx   ${site}
    click element  ${sitePath}

Auth Page Should Be Open
    element should be visible  ${homePageLoginButton}
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
