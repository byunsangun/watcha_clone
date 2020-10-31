//
//  TransitionViewController.swift
//  Watcha
//
//  Created by 변상운 on 2020/10/31.
//  Copyright © 2020 sangun. All rights reserved.
//

import UIKit

class TransitionViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션 바 타이틀
        self.navigationItem.title = "화면 전환"
    }
    
    // 네비게이션 컨트롤러를 이용한 화면전환
    @IBAction func pushViewController(_ sender: Any) {
        self.navigationController?.pushViewController(TransitionNextViewController(), animated: true)
    }
    
    // 네비게이션 컨트롤러를 이용한 뒤로가기
    @IBAction func popViewController(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // 네비게이션 컨트롤러의 RootViewController로 이동
    @IBAction func popToRootViewController(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    // 화면 일부를 덮는 modal
    @IBAction func presentViewController(_ sender: Any) {
        self.present(TransitionNextViewController(), animated: true, completion: nil)
    }
    
    // 화면 전체를 덮는 modal
    @IBAction func presentViewControllerOverFullScreen(_ sender: Any) {
        let nextVC = TransitionNextViewController()
        nextVC.modalPresentationStyle = .overFullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
    // 새로운 window로 화면전환
    @IBAction func transitionWindow(_ sender: Any) {
        let splashViewController = SplashViewController()
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = splashViewController
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil)
        } else {
            splashViewController.modalPresentationStyle = .overFullScreen
            self.present(splashViewController, animated: true, completion: nil)
        }
    }
}
