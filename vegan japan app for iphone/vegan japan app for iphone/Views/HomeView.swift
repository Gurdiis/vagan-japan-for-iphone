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
    
    @State private var showMenu = false


    
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
            ZStack{
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
                .navigationBarItems(trailing: Button(action: {
                                        withAnimation {
                                            showMenu.toggle()
                                        }
                                    }) {
                                        Image(systemName: "line.horizontal.3")
                                            .imageScale(.large)
                                    })

                                // 菜单视图
                                if showMenu {
                                    MenuView(showMenu: $showMenu)
                                        .transition(.move(edge: .trailing))
                                        .animation(.default)
                                }
            }
        }
    }
}

struct MenuView: View {
    @Binding var showMenu: Bool

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation {
                        showMenu = false
                    }
                }) {
                    Image(systemName: "xmark")
                            .imageScale(.large)
                            .foregroundColor(.black) // 根据需要调整颜色
                            // 在所有方向上增加 padding，特别是在图标的上方增加更多，以调整位置
                            .padding(.top, 30) // 往下调整位置
                            .padding(.leading, 10) // 确保左侧也有足够的点击范围
                            .padding(30) // 在所有其他方向上也增加 padding
                }
                // 使用.background和.clipShape增加点击区域
                .background(Color.clear) // 使用透明背景
                .clipShape(Circle()) // 将点击区域限定在一个更大的圆形区域内

                .accessibilityLabel("关闭菜单") // 为辅助功能增加标签
                Spacer()
            }
            Spacer()
            
            // 菜单项
            Group {
                Button("About Us") {
                    // 实现跳转到 "About Us" 页面的逻辑
                    print("About Us tapped")
                }
                .padding(.top, 20)
                
                Button("Contact Us") {
                    // 实现跳转到 "Contact Us" 页面的逻辑
                    print("Contact Us tapped")
                }
                .padding(.top, 20)
                
                Button("FAQ") {
                    // 实现跳转到 "FAQ" 页面的逻辑
                    print("FAQ tapped")
                }
                .padding(.top, 20)
                
                Button("Customer Service") {
                    // 实现跳转到 "Customer Service" 页面的逻辑
                    print("Customer Service tapped")
                }
                .padding(.top, 20)
            }
            .foregroundColor(.blue)
            .font(.headline)
            
            Spacer()
            
            // 版权信息
            Text("版权所有 © 2024")
                .font(.caption)
                .padding(.bottom, 20)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Color.white) // 或者根据需要选择合适的背景颜色
        .offset(x: showMenu ? 0 : UIScreen.main.bounds.width, y: 0)
        
        
        
        
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: ProductViewModel())
    }
}
