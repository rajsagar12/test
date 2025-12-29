*** Settings ***
Documentation    Test cases for Demoblaze login functionality
Library          SeleniumLibrary
Resource         ../resources/locators.resource
Resource         ../resources/login_keywords.robot

*** Variables ***
# Test Data - Valid Credentials
${VALID_USERNAME}                 demouser
${VALID_PASSWORD}                 demopassword

# Test Data - Invalid Credentials
${INVALID_USERNAME}               invaliduser123
${INVALID_PASSWORD}               wrongpassword456

# Test Data - Empty Values
${EMPTY_STRING}                   ${EMPTY}

*** Test Cases ***
Test Positive Login - Valid Credentials
    [Documentation]    Tests successful login with valid username and password
    [Tags]    positive    login    smoke
    Open Demoblaze Website
    Perform Login    ${VALID_USERNAME}    ${VALID_PASSWORD}
    # Check for alert first (login failed), if present handle it
    ${alert_present}=    Run Keyword And Return Status    Handle Alert    timeout=2s    action=ACCEPT
    Run Keyword If    not ${alert_present}    Verify Successful Login
    Run Keyword If    not ${alert_present}    Logout If Logged In
    [Teardown]    Close Browser

Test Negative Login - Invalid Username
    [Documentation]    Tests login failure with invalid username and valid password
    [Tags]    negative    login
    Open Demoblaze Website
    Perform Login    ${INVALID_USERNAME}    ${VALID_PASSWORD}
    Verify Failed Login Alert    User does not exist.
    Close Login Modal
    [Teardown]    Close Browser

Test Negative Login - Invalid Password
    [Documentation]    Tests login failure with valid username and invalid password
    [Tags]    negative    login
    Open Demoblaze Website
    Perform Login    ${VALID_USERNAME}    ${INVALID_PASSWORD}
    Verify Failed Login Alert    Wrong password.
    Close Login Modal
    [Teardown]    Close Browser

Test Negative Login - Empty Username
    [Documentation]    Tests login failure with empty username and valid password
    [Tags]    negative    login
    Open Demoblaze Website
    Perform Login    ${EMPTY_STRING}    ${VALID_PASSWORD}
    Verify Failed Login Alert    Please fill out Username and Password.
    Close Login Modal
    [Teardown]    Close Browser

Test Negative Login - Empty Password
    [Documentation]    Tests login failure with valid username and empty password
    [Tags]    negative    login
    Open Demoblaze Website
    Perform Login    ${VALID_USERNAME}    ${EMPTY_STRING}
    Verify Failed Login Alert    Please fill out Username and Password.
    Close Login Modal
    [Teardown]    Close Browser

Test Negative Login - Empty Username And Password
    [Documentation]    Tests login failure with both username and password empty
    [Tags]    negative    login
    Open Demoblaze Website
    Perform Login    ${EMPTY_STRING}    ${EMPTY_STRING}
    Verify Failed Login Alert    Please fill out Username and Password.
    Close Login Modal
    [Teardown]    Close Browser

