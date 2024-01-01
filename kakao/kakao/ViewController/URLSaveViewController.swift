//
//  URLSaveViewController.swift
//  kakao
//
//  Created by Gahyun Kim on 2023/12/30.
//

import UIKit

import SnapKit
import Then

final class URLSaveViewController: UIViewController {
    
    private var urlSaveView : URLSaveView?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setURLSaveView()

    }
    
    // MARK: - set up MainView
    
    private func setURLSaveView() {
        urlSaveView = URLSaveView(frame: view.bounds)
        if let resultView = urlSaveView {
            view.addSubview(resultView)
            resultView.setView()
        }
    }

}
