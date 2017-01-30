//
//  DataController.swift
//  battery study
//
//  Created by Marek Newton on 1/29/17.
//  Copyright © 2017 Marek Newton. All rights reserved.
//

import CoreData
import UIKit

public func getContext() -> NSManagedObjectContext {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    return appDelegate.persistentContainer.viewContext
}

public func getStudys() -> Array<Study> {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return []
    }
    
    let managedContext = appDelegate.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Study")
    
    do {
        return try managedContext.fetch(fetchRequest) as! [Study]
    } catch _ as NSError {
        return []
    }
}

public func storeStudy(startBattery: Float, endBattery: Float, date: Date) {
    let context = getContext()
    
    let study = NSEntityDescription.entity(forEntityName: "Study", in: context)
    let addStudy =  NSManagedObject(entity: study!, insertInto: context)
    
    addStudy.setValue(startBattery, forKey: "startBattery")
    addStudy.setValue(endBattery, forKey: "endBattery")
    addStudy.setValue(date, forKey: "date")
    
    do {
        try context.save()
        print("saved")
    } catch let error as NSError {
        print("could not save study \(error)")
    }
}

public func deleteStudy() {
    print("this will delete")
}
    
