//
//  EntryController.swift
//  battery study
//
//  Created by Marek Newton on 1/28/17.
//  Copyright © 2017 Marek Newton. All rights reserved.
//

import UIKit
import CoreData

class EntryController: UITableViewController {
    
    var studys = [Study]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studys = getStudys()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studys.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        let batteryLabel = cell?.viewWithTag(1) as! UILabel
        let dateLabel = cell?.viewWithTag(2) as! UILabel
        
        let batteryLoss = studys[indexPath.row].batteryLoss
        
        batteryLabel.text = String(batteryLoss) + "%"
        
        let date = studys[indexPath.row].date
        
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.long
        
        dateLabel.text = formatter.string(from: date as! Date)
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "detail") as! DetailController
        vc.date = studys[indexPath.row].date as! Date
        vc.batteryLoss = studys[indexPath.row].batteryLoss
        vc.time = Int(studys[indexPath.row].time)
        vc.index = indexPath.row
        self.present(vc, animated: true, completion: nil)
    }
    
}
