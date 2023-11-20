#Mobile Automation Assessment Project

Dear Team,

I trust this message finds you well. I would like to express my gratitude for providing me with the opportunity to
complete the recent assignment. I appreciate your understanding and patience during the timeline, which was influenced by my visit to India to spend time with my parents and attend a family function.

Below, I have outlined the details about the framework and the test scenarios created

##Overview

This repository contains the codebase for ABN Amro Mobile test app Automation Assessment project created by Swati. The purpose of this project is to perform automated testing on the mobile application to ensure its UI functionality and UI performance

##Test Cases Covered:

TC1: Validating Home Page Button
TC2: Validate Home Page Text Field
TC3: Validate Button is Tappable
TC4: Validate Amount is Generated after Button Clicked
TC5: Validate Amount Value is Random
TC6: Validate Amount Formatting (Decimal, Range, Currency Symbol)
TC7: Validate Amount Value not Resetting to Hello after App Backgrounding
TC8: Validate App Stability on Multiple Button Clicks

##Project Structure

The project is organized into the following main components:

Tests:
------
This directory holds all the test cases designed for the assessment. Each test case is responsible for validating specific features and functionalities of the mobile application.

Page Objects:
------------
The Page Objects directory contains classes that represent different pages/screens of the mobile application. These classes encapsulate the interactions and actions that can be performed on each page.

Utils:
--------
Utilities, such as data and element identifiers, are stored in this directory. It includes helper classes and functions that assist in test execution.

Test Reports:
------------
Executed test reports are stored in this directory. Each report includes a date and time stamp for easy reference.

Test Plan:
----------
This document outlines all the test plans for the assessment, providing a comprehensive overview of the testing strategy and scope.


## Test Execution
The execution of the automation scripts can be carried out through the following methods:
run command in terminal - /path/to/the/script/runUITests.sh

Xcodebuild Script:
----------------
The script is available but commented out in the file. Uncomment and modify it based on your requirements for execution.


Fastlane:
---------
The project includes a Fastlane script for streamlined execution. The script is parameterized with Project, Scheme, Device, Test Plan, Test Report path, and report name and format.

##Git Commands:

- git clone git@github.com:SwatiSucharitaMohapatra/testersassessment-ios.git
- git pull
- git status : Check repo status
- git add/rm (use add or rm as per the required function)
- git commit -m "<message>"
- git push origin <branch name>


##How to Run the Tests
To execute the automated tests, follow these steps:
--------------------------------------------------
1 - Ensure that the necessary dependencies are installed.
2 - Configure the test execution parameters in the Fastlane script or uncomment and modify the Xcodebuild script.
3 - Run the chosen script to execute the tests.
4 - Review the generated test reports in the Test Reports directory for insights into test outcomes.


##Contact
For any inquiries or assistance, please contact:

Name: Swati Sucharita Mohapatra
Email: swati.sucharita39@gmail.com
