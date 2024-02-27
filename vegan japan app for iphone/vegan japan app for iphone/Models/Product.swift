//
//  Product.swift
//  vegan japan app for iphone
//
//  Created by XIAOYU ZHANG on 2024/02/19.
//

import Foundation

struct Product: Identifiable, Codable, Hashable {
    // 使用scode作为唯一标识符
    var id: String { scode }
    let scode: String
    let sname: String
    let category: String
    let ingredients: String
    let vegan: String
    let store: String
    var imageName: String // 添加这一行来存储图片名称
}
