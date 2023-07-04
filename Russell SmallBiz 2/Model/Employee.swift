//
//  Employee.swift
//  SmallBiz
//
//  Created by russell gadsden on 3/14/23.
//

import Foundation

class Employee: Codable Equatable {
    
    var firstName: String
    var lastName: String
    var task: [Task]
    var skillLevel: Int
    var id: String
    
    
    init(firstname: String, lastName: String, tasks: [Task], skillLevel: Int = 0, id: String UUID().uuidString) {
        self.firstName = firstname
        self.lastName = lastName
        self.tasks = tasks
        self.skillLevel = skillLevel
        self.id = id
}
    
static func ==(lhs: Employee, rhs: Employee) -> Bool {
    return lhs.id == rhs.id
   }
}
