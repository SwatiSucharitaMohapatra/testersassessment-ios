//
//  PageAction.swift
//  ReferenceiOSUITests
//
//  Created by Swati Mohapatra on 17/11/2023.
//  Copyright © 2023 ABN AMRO. All rights reserved.
//

import XCTest

public class PageActions: BasePage {
    /// Overrides the default implementation of `rootElement` to specify that the root element of this page is the button.
    override var rootElement: XCUIElement {
        return button
    }
    
    /// Overrides the default `tapOnButton` method to perform a tap action on the `button` element and ignores the return value.
    @discardableResult
    override func tapOnButton(completion: Completion = nil) -> Self {
        super.tapOnButton()
    }
    
    /// Checks whether the provided element exists on the screen.
    /// - parameter element: The XCUIElement to check for presence.
    /// - returns: `true` if the element is present, `false` otherwise.
    override func isPresent(_ element: XCUIElement) -> Bool {
        super.isPresent(element)
    }
    
    /// Retrieves the text content of the provided XCUIElement.
    /// - parameter element: The XCUIElement whose text content is to be retrieved.
    /// - returns: The text content of the XCUIElement.
    override func getText(_ element: XCUIElement) -> String {
        super.getText(element)
    }
}
