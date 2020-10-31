//
//  SplashViewController.swift
//  Watcha
//
//  Created by 변상운 on 2020/10/31.
//  Copyright © 2020 sangun. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    @IBAction func mainButtonTapped(_ sender: UIButton) {
        let baseTabBarController = BaseTabBarController()
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = baseTabBarController
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil)
        } else {
            baseTabBarController.modalPresentationStyle = .overFullScreen
            self.present(baseTabBarController, animated: true, completion: nil)
        }
    }
}
