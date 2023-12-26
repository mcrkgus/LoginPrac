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
    private let kakaoLoginButton = UIButton()
    private let appleLoginButton = UIButton()

    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setView() {
        setUI()
        setHierachy()
        setLayout()
    }
    
    
    @objc func clickKakaoButton() {
        print("Kakao Login Button")
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                }
            }
        }
        else {
            print("카카오톡 미설치")
        }
        

    }
    
    @objc func clickAppleButton() {
        print("Apple Login Button")
    }
    
    
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
            $0.layer.cornerRadius = 9
            $0.addTarget(self, action: #selector(clickKakaoButton), for: .touchUpInside)
        }
        
        appleLoginButton.do {
            $0.backgroundColor = .black
            $0.setTitle("Apple로 로그인하기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
            $0.layer.cornerRadius = 9
            $0.addTarget(self, action: #selector(clickAppleButton), for: .touchUpInside)
            
        }
    }
    
    private func setHierachy() {
        self.addSubview(descriptLabel)
        self.addSubview(kakaoLoginButton)
        self.addSubview(appleLoginButton)
    }
    
    
    private func setLayout() {
        descriptLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(150)
            $0.centerX.equalToSuperview()
        }
        
        kakaoLoginButton.snp.makeConstraints {
            $0.top.equalTo(descriptLabel.snp.top).offset(90)
            $0.centerX.equalTo(descriptLabel.snp.centerX)
        }
        
        appleLoginButton.snp.makeConstraints {
            $0.top.equalTo(kakaoLoginButton.snp.top).offset(90)
            $0.centerX.equalTo(descriptLabel.snp.centerX)
        }
        
        
    }
    
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


