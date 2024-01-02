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
    
    private let mainCollectionView = UICollectionView()
    
    private let userLabel = UILabel()
    private let noticeLabel = UILabel()
    private let countProgressBar = UIProgressView()
    
    private let userClipLabel = UILabel()
    
    
    
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        

    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - set UI
    
    func setView() {

    }
    
    
    // MARK: - set UI
    
    private func setUI() {
        
        self.backgroundColor = .white
        userLabel.do {
            $0.text = "김가현 님,"
            $0.font = .systemFont(ofSize: 20)
            $0.textColor = .black
        }
        noticeLabel.do {
            $0.text = "nn개의 링크를 어쩌구저쩌구"
            $0.font = .systemFont(ofSize: 20)
            $0.textColor = .black
        }
        
        

    }
    
    
    // MARK: - set Hierachy
    
    private func setHierachy() {
//        [logoImageView, welcomeLabel, loginButton].forEach({self.addSubview($0)})
    }
    
    
    // MARK: - set Layout
    
    private func setLayout() {
        
    }
    
    // MARK: - set CollectionView
    
    private func setCollectionView() {
        
    }
    
    
    
}
