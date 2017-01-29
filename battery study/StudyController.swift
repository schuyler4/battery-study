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
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.populatePickerData()
        
        self.timePicker.dataSource = self
        self.timePicker.delegate = self
    }
    
    func populatePickerData() {
        for i in 1...60 {
            pickerData.append(String(i))
        }
    }
    
    func startStudy() {
       timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true);
    }
    
    func update() {
        print("updating")
    }
    
    func endStudy() {
        timer = Timer()
    }
    
    @IBAction func startButtonOnClick(_ sender: Any) {
        if(!studyGoing) {
            startButton.setTitle("quit study", for: .normal)
            studyGoing = true
            startStudy()
        } else {
            startButton.setTitle("start study", for: .normal)
            studyGoing = false
            endStudy()
        }
        
    }
    
}

