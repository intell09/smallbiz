//
//  DefaultItemsViewController.swift
//  SmallBiz
//
//  Created by russell gadsden on 3/17/23.
//

import UIKit

class DefaultItemsViewController: UIViewController {
    
    
    
    private let itemsPerRow: CGFloat = 2
    private let sectionInsets = UIEdgeInsets(
        top: 30.0,
        left: 20.0,
        bottom: 30.0,
        right: 20.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Default Items"
        collectionView.delegate = self
        collectionView?.dataSource = self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DefaultItemsViewController: UICollectionView, numberOfItemsInSection section: Int) -> {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        EmployeeController.shared.defaultItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
    UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "defaultItemCell", for: <#T##IndexPath#>)
    }
}
