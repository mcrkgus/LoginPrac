//
//  URLSaveView.swift
//  kakao
//
//  Created by Gahyun Kim on 2023/12/30.
//

import UIKit

import WebKit
import LinkPresentation

import SnapKit
import Then

final class URLSaveView: UIView {

    // MARK: - Properties
    
    private let urlTextField = UITextField()
    private let titleTextField = UITextField()
    private let checkButton = UIButton()
    
    private let myWebView = WKWebView()
    
    
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
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - set up Style
    
    private func setupStyle() {
        
        urlTextField.do {
            $0.placeholder = "url"
            $0.backgroundColor = .white
            $0.layer.borderColor = UIColor.black.cgColor
            $0.layer.borderWidth = 1
        
        }
        
        checkButton.do {
            $0.titleLabel?.text = "확인"
            $0.backgroundColor = .black
            $0.titleLabel?.textColor = .white
            $0.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        }
        
        titleTextField.do {
            $0.backgroundColor = .white
            $0.layer.borderColor = UIColor.black.cgColor
            $0.layer.borderWidth = 1
        }
        
    }
    
    
    // MARK: - set up Hierarchy
    
    private func setupHierarchy() {
        self.addSubview(urlTextField)
        self.addSubview(checkButton)
        self.addSubview(titleTextField)
        self.addSubview(myWebView)
    }
    
    
    // MARK: - set up Layout
    
    private func setupLayout() {
        urlTextField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.leading.equalToSuperview().inset(30)
            $0.width.equalTo(300)
            $0.height.equalTo(45)
        }
        
        checkButton.snp.makeConstraints {
            $0.top.equalTo(urlTextField.snp.top)
            $0.leading.equalTo(urlTextField.snp.trailing).offset(10)
        }
        
        titleTextField.snp.makeConstraints {
            $0.top.equalTo(urlTextField.snp.bottom).offset(50)
            $0.leading.equalToSuperview().inset(30)
            $0.width.equalTo(300)
            $0.height.equalTo(45)
        }
        
        myWebView.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(300)
        }
    }
    
    @objc func tappedButton() {
        let urlLink = urlTextField.text!
        print("❤️", urlLink)
        loadWebPage(urlLink)
        metaData()

    }

    private func loadWebPage(_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    

    private func metaData() {
        // url Text Field에 입력한 URL 링크 Title 가져오기
        let metadataProvider = LPMetadataProvider()
        let url = URL(string: urlTextField.text ?? "ERROR")!
        metadataProvider.startFetchingMetadata(for: url)
        { (returnedMetadata, error) in
            if let metadata = returnedMetadata, error == nil {
                print("💙Title💙 : " + (metadata.title ?? "No Title"))
            }
        }
    }
    

}


