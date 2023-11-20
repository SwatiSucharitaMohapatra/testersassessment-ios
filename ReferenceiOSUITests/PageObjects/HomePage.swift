//
//  CurrencyConverterPage.swift
//  ReferenceiOSUITests
//
//  Created by Swati Mohapatra on 17/11/2023.
//  Copyright © 2023 ABN AMRO. All rights reserved.
// Represents the home page of the application.

import XCTest

public class HomePage: BasePage {
    /// The root element of the home page.
    ///
    /// - Returns: The root element of the home page.
    override var rootElement: XCUIElement { return button }
    
    /// A reference to the static text element with the identifier "helloStaticText" on the page.
    lazy var helloStaticText = app.staticTexts[PageElements.helloStaticText]
    
    /// A reference to the first static text element found on the page.
    lazy var amountStaticText = app.staticTexts.firstMatch
    
    /// Tapping on the Launch page button
    ///
    /// - Parameter completion: The completion handler to call when the button is tapped. The completion handler takes no parameters.
    /// - Returns: Self
    @discardableResult
    func tapOnHomePageButton(completion: Completion = nil) -> Self {
        PageActions().tapOnButton()
        return self
    }
    
    /// Check the button availability on home screen
    /// - Returns: A Boolean value indicating whether the button is present.
    func isButtonPresent() -> Bool {
        PageActions().isPresent(
            super.button
        )
    }
    
    /// Check if the text element is present  on home Screen
    /// - Returns: A Boolean value for the Hello Text Field is present
    func isHelloTextFieldPresent() -> Bool {
        PageActions().isPresent(
            super.staticTextField(PageElements.helloStaticText)
        )
    }
    
    /// Get the initial text appearing on the Home page text field after the 1st launch of app
    /// - Returns: Get Hello text string from the Hello text field element
    func getHelloText() -> String {
        log(
            "Tapping on Button"
        )
        return PageActions().getText(
            super.staticTextField(PageElements.helloStaticText)
        )
    }
    
    /// Retrieve Home page Button text
    /// - Returns: Get Button text string
    func getButtonText() -> String {
        log(
            "Tapping on Button"
        )
        return PageActions().getText(super.button)
    }
    
    /// Get the Amount String from the Text Field element from Home screen
    /// - Returns: Generated amount string after the button clicked
    func getAmountString() -> String {
        return PageActions().getText(
            super.staticTextFieldFirstElement
        )
    }
    
    /// Check the number generated are random each time for the specified number of clicks and doesn't match with the previous one
    /// - Parameter numberOfClicks: Number of clicks happening on the button
    /// - Returns: Boolean flag to validate app is active and all the elements present
    /// - For Loop :  Continue until Number of clicks or until the amount euqal flag is false
    func validateRandomNumber(
        forNumberClicks numberOfCliks: Int) -> Bool
    {
        var isNotSame = false
        for _ in 1...numberOfCliks {
            let prevCurrencyValue = getAmountString()
            PageActions().tapOnButton()
            let newCurrencyValue = getAmountString()
            
            guard
                prevCurrencyValue == newCurrencyValue
            else {
                isNotSame = true
                continue
            }
        }
        return isNotSame
    }
    
    /// Check the number generated are random each time for the specified number of clicks and doesn't match with the previous one
    /// - Parameter numberOfClicks: Number of clicks happening on the button
    /// - Returns: Boolean flag to validate app is active and all the elements present
    /// - For Loop : Continue until Number of clicks or until the flag is false
    func verifyAppDoesnotCrashWhenButtonClicked(forNumberTaps numberOfCliks: Int) -> Bool {
        var exists = false
        for _ in 1...numberOfCliks {
            tapOnHomePageButton()
            guard UIApplication.shared.applicationState == .inactive && isButtonPresent() == exists else {
                exists = true
                continue
            }
        }
        return exists
    }
    
    /// Overrides getCurrencySymbol() method from Super Class
    /// - parameter countryIdentifier: The identifier of the country for which to retrieve the currency symbol.
    /// - returns: The currency symbol for the specified country identifier.
    override func getCurrencySymbol(for countryIdentifier: String) -> String {
        super.getCurrencySymbol(for: countryIdentifier)
    }
    
    /// Overrides getAmount() method from Super Class
    /// - Parameter amountString: Generated Amount String
    /// - parameter countryIdentifier: The identifier of the country to use for currency symbol and locale.
    /// - Returns: Float value of the generated and formatted Amount
    override func getAmount(from amountString: String, for countryIdentifier: String) -> Float {
        super.getAmount(
            from: amountString, for: countryIdentifier
        )
    }
    
    /// Check the amount generated on screen is between 100-99999999 range
    /// - Parameter amount: Generated and formatted Amount String without the currency symbol
    /// - parameter countryIdentifier: The identifier of the country to use for currency symbol and locale.
    /// - Returns : Boolean Flag for the verification of generated amount range
    /// - Loop : if loop to check amount range
    func validateAmountRange(for amount: String, for countryIdentifier: String) -> Bool {
        var isInRange = false
        log(
            "Checking amount is greater than 100 and less than 99999999"
        )
        if 100...99999999 ~= getAmount(
            from: amount, for: countryIdentifier
        ) {
            isInRange = true
        }
        return isInRange
    }
}
