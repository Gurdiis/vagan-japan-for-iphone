//
//  ProductViewModel.swift
//  vegan japan app for iphone
//
//  Created by XIAOYU ZHANG on 2024/02/19.
//

import Foundation
import Combine

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = [] // 存储加载的产品数据

    private var productService: ProductService
    private var cancellables: Set<AnyCancellable> = [] // 用于存储订阅

    init(productService: ProductService = .shared) {
        self.productService = productService
        loadProducts() // 初始化时加载产品数据
    }

    func loadProducts() {
        // 这里我们简化处理，直接赋值。根据实际情况，可能需要进行异步加载和错误处理
        products = productService.loadProducts()
        
        // 如果loadProducts是异步的，可以使用Combine进行处理，例如：
        /*
        productService.loadProducts()
            .receive(on: DispatchQueue.main) // 确保在主线程更新UI
            .sink(receiveCompletion: { completion in
                // 处理完成状态，比如处理错误
            }, receiveValue: { [weak self] loadedProducts in
                self?.products = loadedProducts
            })
            .store(in: &cancellables) // 添加到订阅存储中
        */
    }
}
