//
//  ProductScreenViewController.swift
//  Assignment_1
//
//  Created by Rajashekarappa, Basavaraja on 4/22/22.
//

import UIKit

class ProductScreenViewController: UIViewController {

    @IBOutlet weak var productsTableView: UITableView!
        
    public var itemQty: Int = 0
    
    public var result: storeAndProductData?
    var cartItems: [CartItems] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = result?.storeName
        productsTableView.delegate = self
        productsTableView.dataSource = self
        
        self.registerTableViewCells()
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cartScreen" {
            let cartItems = sender as! [CartItems]
            let controller = segue.destination as? CartScreenViewController
            controller?.cartItems = cartItems
        }
    }
    
    @IBAction func goToCartScreen(_ sender: UIButton) {
        performSegue(withIdentifier: "cartScreen", sender: cartItems)
    }
    
    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "ProductDetailsTableViewCell" ,
                                  bundle: nil)
        self.productsTableView.register(textFieldCell,
                                forCellReuseIdentifier: "productTableviewCell")
    }
}

extension ProductScreenViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result?.products.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = (productsTableView.dequeueReusableCell(withIdentifier: "productTableviewCell", for: indexPath) as? ProductDetailsTableViewCell) {
            
            cell.productNameLabel.text = result?.products[indexPath.row].productName
            cell.productDescriptionLabel.text = result?.products[indexPath.row].ProductDescription
            cell.productPriceLabel.text = (result?.products[indexPath.row].productPrice)?.description
        
            cell.delegate = self
            
            cartItems.append(CartItems(productName: result?.products[indexPath.row].productName ?? "No Name", productPrice: result?.products[indexPath.row].productPrice ?? 0, productQuatity: itemQty))

            
            return cell
        }
        
        return UITableViewCell()
        
    }
    
}

extension ProductScreenViewController : UITableViewDelegate {
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
}

extension ProductScreenViewController : ProductDetailsTableViewCellDelegate {

    func productQuantitySelected(quantity: Int) {

        itemQty = quantity

    }
}
