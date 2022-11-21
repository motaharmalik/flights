//
//  FlightsModel.swift
//  Flights
//
//  Created by motahar malik on 21/11/2022.
//

import Foundation

struct Flight: Decodable {
    var airport: String
    var destination: String
    var nameOfFlight: String
    var airlineName: String
    var price: String
    var startTime: String
    var reachTime: String
    var timeTaken: String
}
