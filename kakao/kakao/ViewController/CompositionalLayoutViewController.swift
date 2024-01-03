//
//  CompositionalLayoutViewController.swift
//  kakao
//
//  Created by Gahyun Kim on 2024/01/01.
//

import UIKit

import SnapKit
import Then

class CompositionalLayoutViewController: UIViewController {
    
    private let compositionalLayoutView = CompositionalLayoutView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        compositionalLayoutView.collectionView.backgroundColor = .white
        setupHierarchy()
        createCollectionView()
    }
}


extension CompositionalLayoutViewController: UICollectionViewDelegate {}
extension CompositionalLayoutViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        case 1:
            return 3
        case 2:
            return 9
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstSectionCell.className, for: indexPath) as? FirstSectionCell else { return UICollectionViewCell() }
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondSectionCell.className, for: indexPath) as? SecondSectionCell
            else { return UICollectionViewCell() }
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThirdSectionCollectionViewCell.className, for: indexPath) as? ThirdSectionCollectionViewCell
            else { return UICollectionViewCell() }
            return cell
        }
    }
    
    // 헤더
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section {
        case 0:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleHeaderCollectionReusableView.className, for: indexPath) as? TitleHeaderCollectionReusableView
            else { return TitleHeaderCollectionReusableView() }
            header.configure()
            return header
        case 1:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SecondCollectionReusableView.className, for: indexPath) as? SecondCollectionReusableView
            else { return SecondCollectionReusableView() }
            header.configure()
            return header
        case 2:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ThirdCollectionReusableView.className, for: indexPath) as? ThirdCollectionReusableView
            else { return ThirdCollectionReusableView() }
            header.configure()
            return header
        default:
            return TitleHeaderCollectionReusableView()
        }
    }
    
    // 헤더의 크기 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0:
            return CGSize(width: 300, height: 30)
        case 1:
            return CGSize(width: 300, height: 30)
        default:
            return CGSize(width: 300, height: 30)
        }
    }
}


private extension CompositionalLayoutViewController {
    
    func setupHierarchy() {
        view.addSubview(compositionalLayoutView.collectionView)
        compositionalLayoutView.collectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
      
    func createCollectionView() {
        let collectionView = compositionalLayoutView.collectionView
        collectionView.backgroundColor = .clear
        collectionView.alwaysBounceVertical = true
        
        collectionView.register(FirstSectionCell.self, forCellWithReuseIdentifier: FirstSectionCell.className)
        collectionView.register(SecondSectionCell.self, forCellWithReuseIdentifier: SecondSectionCell.className)
        collectionView.register(ThirdSectionCollectionViewCell.self, forCellWithReuseIdentifier: ThirdSectionCollectionViewCell.className)
        
        collectionView.register(TitleHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                        withReuseIdentifier: TitleHeaderCollectionReusableView.className)
        
        collectionView.register(SecondCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SecondCollectionReusableView.className)
        
        
        collectionView.register(ThirdCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ThirdCollectionReusableView.className)
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
