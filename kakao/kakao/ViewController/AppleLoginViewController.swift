//
//  AppleLoginViewController.swift
//  kakao
//
//  Created by Gahyun Kim on 2023/12/27.
//

import UIKit

import SnapKit
import Then

// MARK: - Apple Login

final class AppleLoginViewController: UIViewController {

    private var subView : AppleLoginView?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setSubView()
    }
    
    
    private func setSubView() {
        subView = AppleLoginView(frame: view.bounds)
        if let resultView = subView {
            view.addSubview(resultView)
            resultView.setView()
        }
    }

    

    
}
