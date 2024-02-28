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
                Text("判定結果: \(product.vegan)")
                    .font(.title2)
                    .foregroundColor(product.vegan == "vegan" ? .green : .black) // 当 vegan 时显示绿色，否则显示黑色

                    .padding()

                Image(product.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)

                Text(product.sname)
                    .font(.title)
                    .padding()
                
                Text("カテゴリ: \(product.category)")

                Text("非ビーガン成分: \(product.ingredients)")

                Text("コンビニ: \(product.store)")
                    .onAppear {
                    print("Displaying details for product: \(product.sname)")
                }

            } else {
                Text("商品が見つかりません。").onAppear {
                    print("Product detail view appeared without a product.")
                }
            }
        }
        .padding()
        .navigationBarTitle("商品詳細", displayMode: .inline)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ProductViewModel()
                // 将viewModel作为参数传递给HomeView
        ProductDetailView(viewModel: viewModel)
    }
}
