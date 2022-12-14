//
//  CategoriesCollectionCell.swift
//  EffectiveMobile
//
//  Created by Egor SAUSHKIN on 13.12.2022.
//

import UIKit

class CategoriesCollectionCell: UICollectionViewCell {
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4) //black?
        label.font = UIFont(name: "MarkPro-Medium", size: 12)
        label.textAlignment = .center
        return label
    }()
    
    private var category: Category?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.clear()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 71/2
//        self.layer.borderWidth = 1
//        self.layer.borderColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4).cgColor
        self.backgroundColor = .white
        self.clipsToBounds = true
        self.setupConstraints()
    }
    
    func setup(withCategory category: Category) {
        self.contentView.backgroundColor = category.isSelected
        ? UIColor(red: 0.255, green: 0.110, blue: 0.78, alpha: 1)
        : .systemBackground
        self.label.textColor = category.isSelected
        ? UIColor(red: 0.255, green: 0.110, blue: 0.78, alpha: 1)
        : UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4) // black?
        self.image.image = category.isSelected
        ? UIImage(named: category.image)?.withTintColor(.white) //when selected -> white
        : UIImage(named: category.image)
        self.label.text = category.name
    }
    
    private func clear() {
        self.contentView.backgroundColor = .systemBackground
        self.label.textColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4) // black?
        self.label.text = ""
    }
    
    private func setupConstraints() {
        
        self.addSubview(image)
        let imageTop = image.topAnchor.constraint(equalTo: self.topAnchor)
//        let bottom = label.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        let imageRight = image.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        let imageLeft = image.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        NSLayoutConstraint.activate([imageTop, imageRight, imageLeft])
        
        self.addSubview(label)
        let labelTop = label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 7)
        let labelBottom = label.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        let labelRight = label.trailingAnchor.constraint(equalTo: image.trailingAnchor)
        let labelLeft = label.leadingAnchor.constraint(equalTo: image.leadingAnchor)
        NSLayoutConstraint.activate([labelTop, labelBottom, labelRight, labelLeft])
        
    }
}

