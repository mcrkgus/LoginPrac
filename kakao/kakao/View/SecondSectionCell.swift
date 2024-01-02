//
//  SecondSectionCell.swift
//  kakao
//
//  Created by Gahyun Kim on 2024/01/02.
//

import UIKit

import SnapKit
import Then

final class SecondSectionCell: UICollectionViewCell {
    
    private let linkImage = UIImageView()
    private let titleLabel = UILabel()
    private let linkLabel = UILabel()
    
    private let clipStackView = UIStackView()
    
    
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
        linkImage.do {
            $0.image = UIImage(systemName: "folder")
        }
        
        titleLabel.do {
            $0.text = "Title"
            $0.font = .boldSystemFont(ofSize: 23)
            $0.textColor = .black
        }
        
        linkLabel.do {
            $0.text = "https://myApple.com"
            $0.font = .boldSystemFont(ofSize: 17)
        }
    }
    
    private func setupHierarchy() {
        self.addSubview(linkImage)
        self.addSubview(titleLabel)
        self.addSubview(linkLabel)
    }
    
    private func setupLayout() {
        linkImage.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(10)
            $0.height.width.equalTo(70)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(linkImage.snp.top)
            $0.leading.equalTo(linkImage.snp.trailing).offset(10)
        }
        
        linkLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(40)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        
    }
}
