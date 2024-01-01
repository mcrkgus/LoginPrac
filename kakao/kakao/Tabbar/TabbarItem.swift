//
//  TabbarItem.swift
//  kakao
//
//  Created by Gahyun Kim on 2023/12/28.
//

import UIKit

// Tabbar에 들어가는 Item enum으로 정의
enum TabbarItem: CaseIterable {
    case home
    case category
    case add
    case remind
    case my
    
    // 선택되지 않은 탭
    var normalImage: UIImage? {
        switch self {
        case .home:
            return UIImage(systemName: "house")?.withTintColor(.darkGray)
        case .category:
            return UIImage(systemName: "folder")?.withTintColor(.darkGray)
        case .add:
            return UIImage(systemName: "plus.circle")?.withTintColor(.darkGray)
        case .remind:
            return UIImage(systemName: "lightbulb.max")?.withTintColor(.darkGray)
        case .my:
            return UIImage(systemName: "person")?.withTintColor(.darkGray)
        }
    }
    
    // 선택된 탭
    var selectedImage: UIImage? {
        switch self {
        case .home:
            return UIImage(systemName: "house.fill")?.withTintColor(.black)
        case .category:
            return UIImage(systemName: "folder.fill")?.withTintColor(.black)
        case .add:
            return UIImage(systemName: "plus.circle.fill")?.withTintColor(.black)
        case .remind:
            return UIImage(systemName: "lightbulb.max.fill")?.withTintColor(.black)
        case .my:
            return UIImage(systemName: "person.fill")?.withTintColor(.black)
        }
    }
    
    // 탭 별 제목
    var description: String {
        switch self {
        case .home: return "홈"
        case .category: return "카테고리"
        case .add: return ""
        case .remind: return "리마인드"
        case .my: return "마이페이지"
        }
    }
    
    
    // 탭 별 전환될 화면 -> 나중에 하나씩 추가 ㄱㄱ
    var targetViewController: UIViewController? {
        switch self {
        case .home: return ViewController()
        case .category: return AppleLoginViewController()
        case .add: return nil
        case .remind: return URLSaveViewController()
        case .my: return nil
        }
    }
    
}
