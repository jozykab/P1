*** Settings ***
Library  Selenium2Library
Variables  variables.py


*** Variables ***
${VARIABLE}            An example string
${ANOTHER VARIABLE}    This is pretty easy!
@{STRINGS}             one          two           kolme         four
&{MAPPING}             one=1     two=2      three=3
@{ANIMALS}             cat          dog
&{FINNISH}             cat=kissa    dog=koira
${annonces}     //*[@id="categoryBar"]/ul/li[1]/a/img
*** Test Cases ***
Open Annuaire Congo
    [Documentation]  Open Annuaire Congo's homepage and navigates to some pages
    [Setup]  Open Browser    ${vc}
    [Tags]  VC
    Page Should Contain     Bienvenue sur AnnuaireCongo!

    wait until element is visible     ${annonces}
    click element  ${annonces}

    [Teardown]    End Test

*** Keywords ***
End Test
    capture page screenshot  scrcap/ac.png
    close browser
