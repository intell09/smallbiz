//
//  SettingsTableViewController.swift
//  SmallBiz
//
//  Created by russell gadsden on 3/18/23.
//

import UIKit

class SettingsTableViewController: UIViewController {

   override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBar.prefersLargeTitles = true
}

lazy var datasource: [SettingsItem] = {
    var item = SettingsItem(settingTitle: "New Employee default item", isActive: false, type:
        .toggleSwitch)
    item.readDefaults()
    var secondItem = SettingsItem(settingTitle: "Default Items", isActive: false, type: .disclosure)
    return [item, secondItem]
}()
    
 override func numberOfSections(in tableView: UITableView) -> Int {
      return 1
}

 override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return datasource.count
}

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let item = datasource[indexPath.row]
        
    switch item.type {
        
    case.toggleSwitch:
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "setttingCell", for: indexPath)
                as? SettingsTableViewCell else { return UITableViewCell() }
        cell.item = item
        cell.delegate = self
        return cell
        
    case .disclosure:
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "discloseCell", for:
            indexPath) as? DisclosureTableViewCell else { return UITableViewCell() }
        cell.disclosureCellLabel.text = item.settingTitle
        
        return cell
    }
  }
}

extension SettingsTableViewController: SettingsChangedProtocol {
  func settingToggled(item: SettingsItem) {
    let defaults = UserDefaults.standard
    defaults.set(item.isActive, forKey: item.settingTitle)
 }
}


struct SettingsItem {
var settingTitle: String
var isActive: Bool
var type: SettingCellType

mutating func readDefaults(){
    let defaults = UserDefaults.standard
    self.isActive = defaults.bool(forKey: self.settingTitle)
}
}

enum SettingCellType {
case toggleSwitch
case disclosure
    
}
