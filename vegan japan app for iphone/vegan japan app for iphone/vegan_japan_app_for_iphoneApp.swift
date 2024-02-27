//
//  vegan_japan_app_for_iphoneApp.swift
//  vegan japan app for iphone
//
//  Created by XIAOYU ZHANG on 2024/02/12.
//

import SwiftUI

@main
struct vegan_japan_app_for_iphoneApp: App {
    var body: some Scene {
        WindowGroup {
            // 创建ProductViewModel实例
            let viewModel = ProductViewModel()
            // 将viewModel传递给HomeView
            HomeView(viewModel: viewModel)
        }
    }
}
