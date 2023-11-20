#!/bin/bash

# Set the path to Xcode
XCODE_PATH="/Applications/Xcode.app/Contents/MacOS/Xcode"

#Set Current Directory Path
CURRENT_DIRECTORY="$(dirname $0)"

# Set the path to the project
TEST_PROJECT_PATH="$CURRENT_DIRECTORY/ReferenceiOS.xcodeproj"


# Set the name of the test scheme
TEST_SCHEME_NAME="ReferenceiOSUITests"

# Set the path to the test plan
TEST_PLAN_PATH="ReferenceiOSUITestPlan"

# Set the output directory
OUTPUT_DIRECTORY="$CURRENT_DIRECTORY/ReferenceiOSUITests/TestReports"

#Set Report Time
NOW="$(date +"%d-%m-%y %H.%M.%S")"


# Execute the test plan using xcodebuild
#xcodebuild -project "$TEST_PROJECT_PATH" -scheme "$TEST_SCHEME_NAME"  -destination 'platform=iOS Simulator,OS=17.0.1,name=iPhone 15 Pro' test -testPlan "$TEST_PLAN_PATH" | xcpretty -r html -o "$OUTPUT_DIRECTORY/test_results$NOW.html" clean build
#Execute the test plan using fastlane
fastlane scan --project "$TEST_PROJECT_PATH" --scheme "$TEST_SCHEME_NAME" --device "iPhone 15 Pro" --testplan "$TEST_PLAN_PATH" --output_directory "$OUTPUT_DIRECTORY" --output_files "test_report_$NOW.html,test_report_$NOW.junit" clean
