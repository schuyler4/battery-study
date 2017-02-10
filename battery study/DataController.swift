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

public func storeStudy(batteryLoss: Float, date: Date, time: Int) {
    let context = getContext()
    
    let study = NSEntityDescription.entity(forEntityName: "Study", in: context)
    let newStudy =  NSManagedObject(entity: study!, insertInto: context)
    
    newStudy.setValue(batteryLoss, forKey: "batteryLoss")
    newStudy.setValue(date, forKey: "date")
    newStudy.setValue(time, forKey: "time")
    
    do {
        try context.save()
    } catch let error as NSError {
        print("could not save study \(error)")
    }
}

public func deleteStudy(index: Int) {
    let studys = getStudys()
    let context = getContext()
    
    do {
        context.delete(studys[index])
        try context.save()
    } catch let error as NSError {
        print("could not delete item \(error)")
    }
}
    
