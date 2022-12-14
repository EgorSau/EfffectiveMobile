//
//  Category.swift
//  EffectiveMobile
//
//  Created by Egor SAUSHKIN on 12.12.2022.
//

import Foundation

final class Category: Hashable {
    let name: String
    let priority: Int
    let image: String
    var isSelected: Bool
    
    private let id: String
    
    init(name: String, priority: Int, image: String, isSelected: Bool) {
        self.name = name
        self.priority = priority
        self.image = image
        self.isSelected = isSelected
        self.id = UUID().uuidString
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }

    static func == (lhs: Category, rhs: Category) -> Bool {
        lhs.id == rhs.id
    }
}
