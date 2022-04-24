//
//  ProductDetailsTableViewCell.swift
//  Assignment_1
//
//  Created by Rajashekarappa, Basavaraja on 4/24/22.
//

import UIKit


protocol ProductDetailsTableViewCellDelegate: AnyObject {
    func productQuantitySelected(quantity: Int)
    
}

class ProductDetailsTableViewCell: UITableViewCell {
    
    weak var delegate: ProductDetailsTableViewCellDelegate?
    
    public var result: storeAndProductData?
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productQuantityLabel: UILabel!
    @IBOutlet weak var addItemsBtn: UIButton!
    @IBOutlet weak var removeItemsBtn: UIButton!

    var itemQty: Int = 0

    @IBAction func addItemsBtnPressed(_ sender: Any) {
        itemQty += 1
        productQuantityLabel.text = String(itemQty)
        
        delegate?.productQuantitySelected(quantity: itemQty)
    }
    
    @IBAction func removeItemsBtnPressed(_ sender: Any) {
        if itemQty >= 1 {
            itemQty -= 1
            productQuantityLabel.text = String(itemQty)
        }
        delegate?.productQuantitySelected(quantity: itemQty)
    }
    
}
