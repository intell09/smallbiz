//
//  EmployeesListViewController.swift
//  SmallBiz
//
//  Created by russell gadsden on 3/18/23.
//

import UIKit

class EmployeesListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var employeeTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        EmployeeController.shared.loadFromPersistenceStore()
    }
    
    func setupTableView() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        tableView.delegate = self
        tableView.dataSource = self
    }
    
   
    @IBAction func addButtonTapped(_ sender: Any) {
        guard let text = employeeTextField.text, !text.isEmpty else {
            return
        }
        
        let fullName = text.components(separatedBy: "")
        
        EmployeeController.shared.addEmployee(firstName: fullName[0], lastName: fullName[1])
        employeeTextField.text = ""
        employeeTextField.resignFirstResponder()
        tableView.reloadData()
    }
    
    extension EmployeesListViewController: UITableViewDelegate, UITableViewDataSource {
        
        func numberOfSections(in tableView: UITableView) -> Int {
            1 
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            EmployeeController.shared.employees.count
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCell", for: indexPath)
        
    let employee = EmployeeController.shared.employees[indexPath.row]
    var content = cell.defaultContentConfiguration()
        
    content.text = "\(employee.firstName) \(employee.lastName)"
        
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.tableView.deselectRow(at: indexPath, animated: false)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let employeeToDelete = EmployeeController.shared.employees[indexPath.row]
        EmployeeController.shared.delete(employee: employeeToDelete)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEmployeeTask" {
            guard let destination = segue.destination as? EmployeeTaskListViewController, let index = tableView.indexPathForSelectedRow else { return }
            
            let employeeToSend = EmployeeController.shared.employees[index.row]
            destination.employee = employeeToSend
        }
    }
}
