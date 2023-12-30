//
//  CategoryViewController.swift
//  kakao
//
//  Created by Gahyun Kim on 2023/12/28.
//

import UIKit

import SnapKit
import Then

final class CategoryViewController: UIViewController {
    
    // MARK: - Properties
    
    private var categoryTableView = UITableView()

    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - set up Style
    
    private func setupStyle() {
        
    }
    
    
    // MARK: - set up Hierarchy
    
    private func setupHierarchy() {
        view.addSubview(categoryTableView)
    }
    
    
    // MARK: - set up Layout
    
    private func setupLayout() {
        categoryTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setupTableView() {
//        categoryTableView.delegate = self
//        categoryTableView.dataSource = self
    }
}
