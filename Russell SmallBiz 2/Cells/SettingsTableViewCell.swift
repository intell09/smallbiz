//
//  SettingsTableViewCell.swift
//  SmallBiz
//
//  Created by russell gadsden on 3/18/23.
//

import UIKit

protocol SettingsChangedProtocol: AnyObject {
        func settingToggled(item: SettingsItem)
    }

class SettingsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var settingsSwitch: UISwitch!
    
    weak var delegate: SettingsChangedProtocol?
        
        var item: SettingsItem! {
            didSet {
                updateViews()
            }
        }
        
        func updateViews() {
            settingsNameLabel.text = item.settingTitle
            settingsSwitch.isOn = item.isActive
        }


        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            
            // Configure the view for the selected state
        }
    
    
    
}
