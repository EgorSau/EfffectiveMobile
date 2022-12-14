//
//  Devices.swift
//  EffectiveMobile
//
//  Created by Egor SAUSHKIN on 13.12.2022.
//

import Foundation

enum DeviceType {
    case phone
    case computer
    case health
    case books
}

protocol Devices {
    var id: Int { get }
    var isFavorites: Bool { get }
    var title: String { get }
    var priceWithoutDiscount: Int { get }
    var discountPrice: Int { get }
    var picture: String { get }
}

struct Phones: Devices {
    var id: Int
    var isFavorites: Bool
    var title: String
    var priceWithoutDiscount: Int
    var discountPrice: Int
    var picture: String
}

struct Computer: Devices {
    var id: Int
    var isFavorites: Bool
    var title: String
    var priceWithoutDiscount: Int
    var discountPrice: Int
    var picture: String
}

struct Health: Devices {
    var id: Int
    var isFavorites: Bool
    var title: String
    var priceWithoutDiscount: Int
    var discountPrice: Int
    var picture: String
}

struct Books: Devices {
    var id: Int
    var isFavorites: Bool
    var title: String
    var priceWithoutDiscount: Int
    var discountPrice: Int
    var picture: String
}
