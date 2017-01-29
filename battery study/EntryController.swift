//
//  EntryController.swift
//  battery study
//
//  Created by Marek Newton on 1/28/17.
//  Copyright © 2017 Marek Newton. All rights reserved.
//

import UIKit

class EntryController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let userDefaults = UserDefaults.standard
        
        if(!userDefaults.bool(forKey: "studyGoing")) {
            self.showAlert()
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Settings", message: "You need to configure some settings before you can start your study", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {(action: UIAlertAction!) in self.goToSettings()})
        let laterAction = UIAlertAction(title: "Later", style: UIAlertActionStyle.default, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(laterAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func goToSettings() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "settings") as! StudyController
        self.present(vc, animated: true, completion: nil)
        
    }
    
}
