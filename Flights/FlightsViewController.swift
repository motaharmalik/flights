//
//  FlightsViewController.swift
//  Flights
//
//  Created by Seymour Rodrigues on 21/11/2022.
//

import UIKit


class FlightsViewController: UIViewController {
    
    var flights = [Flight]()
    
    @IBOutlet weak var filter: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        parseLocalJsonData()
    }
    
    @IBAction func searchTapped(_ sender: Any) {
        if filter.text!.isEmpty {
            self.tableView.reloadData()
            parseLocalJsonData()
            return
        }
        let filtered = self.flights.filter { $0.airport == filter.text || $0.price == filter.text }
        self.flights = filtered
        self.tableView.reloadData()
    }
    
    func parseLocalJsonData() {
        guard let url = Bundle.main.url(forResource:"flights", withExtension: ".json") else { return }
        guard let data = try? Data(contentsOf:url ) else { return }
                    
        let jsonDecoder = JSONDecoder()
        
        do {
            let flights = try jsonDecoder.decode([Flight].self, from: data)
            self.flights = flights
        }
        catch{
            print(error)
        }
  }
}
extension FlightsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.flights.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let flight = flights[indexPath.row]
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
        let flight = flights[indexPath.row]
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "FlightDetailsViewController") as? FlightDetailsViewController
        vc?.fName = flight.airlineName
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}


