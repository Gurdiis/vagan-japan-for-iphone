//
//  ProductDetailView.swift
//  vegan japan app for iphone
//
//  Created by XIAOYU ZHANG on 2024/02/25.
//

import Foundation
import SwiftUI

struct ProductDetailView: View {
    var product: Product?
    var viewModel: ProductViewModel // 在实际应用中可能用于进一步的操作，如收藏商品等
    
    var body: some View {
        
        VStack {
            if let product = product {
                Image(product.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)

                Text(product.sname)
                    .font(.title)
                Text("Category: \(product.category)")
                Text("Ingredients: \(product.ingredients)")
                Text("Vegan: \(product.vegan)")
                Text("Available at: \(product.store)").onAppear {
                    print("Displaying details for product: \(product.sname)")
                }

            } else {
                Text("Product not found.").onAppear {
                    print("Product detail view appeared without a product.")
                }
            }
        }
        .padding()
        .navigationBarTitle("Product Detail", displayMode: .inline)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ProductViewModel()
                // 将viewModel作为参数传递给HomeView
        ProductDetailView(viewModel: viewModel)
    }
}
