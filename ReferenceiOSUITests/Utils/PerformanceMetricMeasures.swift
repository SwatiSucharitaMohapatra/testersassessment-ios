//
//  PerformanceMeasures.swift
//  ReferenceiOSUITests
//
//  Created by Swati Mohapatra on 20/11/2023.
//  Copyright © 2023 ABN AMRO. All rights reserved.
//  PerformanceMetricMeasures Class
//  This class is available starting from iOS 13.0 and is designed to handle performance metric measurements.

import XCTest

@available(iOS 13.0, *)
public class PerformanceMetricMeasures {
    /// Array of XCTMetric objects representing different performance metrics to measure
    let metrics: [XCTMetric] = [XCTMemoryMetric(), XCTStorageMetric(), XCTClockMetric()]
    /// XCTMeasureOptions instance with default settings
    let measureOptions = XCTMeasureOptions.default
}
