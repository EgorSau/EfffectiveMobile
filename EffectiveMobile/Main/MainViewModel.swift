//
//  MainViewModel.swift
//  EffectiveMobile
//
//  Created by Egor SAUSHKIN on 13.12.2022.
//

import UIKit

protocol MainViewOutput {
    var deviceType: DeviceType { get }
    func createCategoriesMockData() -> [Category]
    func fetchBanners(handler: @escaping (Banners) -> Void)
    func fetchDevices(forDeviceType: DeviceType, handler: @escaping (Devices) -> Void)
}

class MainViewModel {
    var categorySelected = false
}

extension MainViewModel: MainViewOutput {
    
    var deviceType: DeviceType {
        if categorySelected {
            return .phone
        } else {
            return .computer
        }
    }

    //MARK: определяем callback обратной связи View -> ViewModel
    
    func createCategoriesMockData() -> [Category] {
        [
            Category(name: "Phones", priority: 1, image: "phones", isSelected: true),
            Category(name: "Computer", priority: 2, image: "computer", isSelected: false),
            Category(name: "Health", priority: 3, image: "health", isSelected: false),
            Category(name: "Books", priority: 4, image: "books", isSelected: false)
        ]
    }
    
    func fetchBanners(handler: @escaping (Banners) -> Void) {
        NetworkService().request(for: UrlStrings.main) { result in
            guard let data = try? result.get() else { return }
            Mapper().parse(HotSeller.self, from: data) { data in
                guard let arrayOfHotGoods = try? data.get().home_store else { return }
                arrayOfHotGoods.forEach { good in
                    let bannerModel = Banners(id: good.id,
                                           isNew: good.is_new,
                                           title: good.title,
                                           subtitle: good.subtitle,
                                           picture: good.picture,
                                           is_buy: good.is_buy)
                    handler(bannerModel)
                }
            }
        }
    }
    
    func fetchDevices(forDeviceType: DeviceType, handler: @escaping (Devices) -> Void) {
        NetworkService().request(for: UrlStrings.main) { result in
            guard let data = try? result.get() else { return }
            Mapper().parse(BestSeller.self, from: data) { data in
                guard let arrayOfBestGoods = try? data.get().best_seller else { return }
                arrayOfBestGoods.forEach { good in
                    let phoneModel = Phones(id: good.id,
                                            isFavorites: good.is_favorites,
                                            title: good.title,
                                            priceWithoutDiscount: good.price_without_discount,
                                            discountPrice: good.discount_price,
                                            picture: good.picture)
                    handler(phoneModel)
                }
            }
        }
    }
}

/*
class CustomViewController: UIViewController {
    
    private let output: MainViewOutput
    
    init(output: MainViewOutput) {
        self.output = output
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: вызов callback для передачи touch event -> ViewModel
    @objc private func buttonPressed() { // 
        output.fetchHotGoods { banner in
//            self.titleLabel.text = banner.title
        }

    }
    
}
*/
