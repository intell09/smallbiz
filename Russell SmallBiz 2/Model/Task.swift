//
//  Task.swift
//  SmallBiz
//
//  Created by russell gadsden on 3/16/23.
//

import Foundation

class Task: Codable, Equatable {
    
    var title: String
    var isComplete: Bool
    var id: String
    
    init(title: String, isComplete: Bool = false, id: String = UUID().uuidString) {
        self.title = title
        self.isComplete = isComplete
        self.id = id
    }
    
    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.id == rhs.id
    }
}
