//
//  URLSaveView.swift
//  kakao
//
//  Created by Gahyun Kim on 2023/12/30.
//

import UIKit

import LinkPresentation

import SnapKit
import Then

final class URLSaveView: UIView, UITextFieldDelegate {
    
    // MARK: - Properties
    
    private let descriptLabel = UILabel()
    private let urlTextField = UITextField()
    private let titleTextField = UITextField()
    private let nextButton = UIButton()
    private let checkButton = UIButton()
    
    lazy var accessoryView: UIView = { return UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: 72.0)) }()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        urlTextField.delegate = self
        urlTextField.becomeFirstResponder()
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
        self.backgroundColor = .white
        
        descriptLabel.do {
            $0.text = "링크를 입력하세요"
            $0.font = .systemFont(ofSize: 22)
        }
        
        urlTextField.do {
            $0.placeholder = "url"
            $0.backgroundColor = .clear
            $0.layer.borderColor = UIColor.black.cgColor
            $0.layer.borderWidth = 0.3
            $0.inputAccessoryView = accessoryView
            $0.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        }
        
       
        titleTextField.do {
            $0.backgroundColor = .white
            $0.layer.borderColor = UIColor.black.cgColor
            $0.layer.borderWidth = 1
        }
        
        nextButton.do {
            $0.setTitle("완료", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .lightGray
            $0.addTarget(self, action: #selector(tappedNextButton), for: .touchUpInside)
            $0.layer.cornerRadius = 9
        }
        
        checkButton.do {
            $0.setTitle("확인", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .lightGray
            $0.addTarget(self, action: #selector(tappedCheckButton), for: .touchUpInside)
        }
        
    }
    
    
    // MARK: - set up Hierarchy
    
    private func setupHierarchy() {
        self.addSubview(descriptLabel)
        self.addSubview(urlTextField)
        self.addSubview(nextButton)
        self.addSubview(titleTextField)
        accessoryView.addSubview(checkButton)
    }
    
    
    // MARK: - set up Layout
    
    private func setupLayout() {
        descriptLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(75)
            $0.leading.equalToSuperview().inset(35)
        }
    
        urlTextField.snp.makeConstraints {
            $0.top.equalTo(descriptLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(30)
            $0.width.equalTo(300)
            $0.height.equalTo(45)
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalTo(super.snp.bottom).inset(96)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(62)
        }
        
        titleTextField.snp.makeConstraints {
            $0.top.equalTo(urlTextField.snp.bottom).offset(50)
            $0.leading.equalToSuperview().inset(30)
            $0.width.equalTo(300)
            $0.height.equalTo(45)
        }
        
        // 키보드 위에 버튼 올리기 위한 Layout
        guard let checkButtonSuperView = checkButton.superview else { return }
        checkButton.snp.makeConstraints {
            $0.leading.trailing.equalTo(checkButtonSuperView).inset(15)
            $0.height.equalTo(56)
        }
        
    }
    
    // 다음 버튼
    @objc func tappedNextButton() {
        nextButton.backgroundColor = .black
        let urlLink = urlTextField.text!
        print("❤️", urlLink)
        metaData()
    }
    
    // 확인 버튼
    @objc func tappedCheckButton() {
        print("확인 버튼이 눌렸다용")
    }
    
    // 확인 버튼 색상 변경
    @objc func textFieldDidChange(_ sender: Any?) {
        var textCount = urlTextField.text!.count //textField 의 글자수를 저장
        print("현재 : ", textCount)
        if textCount > 0 {
            checkButton.backgroundColor = .black
        }
        else {
            checkButton.backgroundColor = .lightGray
        }
    }
    
    private func metaData() {
        
        // url Text Field에 입력한 URL 링크 Title 가져오기
        let metadataProvider = LPMetadataProvider()
        let url = URL(string: urlTextField.text ?? "ERROR")!
        //        metadataProvider.startFetchingMetadata(for: url)
        //        { (returnedMetadata, error) in
        //            if let metadata = returnedMetadata, error == nil {
        //                print("💙Title💙 : " + (metadata.title ?? "No Title"))
        //                ss = metadata.title ?? "No Title"
        //                //self.titleTextField.text = metadata.title
        //            }
        //            print(ss)
        //            //titleTextField.text = ss
        //        }
        metadataProvider.startFetchingMetadata(for: url) { returnedMetaData, error in
            let metadata = returnedMetaData
            print("💙" + (metadata?.title ?? "No Title"))
        }
    }
}


//extension URLSaveView: UITextFieldDelegate {
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//            // 키보드를 보여줍니다.
//            textField.becomeFirstResponder()
//        }
//}
