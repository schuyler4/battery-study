//
//  SettingsController.swift
//  battery study
//
//  Created by Marek Newton on 1/28/17.
//  Copyright © 2017 Marek Newton. All rights reserved.
//

import UIKit

class StudyController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var timePicker: UIPickerView!
    @IBOutlet var timeProgresBar: UIProgressView!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var startButton: UIButton!
    
    var studyGoing = false
    var timer = Timer()
    
    var pickerData: [Int] = [Int]()
    var counter = 0
    
    var selectedRow = Int()
    
    var startBattery = Float()
    var endBattery = Float()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.populatePickerData()
        
        timeLabel?.text = "0"
        selectedRow = pickerData[timePicker.selectedRow(inComponent: 0)]
        timeProgresBar.progress = 0.0
        UIDevice.current.isBatteryMonitoringEnabled = true
    }
    
    var batteryLevel: Float {
        return UIDevice.current.batteryLevel
    }
    
    func populatePickerData() {
        for i in 1...60 {
            pickerData.append(i)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if row == 0 {
            return String(row + 1) + " minute"
        } else {
            return String(row + 1) + " minutes"
        }
    }
    
    func startStudy() {
        startBattery = batteryLevel
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        timePicker.isHidden = true
        print(selectedRow)
    }
    
    func update() {
        counter += 1
        timeLabel.text = String(counter)
        timeProgresBar.progress = Float(counter / selectedRow / 10)
        if counter == selectedRow * 60 {
            endStudy(done: true)
        }
    }
    
    func endStudy(done: Bool) {
        timer.invalidate()
        timePicker.isHidden = false
        timeLabel.text = "0"
        counter = 0
        timeProgresBar.progress = 0.0
        
        if done {
            endBattery = batteryLevel
            showSaveAlert()
        }
    }
    
    func showSaveAlert() {
        let alert = UIAlertController(title: "Study Done", message: "would you like to save this study", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: {action in self.saveStudy()}))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func saveStudy() {
        storeStudy(startBattery: self.startBattery, endBattery: self.endBattery, date: Date())
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Entry") as! EntryController
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func startButtonOnClick(_ sender: Any) {
        if !studyGoing {
            startButton.setTitle("quit study", for: .normal)
            studyGoing = true
            startStudy()
        } else {
            startButton.setTitle("start study", for: .normal)
            studyGoing = false
            endStudy(done: false)
        }
    }
    
}

