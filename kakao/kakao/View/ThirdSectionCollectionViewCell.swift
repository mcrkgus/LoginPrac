//
//  ThirdSectionCollectionViewCell.swift
//  kakao
//
//  Created by Gahyun Kim on 2024/01/02.
//

import UIKit

import SnapKit
import Then

final class ThirdSectionCollectionViewCell: UICollectionViewCell {

    private let brandImage = UIImageView()
    private let titleLabel = UILabel()
    private let subLabel = UILabel()
    
    private let recommendStackView = UIStackView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setView()
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Make View
    
    func setView() {
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    private func setupStyle() {
        contentView.backgroundColor = .lightGray
        
        brandImage.do {
            $0.image = UIImage(systemName: "folder")
        }
        
        titleLabel.do {
            $0.text = "Title"
            $0.font = .boldSystemFont(ofSize: 15)
            $0.textColor = .black
        }
        
        subLabel.do {
            $0.text = "sub"
            $0.font = .boldSystemFont(ofSize: 12)
        }
        
        recommendStackView.do {
            $0.axis = .vertical
            $0.distribution = .fillEqually
            $0.alignment = .center
            $0.spacing = 5
        }
    }
    
    private func setupHierarchy() {
        recommendStackView.addArrangedSubview(brandImage)
        recommendStackView.addArrangedSubview(titleLabel)
        recommendStackView.addArrangedSubview(subLabel)
        
        self.addSubview(recommendStackView)
    }
    
    private func setupLayout() {

        brandImage.snp.makeConstraints {
            $0.height.width.equalTo(40)
        }
        
        recommendStackView.snp.makeConstraints {
            //$0.top.equalToSuperview().inset(3)
            $0.centerX.centerY.equalToSuperview()
        }
        
    }
}
