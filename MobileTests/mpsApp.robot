*** Settings ***
Library         AppiumLibrary
Variables  lib.py

*** Variables ***

*** Test Cases ***
Open MPS App
    [Documentation]  Open MPS Android App On SauceLabs
    [Tags]  MPS App
    Open Application  ${APPIUMSERVER }  platformName=Android  deviceName=Samsung Galaxy S4 Emulator  app=sauce-storage:mps.apk  automationName=Appium  appPackage=com.test.mps.mpstest  appActivity=MainActivity
    Capture Page Screenshot
    [Teardown]  close application