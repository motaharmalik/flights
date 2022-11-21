//
//  FlightsViewModel.swift
//  Flights
//
//  Created by motahar malik on 21/11/2022.
//

import Foundation
import UIKit


class FlightsViewModel{
    var refreshUI : (() -> ())?
    var flights : [Flight]?{
        didSet {
            self.refreshUI?()
            
        }
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
    
    func onClickedSearchButton(filter : String, tableView : UITableView) {
        if filter.isEmpty {
            self.parseLocalJsonData()

            tableView.reloadData()
            return
        }
        let filtered = self.flights?.filter { $0.airport == filter || $0.price == filter}
        self.flights = filtered
        tableView.reloadData()
    }
        
}
