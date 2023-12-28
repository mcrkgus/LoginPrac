//
//  TabbarController.swift
//  kakao
//
//  Created by Gahyun Kim on 2023/12/28.
//

import UIKit


final class TabbarController: UITabBarController {
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setStyle()
        self.addTabBarController()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.navigationBar.isHidden = true
        self.navigationItem.hidesBackButton = true
    }
  
    
    // MARK: - Set up Style
    
    private func setStyle() {
        self.view.backgroundColor = .white
        tabBar.backgroundColor = .lightGray
    
    }
    
    
    // MARK: - Methods
    
    private func addTabBarController() {
        var tabNavigationControllers = [UINavigationController]()
        
        for item in TabbarItem.allCases {
            let tabNavController = createTabNavigationController(
                title: item.description,
                image: item.normalImage ?? UIImage(),
                selectedImage: item.selectedImage ?? UIImage(),
                viewController: item.targetViewController
            )
            tabNavigationControllers.append(tabNavController)
        }
        setViewControllers(tabNavigationControllers, animated: true)
    }
    
    
    private func createTabNavigationController(title: String, image: UIImage, selectedImage: UIImage, viewController: UIViewController?) -> UINavigationController {
        let tabNavigationController = UINavigationController()
        
        let tabbarItem = UITabBarItem(
            title: title,
            image: image.withRenderingMode(.alwaysOriginal),
            selectedImage: selectedImage.withRenderingMode(.alwaysOriginal)
        )
        
        // 사실 얘네는 나중에... 지금은 별로 필요없서잉 ㅋㅋ ~
        // title이 선택되지 않았을 때 폰트, 색상 설정
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.darkGray
        ]
        
        // title이 선택되었을 때 폰트, 색상 설정
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black
        ]
        
        tabbarItem.setTitleTextAttributes(normalAttributes, for: .normal)
        tabbarItem.setTitleTextAttributes(selectedAttributes, for: .selected)
        
        tabNavigationController.tabBarItem = tabbarItem
        if let viewController = viewController {
                tabNavigationController.viewControllers = [viewController]
            }
        return tabNavigationController
    }
}
