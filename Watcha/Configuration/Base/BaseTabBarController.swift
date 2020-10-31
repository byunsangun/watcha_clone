//
//  BaseTabBarController.swift
//  Watcha
//
//  Created by 변상운 on 2020/10/31.
//  Copyright © 2020 sangun. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController, UITabBarControllerDelegate {
    let actionViewController  = ActionMainViewController()
    let networkViewController = NetworkMainViewController()
    
    let actionTabBarItem  = UITabBarItem(title: "Action", image: nil, tag: 0)
    let networkTabBarItem = UITabBarItem(title: "Network", image: nil, tag: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let actionNetworkController = UINavigationController(rootViewController: actionViewController)
        let networkNetworkController = UINavigationController(rootViewController: networkViewController)
        
        actionNetworkController.tabBarItem  = actionTabBarItem
        networkNetworkController.tabBarItem = networkTabBarItem
        
        self.viewControllers = [actionNetworkController, networkNetworkController]
        
        self.delegate = self
    }
}
