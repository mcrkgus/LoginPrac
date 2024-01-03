//
//  ThirdCollectionReusableView.swift
//  kakao
//
//  Created by Gahyun Kim on 2024/01/03.
//

import UIKit

import SnapKit
import Then

final class ThirdCollectionReusableView: UICollectionReusableView {
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
            $0.text = "이 주의 추천 사이트 "
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
