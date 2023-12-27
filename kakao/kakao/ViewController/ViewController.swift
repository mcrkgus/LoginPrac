//
//  ViewController.swift
//  kakao
//
//  Created by Gahyun Kim on 2023/12/22.
//

import UIKit

import KakaoSDKAuth
import KakaoSDKUser

final class ViewController: UIViewController {
    
    private var mainView : MainView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        setMainView()
        setButtonAction()
    }
    
    private func setMainView() {
        mainView = MainView(frame: view.bounds)
        if let resultView = mainView {
            view.addSubview(resultView)
            resultView.setView()
        }
    }
    
    private func setButtonAction() {
        let kakaoButton = mainView?.kakaoLoginButton
        let appleButton = mainView?.appleLoginButton
        
        kakaoButton?.addTarget(self, action: #selector(tappedKakaoButton), for: .touchUpInside)
        
        appleButton?.addTarget(self, action: #selector(clickAppleButton), for: .touchUpInside)
    }
    
    @objc func tappedKakaoButton() {
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
        let appleLoginVC = AppleLoginViewController()
        navigationController?.pushViewController(appleLoginVC, animated: true)
    }
    
    
}
