#!/bin/bash
# Shell script to run Robot Framework tests with Allure reporting

echo "========================================"
echo "Running Demoblaze Login Tests"
echo "========================================"

# Run tests with Allure listener
robot --listener allure_robotframework:reports/allure-results --outputdir reports tests/login_tests.robot

# Generate Allure report
echo ""
echo "========================================"
echo "Generating Allure Report"
echo "========================================"
allure generate reports/allure-results --clean -o reports/allure-report

echo ""
echo "========================================"
echo "Test execution completed!"
echo "========================================"
echo ""
echo "To view the Allure report, run:"
echo "    allure open reports/allure-report"
echo ""

