//
//  ViewController.swift
//  battery study
//
//  Created by Marek Newton on 1/28/17.
//  Copyright © 2017 Marek Newton. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var startBatteryLabel: UILabel!
    @IBOutlet var endBatteryLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var percentLabel: UILabel!
    
    var date = Date()
    var startBattery = Float()
    var endBattery = Float()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.long
        
        dateLabel.text = formatter.string(from: date)
        startBatteryLabel.text = "start battery: \(String(Int(100 - startBattery)))%"
        endBatteryLabel.text = "end battery: \(String(Int(100 - endBattery)))%"
        percentLabel.text = "total: \(String(Int(-(startBattery - endBattery))))%"
    }
    
    @IBAction func deleteStudyOnClick(_ sender: Any) {
        print("deleting study")
    }
}

