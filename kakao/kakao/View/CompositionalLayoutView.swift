//
//  CompositionalLayoutView.swift
//  kakao
//
//  Created by Gahyun Kim on 2024/01/01.
//

import UIKit

import SnapKit
import Then

final class CompositionalLayoutView: UIView {
    
    // MARK: - Properties
    
    private let collectionViewLayout = CompositionalFactory.create()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
    
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - set Hierachy
    
    private func setHierachy() {
        self.addSubview(collectionView)
    }
    
    
    // MARK: - set Layout
    
    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
