*** Settings ***
Documentation    Reusable keywords for Demoblaze login functionality
Library          SeleniumLibrary
Library          OperatingSystem
Resource         locators.resource

*** Keywords ***
Open Demoblaze Website
    [Documentation]    Opens the Demoblaze website in Chrome browser
    Open Browser    https://www.demoblaze.com    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    ${LOGIN_LINK}    timeout=10s

Click Login Link
    [Documentation]    Clicks on the Login link in the navigation bar
    Wait Until Element Is Visible    ${LOGIN_LINK}    timeout=10s
    Click Element    ${LOGIN_LINK}
    Wait Until Element Is Visible    ${LOGIN_MODAL}    timeout=10s

Focus And Type Username
    [Documentation]    Simulates cursor focus (Mouse Over + Click) before typing username
    [Arguments]    ${username}
    Wait Until Element Is Visible    ${LOGIN_USERNAME_INPUT}    timeout=10s
    Mouse Over    ${LOGIN_USERNAME_INPUT}
    Click Element    ${LOGIN_USERNAME_INPUT}
    Clear Element Text    ${LOGIN_USERNAME_INPUT}
    Input Text    ${LOGIN_USERNAME_INPUT}    ${username}

Focus And Type Password
    [Documentation]    Simulates cursor focus (Mouse Over + Click) before typing password
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${LOGIN_PASSWORD_INPUT}    timeout=10s
    Mouse Over    ${LOGIN_PASSWORD_INPUT}
    Click Element    ${LOGIN_PASSWORD_INPUT}
    Clear Element Text    ${LOGIN_PASSWORD_INPUT}
    Input Text    ${LOGIN_PASSWORD_INPUT}    ${password}

Click Login Button
    [Documentation]    Clicks the Login button in the modal
    Wait Until Element Is Visible    ${LOGIN_BUTTON}    timeout=10s
    Click Element    ${LOGIN_BUTTON}

Take Screenshot For Allure
    [Documentation]    Takes a screenshot and attaches it to Allure report
    [Arguments]    ${screenshot_name}
    ${timestamp}=    Get Time    epoch
    ${screenshot_path}=    Set Variable    ${OUTPUT_DIR}/screenshots/${screenshot_name}_${timestamp}.png
    Create Directory    ${OUTPUT_DIR}/screenshots
    Capture Page Screenshot    ${screenshot_path}
    [Return]    ${screenshot_path}

Verify Successful Login
    [Documentation]    Verifies that login was successful by checking Welcome text
    Wait Until Element Is Visible    ${WELCOME_USER_TEXT}    timeout=10s
    Element Should Contain    ${WELCOME_USER_TEXT}    Welcome
    Take Screenshot For Allure    successful_login

Verify Failed Login Alert
    [Documentation]    Verifies that login failed by checking browser alert
    [Arguments]    ${expected_message}=User does not exist.
    ${alert_text}=    Handle Alert    timeout=10s    action=ACCEPT
    Should Contain    ${alert_text}    ${expected_message}
    Take Screenshot For Allure    failed_login_alert

Close Login Modal
    [Documentation]    Closes the login modal if it's open
    ${modal_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${LOGIN_MODAL}
    Run Keyword If    ${modal_visible}    Click Element    ${LOGIN_CLOSE_BUTTON}
    Run Keyword If    ${modal_visible}    Wait Until Element Is Not Visible    ${LOGIN_MODAL}    timeout=10s

Perform Login
    [Documentation]    Performs complete login flow
    [Arguments]    ${username}    ${password}
    Click Login Link
    Take Screenshot For Allure    login_modal_opened
    Focus And Type Username    ${username}
    Take Screenshot For Allure    username_entered
    Focus And Type Password    ${password}
    Take Screenshot For Allure    password_entered
    Click Login Button

Logout If Logged In
    [Documentation]    Logs out if user is currently logged in
    ${logout_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${LOGOUT_LINK}
    Run Keyword If    ${logout_visible}    Click Element    ${LOGOUT_LINK}
    Run Keyword If    ${logout_visible}    Wait Until Element Is Visible    ${LOGIN_LINK}    timeout=10s

