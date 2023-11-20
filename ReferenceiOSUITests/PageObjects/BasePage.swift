//
//  BasePage.swift
//  ReferenceiOSUITests
//
//  Created by Swati Mohapatra on 17/11/2023.
//  Copyright © 2023 ABN AMRO. All rights reserved.
//

import XCTest

class Logger {
    func log(_ log: String) {
        NSLog(log)
    }
}

public class BasePage {
    /// Defines a typealias `Completion` that represents an optional completion handler function that takes no arguments and returns nothing.
    typealias Completion = (() -> Void)?
    /// Application initialization
    let app = XCUIApplication()
    /// Logger initialization
    let log = Logger().log
    
    // Initializes the page object and waits for the root element to appear within the specified timeout.

    /// - parameter timeout: The maximum time to wait for the root element to appear, in seconds. The default value is 10 seconds.
    /// - parameter completion: An optional completion handler to be called after the initialization is complete.
    required init(timeout: TimeInterval = 10, completion: Completion = nil) {
        log("Waiting for element \(String(describing: self)) for \(timeout) seconds")
        XCTAssert(rootElement.waitForExistence(timeout: timeout),
                  "Element \(String(describing: self)) not found")
        completion?()
    }
    
    /// The root element of the page, which is typically a container element. Subclasses must override this variable to provide the specific root element for the page they represent.
    var rootElement: XCUIElement {
        fatalError("subclass override the root element")
    }
    
    /// Button Root Element
    var button: XCUIElement {
        return app.buttons[PageElements.buttonAccessibilityID]
    }
    
    /// Static Text Field Root Element
    func staticTextField(_ name: String) -> XCUIElement {
        return app.staticTexts[name]
    }
    
    /// Static Text Field Root Element
    var staticTextFieldFirstElement: XCUIElement {
        return app.staticTexts.firstMatch
    }
    
    /// Puts app in Background
    func backgroundApp() {
        log("Backgrounding the app")
        XCUIDevice.shared.press(.home)
    }
    
    /// Brings the app to Forground
    func activateApp() {
        log("Activating the app")
        app.activate()
    }
    
    /// Removes the currency symbol for the Netherlands from the provided amount string.
    /// - parameter amount: The amount string from which to remove the currency symbol.
    /// - returns: The amount string without the currency symbol.
    func removeCurrencySymbol(from amount: String) -> String {
        log("Removing Currency Code from the amount")
        return amount.replacingOccurrences(of: getCurrencySymbol(for: CountryIdentifiers.netherlands.rawValue), with: "")
    }
    
    /// Performs a tap action on the root element of the page, which is typically a button.
    /// - parameter completion: An optional completion handler to be called after the tap action is complete.
    /// - returns: Self, which allows chaining of methods.
    @discardableResult
    func tapOnButton(completion: Completion = nil) -> Self {
        log("Tapping on Button\(rootElement.description)")
        rootElement.tap()
        completion?()
        return self
    }
    
    /// Checks whether the provided XCUIElement exists on the screen.
    /// - parameter element: The XCUIElement to check for presence.
    /// - returns: A Boolean value indicating whether the XCUIElement is present.
    func isPresent(_ element: XCUIElement) -> Bool {
        log("Verifying if \(element.description) Present")
        return element.waitForExistence(timeout: 1)
    }
    
    /// Retrieves the text content of the provided XCUIElement.
    /// - parameter element: The XCUIElement whose text content is to be retrieved.
    /// - returns: The text content of the XCUIElement.
    func getText(_ element: XCUIElement) -> String {
        let text = element.label
        log("Text for \(element.description) is \(text)")
        return text
    }
    
    /// Extracts the decimal component from the provided amount string and returns its length.
    /// - parameter amount: The amount string from which to extract the decimal component.
    /// - returns: The length of the decimal component, or 0 if the amount string does not contain a decimal point.
    func getDecimalCount(from amount: String) -> Int {
        let decimalNumbers = amount.components(separatedBy: ",")
        log("Decimal Numbers extracted from \(amount) are\(decimalNumbers)")
        // Check if there are multiple parts after splitting then returns the count
        if decimalNumbers.count > 1 {
            return decimalNumbers[1].count
        } else {
            return 0 // Return 0 if there's no decimal fraction in the amount
        }
    }
    
    /// Converts the given amount string into a float value, assuming the currency symbol is "€" and the locale is Netherlands.
    ///
    /// - parameter amountString: The amount string to be converted.
    /// - parameter countryIdentifier: The identifier of the country to use for currency symbol and locale.
    /// - returns: The float value of the amount string, or 0 if the format is invalid.
    func getAmount(from amountString: String, for countryIdentifier: String) -> Float {
        let amountString = removeCurrencySymbol(from: amountString)
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: countryIdentifier)
        formatter.numberStyle = .decimal
        log("Exact Amount from \(amountString)")
        // Try to convert the formatted string to a floating-point number
        if let number = formatter.number(from: amountString) {
            return number.floatValue
        } else {
            return 0 // Invalid format
        }
    }
    
    /// Retrieves the currency symbol for the specified country identifier.
    /// - parameter countryIdentifier: The identifier of the country for which to retrieve the currency symbol.
    /// - returns: The currency symbol for the specified country identifier.
    func getCurrencySymbol(for countryIdentifier: String) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: countryIdentifier)
        let currencyCodeString = formatter.currencySymbol.description
        log("Currency Symbol for \(CountryIdentifiers.netherlands.rawValue) is \(currencyCodeString)")
        return currencyCodeString
    }
}
