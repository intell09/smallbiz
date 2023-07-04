//
//  DefaultItemCollectionViewCell.swift
//  SmallBiz
//
//  Created by russell gadsden on 3/16/23.
//

import UIKit

class DefaultItemCollectionViewCell: UICollectionViewCell {
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 8
    }
    
}
