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
    }
    
    private func setMainView() {
        mainView = MainView(frame: view.bounds)
        if let resultView = mainView {
            view.addSubview(resultView)
            resultView.setView()

            
        }
    }

    
    @objc func loginKakao() {
        print("loginKakao() called.")
        
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
    
    

}

