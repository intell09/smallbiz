//
//  EmployeeTaskListViewController.swift
//  SmallBiz
//
//  Created by russell gadsden on 3/16/23.
//

import UIKit

class EmployeeTaskListViewController: UITableViewCell {
    
    // Mark: Outlets
    
    
    // Mark - Properties
    var employee: Employee!
    
    override func loadView() {
        super.loadView()
        setViewTitle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    func setViewTitle() {
        self.navigationItem.title = "\(employee.firstName)'s Tasks "
    }
    
    
    // Mark: Actions
    
    
    
extension EmployeeTaskListViewController: UITableViewDataSource, UITableViewDelegate {
        
    func numberOfSections(in tableView) -> Int {
            1
        }
    
    func tableView(_ tableView: UITableView, numberOfSection section Int) -> Int {
            employee.tasks.count
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as?
                    TaskTableViewCell else { return UITableViewCell() }
            
            let task = employee.tasks[indexPath.row]
            cell.task = task
            cell.delegate = self
            return cell
        }
        
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt
                       indexPath: IndexPath) {
            if editingStyle == .delete {
                let  taskToDelete = employee.tasks[indexPath.row]
                TaskController.deleteTaskFrom(employee, taskToDelete)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            
        }
}
    
    
extension EmployeeTaskListViewController: TaskStatusChangedProtocol {
        func updateTaskStatus(task: Task) {
            TaskController.toggleTaskStatus(employee: employee, task: task)
            tableView.reloadData()
        }
    }

