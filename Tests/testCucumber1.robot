*** Settings ***
Library           Selenium2Library
Resource  resourceFile.robot

*** Test Cases ***
Choose Site
    [Documentation]  Selecting a site
    [Tags]  login
    Given User navigates on MPS Home page
    When User clicks on a site
    Then User should be promted to login
    capture page screenshot     scrcap/selectsite.png
    [Teardown]  close browser

Log In

    [Documentation]  Logging In MPS
    [Tags]  login
    Given User is on MPS Site choose page
    When User clicks on log in
    And User should be promted to enter username
    capture page screenshot     scrcap/login1.png
    And User should be promted to enter password
    capture page screenshot     scrcap/login2.png
    Then user should be logged into MPS Admin
    capture page screenshot     scrcap/login3.png
    [Teardown]  close browser

*** Keywords ***
User navigates on MPS Home page
    Open Browser    ${URL}    ${BROWSER}
    sitechooser page should be open

User clicks on a site
    selectect site  test-web

User should be promted to login
    auth page should be open

User is on MPS Site choose page
    User navigates on MPS Home page
    User clicks on a site
User clicks on log in
    Go To Login Page
User should be promted to enter username
    input username   ${mpsUser}

User should be promted to enter password
  input password  ${mpsPassword}
user should be logged into MPS Admin
    Home Page Should Be Open