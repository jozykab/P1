*** Settings ***
Library         AppiumLibrary
Variables  lib.py

*** Variables ***
*** Test Cases ***
Open MPS App on Sauce
    [Documentation]  Open MPS Android App On SauceLabs
    [Tags]  sauce
    Open Application    ${APPIUMSERVER}  platformName=${platformName}  deviceName=${deviceName}  app=${appRemoteSource}  automationName=appium  appPackage=${package}  appActivity=${appActivity}
    #Open Application    ${APPIUMSERVER}  platformName=Android  deviceName=Samsung Galaxy S4 Emulator  app=sauce-storage:mps.apk  automationName=appium  appPackage=com.test.mps.mpstest  appActivity=MainActivity
    Capture Page Screenshot

Open MPS App on Local
    [Documentation]  Open MPS Android App On Local Machine
    [Tags]  localOnly
    Open Application    ${LOCALAPPIUMSERVER}  platformName=${platformName}  deviceName=Nexus_5_API_23_x86 app=${appLocalSource}  automationName=Appium  appPackage=${package}  appActivity=${appActivity}
    #Open Application    ${APPIUMSERVER}  platformName=Android  deviceName=Samsung Galaxy S4 Emulator  app=sauce-storage:mps.apk  automationName=appium  appPackage=com.test.mps.mpstest  appActivity=MainActivity
    Capture Page Screenshot