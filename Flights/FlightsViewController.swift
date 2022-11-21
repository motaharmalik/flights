//
//  FlightsViewController.swift
//  Flights
//
//  Created by Seymour Rodrigues on 21/11/2022.
//

import UIKit

class FlightsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}
extension FlightsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flightsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let flight = flightsData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? FlightsTableViewCell
        cell?.airlineName.text = flight.airlineName
        cell?.airport.text = flight.airport
        cell?.destination.text = flight.destination
        cell?.nameOfFlight.text = flight.nameOfFlight
        cell?.price.text = flight.price
        cell?.startTime.text = flight.startTime
        cell?.reachTime.text = flight.reachTime
        cell?.timeTaken.text = flight.timeTaken
        return cell!
    }
}
extension FlightsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let flight = flightsData[indexPath.row]
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "FlightDetailsViewController") as? FlightDetailsViewController
        vc?.fName = flight.airlineName
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
