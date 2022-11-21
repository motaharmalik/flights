//
//  FlightDetailsViewController.swift
//  Flights
//
//  Created by Seymour Rodrigues on 21/11/2022.
//

import UIKit

class FlightDetailsViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    
    var fName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        self.name.text = fName
    }
}
