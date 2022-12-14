//
//  HotSeller.swift
//  EffectiveMobile
//
//  Created by Egor SAUSHKIN on 12.12.2022.
//

import Foundation

struct HotSeller: Codable {
    let home_store: [HotGoods]
    
    private enum CodingKeys: String, CodingKey {
        case home_store = "homeStore"
    }
}

struct HotGoods: Codable {
    let id: Int
    let is_new: Bool?
    let title: String
    let subtitle: String
    let picture: String //url
    let is_buy: Bool
    
    private enum CodingKeys: String, CodingKey {
        case id
        case is_new = "isNew"
        case title
        case subtitle
        case picture
        case is_buy = "isBuy"
    }
}
