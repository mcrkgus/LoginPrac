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
    
    let firstSectionCell = FirstSectionCell()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { (section, environment) -> NSCollectionLayoutSection? in
            var group: NSCollectionLayoutGroup?
            
            switch section {
            case 0:
                let itemFractionalWidthFraction = 1.0 / 2.0 // horizontal 2개의 셀
                let groupFractionalHeightFraction = 1.0 / 2.0 // vertical 2개의 셀
                let itemInset: CGFloat = 5
                
                // Item
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(itemFractionalWidthFraction),
                    heightDimension: .fractionalHeight(1)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: itemInset, leading: itemInset, bottom: itemInset, trailing: itemInset)
                
                // Group
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(150)
                )
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                // Section
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: itemInset, leading: itemInset, bottom: itemInset, trailing: itemInset)
                return section
                
                
            case 1:
                let itemFractionalWidthFraction = 1.0 / 1.0 // horizontal 1개의 셀
                let groupFractionalHeightFraction = 1.0 / 3.0 // vertical 3개의 셀
                let itemInset: CGFloat = 3
                
                // Item
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(itemFractionalWidthFraction),
                    heightDimension: .fractionalHeight(1)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: itemInset, leading: itemInset, bottom: itemInset, trailing: itemInset)
                
                // Group
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(600)
                )
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 5)
                
                // Section
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: itemInset, leading: itemInset, bottom: itemInset, trailing: itemInset)
                return section
                
                
            default:
                
                let itemFractionalWidthFraction = 1.0 / 3.0 // horizontal 3개의 셀
                let groupFractionalHeightFraction = 1.0 / 3.0 // vertical 3개의 셀
                let itemInset: CGFloat = 2.5
                
                // Item
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(itemFractionalWidthFraction),
                    heightDimension: .fractionalHeight(1)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: itemInset, leading: itemInset, bottom: itemInset, trailing: itemInset)
                
                // Group
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(150)
                )
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                // Section
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: itemInset, leading: itemInset, bottom: itemInset, trailing: itemInset)
                return section
                
                
            }
        }
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(FirstSectionCell.self, forCellWithReuseIdentifier: FirstSectionCell.className)
        collectionView.register(SecondSectionCell.self, forCellWithReuseIdentifier: SecondSectionCell.className)
        collectionView.register(ThirdSectionCollectionViewCell
            .self, forCellWithReuseIdentifier: ThirdSectionCollectionViewCell.className)
        
        collectionView.register(TitleHeaderCollectionReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: TitleHeaderCollectionReusableView.className)
        return collectionView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    
    
    // Helper function to create a grid item
    private static func createItem() -> NSCollectionLayoutItem {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
        return NSCollectionLayoutItem(layoutSize: itemSize)
    }
}



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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section {
            //case 0은 헤더가 없으므로 생략
        case 0 :
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                               withReuseIdentifier: TitleHeaderCollectionReusableView.className,
                                                                               for: indexPath) as? TitleHeaderCollectionReusableView
            else { return TitleHeaderCollectionReusableView() }
            header.configure()
            return header
        default :
            return TitleHeaderCollectionReusableView()
        }
    }
    
    // 헤더의 크기 지정
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            switch section {
            case 0 :
                return CGSize(width: 300, height: 100)
            default :
                return CGSize.zero
            }
        }
}
