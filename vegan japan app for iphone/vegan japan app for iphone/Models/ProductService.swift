//
//  ProductService.swift
//  vegan japan app for iphone
//
//  Created by XIAOYU ZHANG on 2024/02/25.
//

import Foundation

class ProductService {
    static let shared = ProductService() // Singleton instance
    
    func loadProducts() -> [Product] {
        print("Loading products...")

        guard let url = Bundle.main.url(forResource: "products", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("Cannot find products.json or cannot load it")

            return []
        
        }
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([Product].self, from: data)
            print("Loaded products: \(decodedData)")
            return decodedData
        } catch {
            print("Failed to decode products from products.json: \(error)")
            return []
        }

//        let decoder = JSONDecoder()
//        if let decodedData = try? decoder.decode([Product].self, from: data) {
//            print("Loaded products: \(decodedData)")
//
//            return decodedData
//        } else {
//            print("Failed to decode products from products.json")
//
//            return []
//        }
    }
}
