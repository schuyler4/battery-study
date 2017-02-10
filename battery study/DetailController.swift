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
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var percentLabel: UILabel!
    
    var date = Date()
    var batteryLoss = Float()
    var time = Int()
    var index = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.long
        
        dateLabel.text = formatter.string(from: date)
        timeLabel.text = "time: \(String(time)):00"
        percentLabel.text = "loss: \(String(Int(batteryLoss)))%"
    }
    
    @IBAction func deleteStudyOnClick(_ sender: Any) {
        let alert = UIAlertController(title: "Delete", message: "are you sure??", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: {action in self.delete()}))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func delete() {
        deleteStudy(index: index)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Entry") as! EntryController
        self.present(vc, animated: true, completion: nil)
    }
}

