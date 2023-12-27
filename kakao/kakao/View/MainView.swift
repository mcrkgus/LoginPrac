//
//  MainView.swift
//  kakao
//
//  Created by Gahyun Kim on 2023/12/22.
//

import UIKit

import SnapKit
import Then

import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

final class MainView: UIView {
    
    // MARK: - Properties
    
    private let descriptLabel = UILabel()
    let kakaoLoginButton = UIButton()
    let appleLoginButton = UIButton()

    
    // MARK: - Life Cycle
    
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
        setUI()
        setHierachy()
        setLayout()
    }

    
    // MARK: - set UI
    
    private func setUI() {
        self.backgroundColor = .white
        
        descriptLabel.do {
            $0.text = "Login Test Program"
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 30, weight: .bold)
        }
        
        kakaoLoginButton.do {
            $0.backgroundColor = UIColor(cgColor: .init(red: 247, green: 227, blue: 0, alpha: 1))
            $0.setTitle("카카오로 로그인하기", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
            $0.layer.cornerRadius = 23
        }
        
        appleLoginButton.do {
            $0.backgroundColor = .white
            $0.setImage(UIImage(systemName: "applelogo"), for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 17.0)
            $0.imageView?.tintColor = .black
            $0.layer.borderWidth = 0.5
            $0.setTitle("   Sign in with Apple  ", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.layer.cornerRadius = 23
        }
    }
    
    
    // MARK: - set Hierachy
    
    private func setHierachy() {
        self.addSubview(descriptLabel)
        self.addSubview(kakaoLoginButton)
        self.addSubview(appleLoginButton)
    }
    
    
    // MARK: - set Layout
    
    private func setLayout() {
        descriptLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(150)
            $0.centerX.equalToSuperview()
        }
        
        kakaoLoginButton.snp.makeConstraints {
            $0.top.equalTo(descriptLabel.snp.top).offset(90)
        }
        
        appleLoginButton.snp.makeConstraints {
            $0.top.equalTo(kakaoLoginButton.snp.top).offset(90)
        }
        
        [kakaoLoginButton, appleLoginButton].forEach {
            $0.snp.makeConstraints {
                //$0.top.equalTo(kakaoLoginButton.snp.top).offset(90)
                $0.centerX.equalTo(descriptLabel.snp.centerX)
                $0.height.equalTo(50)
                $0.leading.trailing.equalToSuperview().inset(60)
            }
        }
    }
    
    
    // MARK: - check User Info
    
    func setUserInfo() {
        UserApi.shared.me {(user, error) in
            if let error = error {
                print(error)
            } else {
                print("nickname: \(user?.kakaoAccount?.profile?.nickname ?? "no nickname")")
                print("email: \(user?.kakaoAccount?.email ?? "no email")")
                
                guard let userId = user?.id else {return}
                
                print("닉네임 : \(user?.kakaoAccount?.profile?.nickname ?? "no nickname").....이메일 : \(user?.kakaoAccount?.email ?? "no nickname"). . . . .유저 ID : \(userId)")
            }
        }
    }
}
