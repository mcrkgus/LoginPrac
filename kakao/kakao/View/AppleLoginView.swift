//
//  AppleLoginView.swift
//  kakao
//
//  Created by Gahyun Kim on 2023/12/27.
//

import UIKit

import SnapKit
import Then

class AppleLoginView: UIView {

    // MARK: - Properties
    
    let logoImageView = UIImageView()
    let welcomeLabel = UILabel()
    let loginButton = UIButton()
        
    
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - set UI
    
    func setView() {
        setUI()
        setHierachy()
        setLayout()
    }
    
    
    // MARK: - set UI
    
    private func setUI() {

        self.backgroundColor = .white

        logoImageView.do {
            $0.image = UIImage(systemName: "applelogo")
            $0.tintColor = .systemGray
            $0.contentMode = .scaleAspectFit
        }
        
        welcomeLabel.do {
            $0.numberOfLines = 0
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 20, weight: .semibold)
            $0.text = "Welcome! Sign With Apple to enjoy our Service"
            $0.textColor = .label
        }
        
        loginButton.do {
            $0.setImage(UIImage(systemName: "applelogo"), for: .normal)
            $0.setTitle("  Sign in with Apple", for: .normal)
            $0.layer.cornerRadius = 23
            $0.backgroundColor = .white
            $0.titleLabel?.font = .systemFont(ofSize: 17)
            $0.imageView?.tintColor = .black
            $0.setTitleColor(.label, for: .normal)
            $0.layer.borderWidth = 0.5
            //$0.addTarget(self, action: #selector(tappedAppleLoginBtn), for: .touchUpInside)
        }
    }
    
    
    // MARK: - set Hierachy
    
    private func setHierachy() {
        [logoImageView, welcomeLabel, loginButton].forEach({self.addSubview($0)})
    }
    
    
    // MARK: - set Layout
    
    private func setLayout() {
        
        logoImageView.snp.makeConstraints {
            $0.width.height.equalTo(50)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().multipliedBy(0.80)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.top.equalTo(logoImageView.snp.bottom).offset(20)
        }
        
        loginButton.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(50)
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(60)
            $0.height.equalTo(50)
        }
    }
    

}
