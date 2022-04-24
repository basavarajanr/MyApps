//
//  ViewController.swift
//  Assignment_1
//
//  Created by Rajashekarappa, Basavaraja on 4/20/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storeCollectionView: UICollectionView!
    public var result: storeAndProduct?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parseJson()
        self.navigationItem.title = "Eli Lilly"
        storeCollectionView.dataSource = self
        storeCollectionView.delegate = self
        storeCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }

    func parseJson() {
        
        guard let filePath = Bundle.main.path(forResource: "Stores_Products", ofType: "json") else {
            return
        }
        let url = URL(fileURLWithPath: filePath)
        
        do {
            let jsonData = try Data(contentsOf: url)
            
            result = try JSONDecoder().decode(storeAndProduct.self, from: jsonData)
            if let result = result {
                print(result)
            }
            else {
                print("Failed to parse json file.")
            }
        }
        catch {
            print("Failed to parse json file: Error - \(error) ")
        }
        
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return result?.resultItems.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreCollectionViewCell", for: indexPath) as! StoreCollectionViewCell
        cell.designCell(with: (result?.resultItems[indexPath.row])!)
        return cell
    }        
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let selectedData = result?.resultItems[indexPath.item]
        performSegue(withIdentifier: "productsScreen", sender: selectedData)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "productsScreen" {
            let object = sender as! storeAndProductData
            let controller = segue.destination as? ProductScreenViewController
            controller?.result = object
        }
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
}
	
