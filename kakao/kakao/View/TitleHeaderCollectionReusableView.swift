//
//  TitleHeaderCollectionReusableView.swift
//  kakao
//
//  Created by Gahyun Kim on 2024/01/02.
//

import UIKit

import SnapKit
import Then

class TitleHeaderCollectionReusableView: UICollectionReusableView {
    
    private let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure() {

        
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    private func setupStyle() {
        titleLabel.do {
            $0.textColor = .black
            $0.font = .boldSystemFont(ofSize: 18)
            $0.text = "김가현 님의 클립 저장 "
        }
    }
    
    private func setupHierarchy() {
        addSubview(titleLabel)
    }
    
    private func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(5)
            $0.centerY.equalToSuperview()
        }
    }
}
