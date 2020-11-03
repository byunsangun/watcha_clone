//
//  LoginPopupViewController.swift
//  Watcha
//
//  Created by 변상운 on 2020/11/01.
//  Copyright © 2020 sangun. All rights reserved.
//

import UIKit

class LoginPopupViewController: BaseViewController {

    @IBOutlet weak var loginPopupLabel: UILabel!
    
    @IBOutlet weak var naverLoginButton: UIButton!
    @IBOutlet weak var appleLoginButton: UIButton!
    @IBOutlet weak var emailLoginButton: UIButton!
    @IBOutlet weak var otherLoginButton: UILabel!
    
    @IBAction func cancelPopupButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func naverLoginButtonTapped(_ sender: UIButton) {
        
//        // 임시 화면 전환(테스트용)
//        let nextVC = SelectProfileViewController()
//        nextVC.modalPresentationStyle = .overFullScreen
//        self.present(nextVC, animated: true, completion: nil)
        
        let loginVC = loginViewController()
        loginVC.modalPresentationStyle = .overFullScreen
        self.present(loginVC, animated: true, completion: nil)
    }
    
    let naverLogin = UIImage(named: "NaverLogin")
    let appleLogin = UIImage(named: "AppleLogin")
    let emailLogin = UIImage(named: "EmailLogin")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginPopupLabel.font = .NotoSans(.bold, size: 18)
        self.view.backgroundColor = UIColor.mainBlack.withAlphaComponent(0.5)
        
        naverLoginButton.setImage(naverLogin, for: .normal)
        appleLoginButton.setImage(appleLogin, for: .normal)
        emailLoginButton.setImage(emailLogin, for: .normal)
        otherLoginButton.textColor = UIColor.lightGray
        
    }


    
}
