//
//  MainCollectionViewCell.swift
//  kakao
//
//  Created by Gahyun Kim on 2024/01/06.
//

import UIKit

import SnapKit
import Then

final class MainCollectionViewCell: UICollectionViewCell {

    var nickName: String = "김가현"
    var readToastNum: Int = 13
    var allToastNum: Int = 47
    var mainCategoryListDto = Array<Any>()
    
    
    
    private let userLabel = UILabel()
    private let noticeLabel = UILabel()
    private let readToastLabel = UILabel()
    private let allToastLabel = UILabel()
    lazy var linkProgressView = UIProgressView()

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
        contentView.backgroundColor = .white

        userLabel.do {
            $0.text = nickName + "님"
            $0.font = .systemFont(ofSize: 15)
            $0.textColor = .black
        }
        
        noticeLabel.do {
            $0.text = "토스터로 " + String(allToastNum) + " 개의 링크를 \n 잊지 않고 읽었어요!"
            $0.font = .systemFont(ofSize: 15)
            $0.textColor = .black
        }
        
        readToastLabel.do {
            $0.text = String(readToastNum)
            $0.font = .boldSystemFont(ofSize: 20)
            $0.textColor = .red
        }
        
        allToastLabel.do {
            $0.text = String(readToastNum) + "/" + String(allToastNum)
            $0.font = .systemFont(ofSize: 16)
            $0.textColor = .lightGray
            $0.asColor(targetString: String(readToastNum), color: .red)
            
        }
        
        linkProgressView.do {
            $0.trackTintColor = .lightGray // 배경 색
            $0.progressTintColor = .red     // 진행 색
            $0.progress = Float(readToastNum)/Float(allToastNum)
    
        }
    }
    
    private func setupHierarchy() {

        addSubview(userLabel)
        addSubview(noticeLabel)
        addSubview(readToastLabel)
        addSubview(allToastLabel)
        addSubview(linkProgressView)
    }
    
    private func setupLayout() {
        userLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(20)
        }
        
        noticeLabel.snp.makeConstraints {
            $0.top.equalTo(userLabel.snp.bottom).offset(5)
            $0.leading.equalTo(userLabel.snp.leading)
        }
        
        readToastLabel.snp.makeConstraints {
            $0.top.equalTo(noticeLabel.snp.bottom).offset(8)
            $0.leading.equalTo(userLabel.snp.leading)
        }
        
        allToastLabel.snp.makeConstraints {
            $0.bottom.equalTo(readToastLabel.snp.bottom)
            $0.leading.equalTo(userLabel.snp.leading).offset(22)
        }
        
        linkProgressView.snp.makeConstraints {
            $0.top.equalTo(readToastLabel.snp.bottom).offset(5)
            $0.leading.equalTo(userLabel.snp.leading)
            $0.width.equalTo(335)
        }
    }
}
