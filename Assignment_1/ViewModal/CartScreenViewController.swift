//
//  CartScreenViewController.swift
//  Assignment_1
//
//  Created by Rajashekarappa, Basavaraja on 4/22/22.
//

import UIKit

class CartScreenViewController: UIViewController {
    
    var cartItems: [CartItems] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Cart Items"
        print("cartItems: ",cartItems)
        
    }
    
}

struct CartItems {
    var productName: String
    var productPrice: Float
    var productQuatity: Int
}
