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

var flightsData: [Flight] = [
    Flight(airport: "Manchester", destination: "rr", nameOfFlight: "abc", airlineName: "xyz", price: "4", startTime: "45", reachTime: "3", timeTaken: "2"),
    Flight(airport: "Manchester", destination: "rr", nameOfFlight: "abc", airlineName: "xyz", price: "4", startTime: "45", reachTime: "3", timeTaken: "2"),
    Flight(airport: "Manchester", destination: "rr", nameOfFlight: "abc", airlineName: "xyz", price: "4", startTime: "45", reachTime: "3", timeTaken: "2"),
    Flight(airport: "Manchester", destination: "rr", nameOfFlight: "abc", airlineName: "xyz", price: "4", startTime: "45", reachTime: "3", timeTaken: "2"),
    Flight(airport: "Manchester", destination: "rr", nameOfFlight: "abc", airlineName: "xyz", price: "4", startTime: "45", reachTime: "3", timeTaken: "2"),
    Flight(airport: "Manchester", destination: "rr", nameOfFlight: "abc", airlineName: "xyz", price: "4", startTime: "45", reachTime: "3", timeTaken: "2"),
    Flight(airport: "Manchester", destination: "rr", nameOfFlight: "abc", airlineName: "xyz", price: "4", startTime: "45", reachTime: "3", timeTaken: "2"),
    Flight(airport: "Manchester", destination: "rr", nameOfFlight: "abc", airlineName: "xyz", price: "4", startTime: "45", reachTime: "3", timeTaken: "2"),
    Flight(airport: "Manchester", destination: "rr", nameOfFlight: "abc", airlineName: "xyz", price: "4", startTime: "45", reachTime: "3", timeTaken: "2"),
    Flight(airport: "Manchester", destination: "rr", nameOfFlight: "abc", airlineName: "xyz", price: "4", startTime: "45", reachTime: "3", timeTaken: "2")
]
