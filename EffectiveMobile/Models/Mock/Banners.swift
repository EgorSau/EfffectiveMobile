//
//  Banners.swift
//  EffectiveMobile
//
//  Created by Egor SAUSHKIN on 13.12.2022.
//

import Foundation

class Banners {
    let id: Int
    let isNew: Bool?
    let title: String
    let subtitle: String
    let picture: String //url
    let is_buy: Bool
    
    init (id: Int, isNew: Bool?, title: String, subtitle: String, picture: String, is_buy: Bool) {
        self.id = id
        self.isNew = isNew
        self.title = title
        self.subtitle = subtitle
        self.picture = picture
        self.is_buy = is_buy
    }
}
