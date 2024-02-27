//
//  AllProductsView.swift
//  vegan japan app for iphone
//
//  Created by XIAOYU ZHANG on 2024/02/28.
//

import Foundation
import SwiftUI

struct AllProductsView: View {
    var products: [Product]
    
    @State private var selectedVegan: String = "全ての商品"
    @State private var selectedStore: String = "全コンビニ"
    let veganOptions: [String] = ["全ての商品", "ビーガン商品", "非ビーガン商品"]
    let storeOptions: [String] = ["全コンビニ", "7-Eleven", "FamilyMart", "LAWSON"]
    
    var filteredProducts: [Product] {
        products.filter { product in
            let matchesVegan: Bool
            switch selectedVegan {
            case "全ての商品":
                matchesVegan = true
            case "ビーガン商品":
                matchesVegan = product.vegan == "vegan"
            case "非ビーガン商品":
                matchesVegan = product.vegan == "non-vegan"
            default:
                matchesVegan = true
            }
            
            let matchesStore: Bool
            switch selectedStore {
            case "全コンビニ":
                matchesStore = true
            case "7-Eleven":
                matchesStore = product.store == "Seven-Eleven"
            case "FamilyMart":
                matchesStore = product.store == "FamilyMart"
            case "LAWSON":
                matchesStore = product.store == "LAWSON"
            default:
                matchesStore = true
            }
            
            return matchesVegan && matchesStore
        }
    }
    
    
    var body: some View {
        VStack {
            // 筛选选项
            Picker("Vegan", selection: $selectedVegan) {
                ForEach(veganOptions, id: \.self) { option in
                    Text(option)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Picker("Store", selection: $selectedStore) {
                ForEach(storeOptions, id: \.self) { option in
                    Text(option)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            // 列表显示筛选后的产品
            if filteredProducts.isEmpty {
                Text("商品が見つかりません。") // 当没有商品时显示的消息
                    .padding()
                Spacer()
            } else {
                List(filteredProducts) { product in
                    NavigationLink(destination: ProductDetailView(product: product, viewModel: ProductViewModel())) {
                        
                        HStack {
                            Image(product.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            VStack(alignment: .leading) {
                                Text(product.sname)
                                    .font(.headline)
                                Text(product.vegan)
                                    .font(.subheadline)
                                
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("All Products")
    }
}
