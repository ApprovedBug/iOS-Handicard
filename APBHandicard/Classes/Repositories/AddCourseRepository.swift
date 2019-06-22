//
//  AddCourseRepository.swift
//  APBHandicard
//
//  Created by ApprovedBug on 21/06/2019.
//  Copyright © 2019 ApprovedBug. All rights reserved.
//

import UIKit

class AddCourseRepository: NSObject {

    class func loadBlankHoles() -> [HoleDTO] {

        var holes = [HoleDTO]()

        for index in 1...18 {
            let hole = HoleDTO()
            hole.number = index
            holes.append(hole)
        }

        return holes
    }

}
