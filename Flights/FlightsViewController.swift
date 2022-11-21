//
//  FlightsViewController.swift
//  Flights
//
//  Created by Seymour Rodrigues on 21/11/2022.
//

import UIKit


class FlightsViewController: UIViewController {
    
    
    var viewModel = FlightsViewModel()
    var flights = [Flight]()
    @IBOutlet weak var filter: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        viewModel.parseLocalJsonData()

        viewModel.refreshUI = {
            self.tableView.reloadData()
        }
    }
    
    @IBAction func searchTapped(_ sender: Any) {
        viewModel.onClickedSearchButton(filter: filter.text!, tableView: self.tableView)
    }
    
}
extension FlightsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.flights?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let flight = viewModel.flights?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? FlightsTableViewCell
        cell?.airlineName.text = flight?.airlineName
        cell?.airport.text = flight?.airport
        cell?.destination.text = flight?.destination
        cell?.nameOfFlight.text = flight?.nameOfFlight
        cell?.price.text = flight?.price
        cell?.startTime.text = flight?.startTime
        cell?.reachTime.text = flight?.reachTime
        cell?.timeTaken.text = flight?.timeTaken
        return cell!
    }
}
extension FlightsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let flight = viewModel.flights?[indexPath.row]
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "FlightDetailsViewController") as? FlightDetailsViewController
        vc?.fName = flight!.airlineName
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}


