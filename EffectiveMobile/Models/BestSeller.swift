//
//  BestSeller.swift
//  EffectiveMobile
//
//  Created by Egor SAUSHKIN on 13.12.2022.
//

import Foundation

struct BestSeller: Codable {
    let best_seller: [BestGoods]
    
    private enum CodingKeys: String, CodingKey {
        case best_seller = "bestSeller"
    }
}

struct BestGoods: Codable {
    let id: Int
    let is_favorites: Bool
    let title: String
    let price_without_discount: Int
    let discount_price: Int
    let picture: String //url
    
    private enum CodingKeys: String, CodingKey {
        case id
        case is_favorites = "isFavorites"
        case title
        case price_without_discount = "priceWithoutDiscount"
        case discount_price = "discountPrice"
        case picture
    }
}
