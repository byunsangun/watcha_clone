//
//  ActionMainViewController.swift
//  Watcha
//
//  Created by 변상운 on 2020/10/31.
//  Copyright © 2020 sangun. All rights reserved.
//

import UIKit

class ActionMainViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션 바 타이틀
        self.navigationItem.title = "Action 메인"
    }
    
    @IBAction func transitionButtonTapped(_ sender: UIButton) {
        self.navigationController?.pushViewController(TransitionViewController(), animated: true)
    }
    
    @IBAction func indicatorButtonTapped(_ sender: UIButton) {
        showIndicator()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.dismissIndicator()
        }
    }
    
    @IBAction func gifIndicatorButtonTapped(_ sender: UIButton) {
        let containerView = UIView(frame: UIScreen.main.bounds)
        let activityIndicator = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: 191.8, height: 85.2)))
        let images: [UIImage] = Array(0..<12).map{ UIImage(named: "bts\($0)")! }
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        containerView.frame = window.frame
        containerView.center = window.center
        containerView.backgroundColor = .clear
        containerView.addSubview(activityIndicator)
        UIApplication.shared.windows.first?.addSubview(containerView)
        
        containerView.backgroundColor = UIColor(hex: 0x000000, alpha: 0.4)
        activityIndicator.center = containerView.center
        activityIndicator.animationImages = images
        activityIndicator.animationDuration = Double(activityIndicator.animationImages?.count ?? 0) / 12
        activityIndicator.animationRepeatCount = 0
        activityIndicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            activityIndicator.stopAnimating()
            containerView.removeFromSuperview()
        }
    }
    
    @IBAction func alertButtonTapped(_ sender: UIButton) {
        self.navigationController?.pushViewController(AlertViewController(), animated: true)
    }
}
