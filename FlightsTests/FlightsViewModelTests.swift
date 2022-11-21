//
//  FloghtsViewModelTests.swift
//  FlightsTests
//
//  Created by Seymour Rodrigues on 21/11/2022.
//

import XCTest
@testable import Flights

final class FlightsViewModelTests: XCTestCase {

    func testParseLocalJsonData() {
        let flightsViewModel = FlightsViewModel()
        
        let count = flightsViewModel.flights?.count ?? 0
        XCTAssertEqual(count, 0)
        flightsViewModel.parseLocalJsonData()
        
        XCTAssertGreaterThan(flightsViewModel.flights!.count, 0)

        XCTAssertEqual(flightsViewModel.flights?
            .count, 10)
        
        XCTAssertEqual(flightsViewModel.flights?[0].airport, "London Heathrow")

    }
}
