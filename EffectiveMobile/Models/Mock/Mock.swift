//
//  Mock.swift
//  EffectiveMobile
//
//  Created by Egor SAUSHKIN on 14.12.2022.
//

import UIKit

enum Section {
    case category
    case banner
}

struct Mock {
    
    static let shared = Mock()
    
    private init() {}
    
    func createMockData() -> [Section: Any] {
        [
            .category: [
                Category(name: "Phones", priority: 1, image: "phones", isSelected: true): [
//                    Combo(image: "combo1", title: "1", description: nil, price: 1),
//                    Combo(image: "combo2", title: "2", description: nil, price: 2),
//                    Combo(image: "combo3", title: "3", description: nil, price: 3),
//                    Combo(image: "combo4", title: "4", description: nil, price: 4),
                ],
                Category(name: "Computer", priority: 2, image: "computer", isSelected: false): [
//                    Combo(image: "combo1", title: "1", description: nil, price: 1),
//                    Combo(image: "combo2", title: "2", description: nil, price: 2),
//                    Combo(image: "combo3", title: "3", description: nil, price: 3),
//                    Combo(image: "combo4", title: "4", description: nil, price: 4),
                ],
                Category(name: "Health", priority: 3, image: "health", isSelected: false): [
//                    Desert(image: "1", title: "1", description: nil, price: 1),
//                    Desert(image: "2", title: "2", description: nil, price: 2),
//                    Desert(image: "3", title: "3", description: nil, price: 3),
//                    Desert(image: "4", title: "4", description: nil, price: 4),
                ],
                Category(name: "Books", priority: 4, image: "books", isSelected: false): [
//                    Desert(image: "1", title: "1", description: nil, price: 1),
//                    Desert(image: "2", title: "2", description: nil, price: 2),
//                    Desert(image: "3", title: "3", description: nil, price: 3),
//                    Desert(image: "4", title: "4", description: nil, price: 4),
                ],
            ]
        ]
    }
}
