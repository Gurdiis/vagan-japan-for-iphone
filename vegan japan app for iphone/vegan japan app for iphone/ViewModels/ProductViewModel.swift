//
//  ProductViewModel.swift
//  vegan japan app for iphone
//
//  Created by XIAOYU ZHANG on 2024/02/19.
//

import Foundation
import Combine

class ProductViewModel: ObservableObject {
    @Published var scannedBarcode: String = ""
    @Published var manualBarcode: String = ""
    @Published var product: Product?

    // 模拟从数据库获取产品信息
    func fetchProductInfo(byBarcode barcode: String) {
        // 这里只是一个示例，实际应用中您需要根据条形码从数据库获取产品信息
        self.product = Product(id: barcode, name: "示例商品")
    }

    func scanBarcode() {
        // 实现条形码扫描逻辑
        // 假设扫描到的条形码是 "123456"
        let scannedCode = "123456"
        self.scannedBarcode = scannedCode
        fetchProductInfo(byBarcode: scannedCode)
    }

    func submitManualBarcode() {
        fetchProductInfo(byBarcode: manualBarcode)
    }
}
