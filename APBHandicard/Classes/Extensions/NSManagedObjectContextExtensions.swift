//
//  NSManagedObjectContextExtensions.swift
//  APBHandicard
//
//  Created by ApprovedBug on 12/08/2019.
//  Copyright © 2019 approvedbug. All rights reserved.
//

import UIKit
import CoreData

extension NSManagedObjectContext {

    // MARK: - Core Data Saving support

    func saveContext () {
        if hasChanges {
            do {
                try save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
