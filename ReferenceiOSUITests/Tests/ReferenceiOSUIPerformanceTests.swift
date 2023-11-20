//
//  ReferenceiOSUIPerformanceTests.swift
//  ReferenceiOSUITests
//
//  Created by Swati Mohapatra on 20/11/2023.
//  Copyright © 2023 ABN AMRO. All rights reserved.
////  Performance Test Class
//  This class is available starting from iOS 13.0 and is designed to handle performance metric measurements.

import XCTest

@available(iOS 13.0, *)
class ReferenceiOSUIPerformanceTests: XCTestCase {
    /// Setup function
    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    /// TearDown function
    override func tearDown() {
        XCUIApplication().terminate()
    }
    
    // Function to perform a performance test for the Home Page button click
    func testHomePageButtonClickPerfomanceTest() {
        
        PerformanceMetricMeasures().measureOptions.iterationCount = 3
        
        // Measure the specified performance metrics for the given options i.e. iteration = 3
        measure(metrics:PerformanceMetricMeasures().metrics, options: PerformanceMetricMeasures().measureOptions) {
            HomePage().tapOnButton()
        }
    }
    
}
