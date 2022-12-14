//
//  MainViewController.swift
//  EffectiveMobile
//
//  Created by Egor SAUSHKIN on 11.12.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: Private Properties
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "DefaultCellId")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
//    var mock: [Section: Any] = [:]
    var selectedCategory = "Пицца"
    weak var coordinator: MainCoordinator?
    let output: MainViewOutput
    
    // MARK: Init
    
    init(output: MainViewOutput) {
        self.output = output
        super.init()
//        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.mock = Mock.shared.createMockData()
        view.backgroundColor = .gray
        /*
         when will be added to cell
         guard let url = URL(string: good.picture) else { return }
         guard let data = try? Data(contentsOf: url, options: []) else { return }
         guard let image = UIImage(data: data) else { return }
         */
        self.setupView()
        self.barSetup(withTitle: "Выберете город")
    }
    
    // MARK: Private
    
    private func setupView() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.tableView)
        
        let topTableConstraint = self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let leadingTableConstraint = self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingTableConstraint = self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomTableConstraint = self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        NSLayoutConstraint.activate([
            topTableConstraint,
            leadingTableConstraint,
            trailingTableConstraint,
            bottomTableConstraint
        ])
    }

    private func initialSetup() {
        output.createCategoriesMockData().forEach { category in
//            self.image.image = category.image
        }
        output.fetchBanners { banner in
//            self.label.text = banner.title
        }
        output.fetchDevices(forDeviceType: .phone) { device in
//            self.label.text = device.title
        }
    }
    
    //didSelectCellForARowAt
    private func chosedDevice(deviceType: DeviceType) {
        output.fetchDevices(forDeviceType: deviceType) { device in
//            self.label.text = device.title
        }
    }
}

// MARK: - CategoryHeaderViewDelegate

extension MainViewController: CategoryHeaderViewDelegate {
    func didSelectNewCategory(_ newSelectedCategory: String) {
        self.selectedCategory = newSelectedCategory
        for row in 0...3 {
            self.tableView.reloadRows(at: [IndexPath(row: row, section: 1)], with: .fade)
        }
    }
}
