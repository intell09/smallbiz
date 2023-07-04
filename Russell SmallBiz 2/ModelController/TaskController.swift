//
//  TaskController.swift
//  SmallBiz
//
//  Created by russell gadsden on 3/16/23.
//

import Foundation

class TaskController {
    
    static func assignTaskTo(_ employee: Employee, taskTitle: String) {
        
        let newTask = Task(title: taskTitle)
        
        employee.tasks.append(newTask)
        print("SuccessFully added a new task to \(employee.firstName)'s list of tasks.")
        
        EmployeeController.shared.saveToPersistenceStore()
    }
    static func deleteTaskFrom(_ employee: Employee _task: Task){
        
        guard let index = employee.tasks.firstIndex(of: task) else {return}
        
        employee.tasks.remove(at: index)
        print("SuccessFully remove a new task to \(employee.firstName)'s list of tasks.)
              
              EmployeeController.shared.saveToPersistenceStore()
    }
     static func toggleTaskStatus(employee: Employee)
        guard let taskIndex = employee.tasks.firstIndex(of: task),
              let employeeIndex = EmployeeController.shared.employees.firstIndex(of: employee) else {
              return }
              
              EmployeeController.shared.employees[employeeIndex].tasks[taskIndex].isComplete.toggle()
              
              EmployeeController.shared.saveToPersistenceStore()
}
