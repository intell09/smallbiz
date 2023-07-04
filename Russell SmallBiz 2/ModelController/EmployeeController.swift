//
//  EmployeeController.swift
//  SmallBiz
//
//  Created by russell gadsden on 3/14/23.
//

import Foundation

class EmployeeController {
    
    static let shared = EmployeeController()
    
    var employees: [Employee] = []
    
    var defaultItems: [String] = [
        "Payroll",
        "Onboarding",
        "Employee Profile",
        "Work shoes",
    ]

    //CRUD functions
    
    func addEmployee(firstName: String, lastName: String) {
        
        let newEmployee = Employee(firstName: firstName, lastName: lastName)
        
        if UserDefaults.standard.bool(forKey: "New Employee default items") {
            let tasks: [Task] = defaultItems.compactMap( { Task(title: $0) })
            newEmployee.tasks = tasks
        }
        
        employees.append(newEmployee)
        print("Successfully added a \(newEmployee.firstName) to our list of employees.")

         // Save
         saveToPersistenceStore()
    }
    
    func delete(employee: Employee) {
        guard let index = employees.firstIndex(of: employee) else { return}
       
            employees.remove(at: index)
            print("Successfully removed \(employee.firstName).")
            
            saveToPersistenceStore()
        }
    
    //Data persistence
    func createToPersistenceStore() -> URL {
            let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            let fileURL = url[0].appendingPathComponent("SmallBiz.json")
            return fileURL
        }
    
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(employees)
            try.data.write(to: createPersistenceStore())
        } catch {
            print(("Error encoding our songs; \(error) -- \(error.localizedDescription"))
            }
        }
    
   
    //Load
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: createPersistenceStore())
            employees = try JSONDecoder().decode([Employee].self, from: data)
            } catch {
                print("Error decoding our data into songs: \(error) -- \(error.localizedDescription)")
            }
       }
}

