//
//  jsonParser.swift
//  Assignment_1
//
//  Created by Rajashekarappa, Basavaraja on 4/20/22.
//

import Foundation

struct storeAndProduct: Codable {
    
    let resultItems : [storeAndProductData]
}

struct storeAndProductData: Codable {
    
    let storeName: String
    let storeImage: String
    let products: [productDeails]
}

struct productDeails : Codable {
    let productName:String
    let ProductDescription: String
    let productPrice: Float
}
