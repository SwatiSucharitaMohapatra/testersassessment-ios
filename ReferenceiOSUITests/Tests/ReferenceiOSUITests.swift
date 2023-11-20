//
//  LaunchActivityTests.swift
//  ReferenceiOSUITests
//
//  Created by Swati Mohapatra on 17/11/2023.
//  Copyright © 2023 ABN AMRO. All rights reserved.
//
// This test suite is to validate test cases for app created by ABN AMRO amount generate function

import XCTest

class ReferenceiOSUITests: XCTestCase {
    /// Setup function
    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    /// TearDown function
    override func tearDown() {
        XCUIApplication().terminate()
    }
    
    /// This test verifies the Launch Page elements and if Hello texts present at first launch
    func testLaunchPageButton() {
        XCTAssertTrue(HomePage()
            .isButtonPresent(),
            "Button doesn't present on Launch Page") // Asserts true if the Button Page element present
        
        XCTAssertEqual(HomePage()
            .getButtonText(), "Button",
            "Retrieved Button text isn't correct, button text is \(HomePage().getButtonText())") // Asserts true if the Button Page element present
    }
    
    /// This test verifies the Launch Page elements and if Hello texts present at first launch
    func testLaunchPageTextField() {
        XCTAssertTrue(HomePage().isHelloTextFieldPresent(),
                      "Currency Static Text Field doesn't present on Launch Page") // Asserts true if Hello Text Field Page element present
        
        XCTAssertEqual(HomePage()
            .getHelloText(), "Hello",
            "Text Field value doen't match") // Asserts euqals if Hello text presents on Page
    }
    
    /// This test verifies if the Launch Page Button is tappable
    func testLaunchPageButtonIsTappable() {
        XCTAssertTrue(HomePage()
            .button
            .isHittable,
            "Button is not tappable") // Asserts True if the button is hittable
    }
    
    /// This test verifies if Amount is generated after user taps on the Button
    func testGenerateAmount() {
        XCTAssertFalse(HomePage()
            .tapOnHomePageButton()
            .isHelloTextFieldPresent()) // Asserts that Hello text dissapears after user taps on button
        
        XCTAssertTrue(HomePage()
            .getAmountString()
            .contains(HomePage().getCurrencySymbol(for: CountryIdentifiers.netherlands.rawValue)),
            "Currency value is\(HomePage().getAmountString())") // Asserts True if the Currency Symbol presents
    }
    
    /// This test verifies if the generated Amount String is random
    func testAmountValueGeneratedingRandomValues() {
        XCTAssertTrue(HomePage()
            .validateRandomNumber(forNumberClicks: 2),
            "Different Random number did not generated After clicking button") // Asserts true if the recently generated amount doesn't match with previously generated amount
    }
    
    /// This test verifies the currency formatting i.e. decimal number count, Currency range and Currency symbol present
    func testAmountFormatting() {
        XCTAssertEqual(HomePage()
            .tapOnHomePageButton()
            .getDecimalCount(from: HomePage().getAmountString()), 2,
            "Decimal point count is not 2, decimal count is \(HomePage().getDecimalCount(from: HomePage().getAmountString()))") //
        
        XCTAssertTrue(HomePage()
            .validateAmountRange(for: HomePage().getAmountString(), for: CountryIdentifiers.netherlands.rawValue),
            "Amount is not within the specified range") // Asserts true if generated amount is greater than 100 and less than 99999999
        
        XCTAssertTrue(HomePage()
            .getAmountString()
            .contains(HomePage().getCurrencySymbol(for: CountryIdentifiers.netherlands.rawValue)),
            "Currency value is\(HomePage().getAmountString())") // Asserts True if the Currency Symbol presents
    }
    
    /// This test verifies the generated Amount text is not reseting to hello if the app is backgrounded and forgrounded
    func testValueNotResetToHelloWhenAppBackground() {
        XCTAssertTrue(HomePage()
            .tapOnHomePageButton()
            .getAmountString()
            .contains(HomePage().getCurrencySymbol(for: CountryIdentifiers.netherlands.rawValue)),
            "Currency value is\(HomePage().getAmountString())") // Asserts true that Amount is generated after user tapped on Button
        
        // App Backgrounded then foregrounded
        HomePage().backgroundApp()
        HomePage().activateApp()
        
        XCTAssertFalse(HomePage().isHelloTextFieldPresent(),
                       "Currency Static Text Field doesn't present on Launch Page") // Asserts that the hello button doesn't present
    }
    
    /// This test verifies that app is not crashing or unexpected closing if button is clicked for multiple times
    func testAppNotCrashingAfterMultipleButtonTap() {
        XCTAssertTrue(HomePage().verifyAppDoesnotCrashWhenButtonClicked(forNumberTaps: 5),
                      "App either crashed or something unexpected happend when button is tapped for") // Asserts true if app is present and the elements are present after given number of taps
    }
}
