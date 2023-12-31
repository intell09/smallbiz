//
//  TaskTableViewCell.swift
//  SmallBiz
//
//  Created by russell gadsden on 3/16/23.
//

import UIKit

struct CellImages {
    static let incomplete: UIImage = UIImage(systemName: "circle")!
    static let complete: UIImage = UIImage(systemName: "circle.inset.filled")!
}

protocol TaskStatusChangedProtocol: AnyObject {
    func updateTaskStatus(task: Task)
}

class TaskTableViewCell: UITableViewCell {
    
    
    //Mark: Outlets
    
    
    
    //Mark - Properties
    weak var delegate: TaskStatusChangedProtocol?
    var task: Task! {
        didSet {
            updateViews()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateViews() {
        taskTitleLabel.text = task.title
        taskButton.setImage(task.isComplete ? CellImages.complete : CellImages.incomplete, for: normal)
    }

}
