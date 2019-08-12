//
//  CourseRepository.swift
//  APBHandicard
//
//  Created by ApprovedBug on 12/08/2019.
//  Copyright © 2019 approvedbug. All rights reserved.
//

import UIKit
import CoreData

class CourseRepository: NSObject {

    class func saveCourse(context: NSManagedObjectContext, courseName: String, holes: [HoleDTO]) {

        let course = NSEntityDescription.insertNewObject(forEntityName: "Course", into: context) as! CourseMO

        course.name = courseName

        for holeDto in holes {

            let hole = NSEntityDescription.insertNewObject(forEntityName: "Hole", into: context) as! HoleMO

            hole.number = holeDto.number!
            hole.par = holeDto.par!
            hole.strokeIndex = holeDto.strokeIndex!
            hole.yards = holeDto.yards!

            course.addToHoles(hole)
        }

        context.saveContext()
    }

    class func course(context: NSManagedObjectContext, courseName: String) -> [CourseMO]? {

        let request: NSFetchRequest<CourseMO> = CourseMO.fetchRequest()

        request.predicate = NSPredicate(format: "name contains[c] %@", courseName)

        do {
            let courses = try context.fetch(request)
            return courses
        } catch {
            print("Course search error: \(error)")
            return nil
        }
    }
}
