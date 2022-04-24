//
//  StoreCollectionViewCell.swift
//  Assignment_1
//
//  Created by Rajashekarappa, Basavaraja on 4/21/22.
//

import UIKit

class StoreCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var storeName: UILabel!
    @IBOutlet var storeImage: UIImageView!
    
    
    public func designCell(with store:storeAndProductData) {
        storeImage.image = UIImage(named: store.storeImage)
        storeName.text = store.storeName

    }
}
