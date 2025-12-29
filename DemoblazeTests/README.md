# Demoblaze Login Automation Test Project

This project contains Robot Framework automation tests for the login functionality of https://www.demoblaze.com.

## Project Structure

```
DemoblazeTests/
├── resources/
│   ├── locators.resource          # XPath locators for all page elements
│   └── login_keywords.robot       # Reusable keywords for login operations
├── tests/
│   └── login_tests.robot          # Test cases (positive and negative)
├── reports/                        # Test reports and Allure results
├── allure_config.json             # Allure reporting configuration
├── requirements.txt               # Python dependencies
└── README.md                      # This file
```

## Features

- **Robot Framework** with **SeleniumLibrary** for browser automation
- **Allure Reporting** for detailed test reports
- **Page Object Structure** with separated locators and keywords
- **XPath Locators Only** (no CSS selectors)
- **Comprehensive Test Coverage**:
  - Positive login test (valid credentials)
  - Negative login tests (invalid username, invalid password, empty fields)
- **Screenshot Attachments** in Allure reports after each major action
- **Stable Waits** for all modal elements
- **Cursor Focus Simulation** (Mouse Over + Click) before typing

## Prerequisites

1. **Python 3.7+** installed
2. **Chrome Browser** installed
3. **ChromeDriver** - Will be managed automatically by Selenium 4.x

## Installation

1. **Clone or navigate to the project directory:**
   ```bash
   cd DemoblazeTests
   ```

2. **Create a virtual environment (recommended):**
   ```bash
   python -m venv venv
   ```

3. **Activate virtual environment:**
   - **Windows:**
     ```bash
     venv\Scripts\activate
     ```
   - **Linux/Mac:**
     ```bash
     source venv/bin/activate
     ```

4. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

5. **Install Allure Commandline (for viewing reports):**
   
   **Windows (using Chocolatey):**
   ```bash
   choco install allure
   ```
   
   **Or download manually:**
   - Download from: https://github.com/allure-framework/allure2/releases
   - Extract and add to PATH
   
   **Linux/Mac:**
   ```bash
   # Using Homebrew (Mac)
   brew install allure
   
   # Or download from releases page
   ```

## Running Tests

### Run All Tests

```bash
robot --outputdir reports tests/login_tests.robot
```

### Run with Allure Reporting

```bash
robot --listener allure_robotframework:reports/allure-results --outputdir reports tests/login_tests.robot
```

### Run Specific Test by Tag

```bash
# Run only positive tests
robot --include positive --outputdir reports tests/login_tests.robot

# Run only negative tests
robot --include negative --outputdir reports tests/login_tests.robot

# Run smoke tests
robot --include smoke --outputdir reports tests/login_tests.robot
```

### Run Specific Test Case

```bash
robot --test "Test Positive Login - Valid Credentials" --outputdir reports tests/login_tests.robot
```

## Viewing Allure Reports

### Generate Allure Report

After running tests with Allure listener, generate the report:

```bash
allure generate reports/allure-results --clean -o reports/allure-report
```

### Open Allure Report in Browser

```bash
allure open reports/allure-report
```

This will automatically open the Allure report in your default browser.

### Serve Allure Report (Alternative)

```bash
allure serve reports/allure-results
```

## Test Cases

### Positive Tests
- **Test Positive Login - Valid Credentials**: Tests successful login with valid username and password

### Negative Tests
- **Test Negative Login - Invalid Username**: Tests login failure with invalid username
- **Test Negative Login - Invalid Password**: Tests login failure with invalid password
- **Test Negative Login - Empty Username**: Tests login failure with empty username
- **Test Negative Login - Empty Password**: Tests login failure with empty password
- **Test Negative Login - Empty Username And Password**: Tests login failure with both fields empty

## Test Data

Test data is defined as variables in `tests/login_tests.robot`:
- `VALID_USERNAME`: Valid username for positive tests
- `VALID_PASSWORD`: Valid password for positive tests
- `INVALID_USERNAME`: Invalid username for negative tests
- `INVALID_PASSWORD`: Invalid password for negative tests
- `EMPTY_STRING`: Empty string for empty field tests

**Note:** You may need to register a valid account on https://www.demoblaze.com and update the `VALID_USERNAME` and `VALID_PASSWORD` variables accordingly.

## Key Features Implementation

### XPath Locators Only
All locators are defined in `resources/locators.resource` using XPath selectors only.

### Cursor Focus Simulation
The keywords `Focus And Type Username` and `Focus And Type Password` simulate cursor focus by:
1. Mouse Over the element
2. Click the element
3. Clear existing text
4. Input new text

### Screenshot Attachments
Screenshots are automatically captured and attached to Allure reports after:
- Opening login modal
- Entering username
- Entering password
- Clicking login button
- Successful login
- Failed login alerts

### Stable Waits
All keywords include explicit waits for element visibility before interaction to ensure test stability.

## Troubleshooting

### ChromeDriver Issues
If you encounter ChromeDriver version mismatch:
- Selenium 4.x automatically manages ChromeDriver
- Ensure Chrome browser is up to date
- If issues persist, manually download ChromeDriver from https://chromedriver.chromium.org/

### Allure Report Not Generating
- Ensure Allure commandline is installed and in PATH
- Check that `reports/allure-results` directory contains result files
- Verify Allure listener was used when running tests

### Tests Failing
- Verify internet connection
- Check if https://www.demoblaze.com is accessible
- Update test credentials if account credentials have changed
- Check browser console for JavaScript errors

## Output Files

After running tests, the following will be generated in `reports/`:
- `log.html` - Detailed test execution log
- `report.html` - Test execution report
- `output.xml` - Robot Framework output XML
- `allure-results/` - Allure test results (JSON files)
- `allure-report/` - Generated Allure HTML report
- `screenshots/` - Screenshots captured during test execution

## License

This project is for educational and testing purposes.

