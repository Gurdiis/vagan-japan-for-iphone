//
//  HomeView.swift
//  vegan japan app for iphone
//
//  Created by XIAOYU ZHANG on 2024/02/12.
//

import SwiftUI
import BarcodeScanner

struct HomeView: View {
    @State private var barcode: String = ""
    @State private var showProductDetail: Bool = false
    @ObservedObject var viewModel: ProductViewModel
    
    @State private var isPresentingScanner = false
    @State private var scannedCode: String?
    @State private var productFound: Bool = false
    @State private var scannedProduct: Product?
    
    @State private var showingAllProducts = false

    
    private func findProduct(with code: String) {
        if let product = viewModel.products.first(where: { $0.scode == code }) {
            scannedProduct = product
            productFound = true
        } else {
            scannedProduct = nil
            productFound = false
        }
        showProductDetail = true
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter barcode", text: $barcode)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Scan Barcode") {
                    isPresentingScanner = true
                }.sheet(isPresented: $isPresentingScanner) {
                    BarcodeScannerView(isPresentingScanner: $isPresentingScanner) { code in
                        // 处理扫描到的条形码
                        scannedCode = code
                        findProduct(with: code)
                    }
                }


                .padding()
                
                Button("Find Product"){
                    findProduct(with: barcode)
                }
                .padding()
                .disabled(barcode.isEmpty)
                
                NavigationLink(destination: ProductDetailView(product: scannedProduct, viewModel: viewModel), isActive: $showProductDetail) {
                    EmptyView()
                }
                NavigationLink(destination: AllProductsView(products: viewModel.products), isActive: $showingAllProducts) {
                                    Button("Show All Products") {
                                        showingAllProducts = true
                                    }
                                }
                

            }
            .navigationBarTitle("Products", displayMode: .inline)
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: ProductViewModel())
    }
}
