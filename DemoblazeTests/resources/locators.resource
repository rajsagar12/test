*** Settings ***
Documentation    XPath locators for Demoblaze login page elements

*** Variables ***
# Login Modal Elements
${LOGIN_MODAL}                    xpath=//div[@id='logInModal']
${LOGIN_MODAL_TITLE}              xpath=//div[@id='logInModal']//h5[contains(text(),'Log in')]
${LOGIN_USERNAME_INPUT}           xpath=//div[@id='logInModal']//input[@id='loginusername']
${LOGIN_PASSWORD_INPUT}           xpath=//div[@id='logInModal']//input[@id='loginpassword']
${LOGIN_BUTTON}                   xpath=//div[@id='logInModal']//button[contains(text(),'Log in')]
${LOGIN_CLOSE_BUTTON}             xpath=//div[@id='logInModal']//button[@class='btn btn-secondary'][contains(text(),'Close')]

# Navigation Elements
${LOGIN_LINK}                     xpath=//a[@id='login2']
${LOGOUT_LINK}                    xpath=//a[@id='logout2']
${WELCOME_USER_TEXT}              xpath=//a[@id='nameofuser']

# Alert/Popup Elements
${ALERT_MODAL}                    xpath=//div[@class='sweet-alert showSweetAlert visible']
${ALERT_MESSAGE}                  xpath=//div[@class='sweet-alert showSweetAlert visible']//p
${ALERT_OK_BUTTON}                xpath=//div[@class='sweet-alert showSweetAlert visible']//button[contains(text(),'OK')]

