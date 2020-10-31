//
//  SignInViewController.swift
//  Watcha
//
//  Created by 변상운 on 2020/10/31.
//  Copyright © 2020 sangun. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet var idTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Navigation Title
        self.navigationItem.title = "로그인"
        
        // Dismiss Keyboard When Tapped Arround
        self.dismissKeyboardWhenTappedAround()
    }

    @IBAction func loginButtonTaapped(_ sender: UIButton) {
        // ID validation
        guard let id = idTextField.text?.trim, id.isExists else {
            self.presentAlert(title: "아이디를 입력해주세요")
            return
        }
        
        // Password validation
        guard let password = passwordTextField.text, password.isExists else {
            self.presentAlert(title: "비밀번호를 입력해주세요")
            return
        }
        
        // Requst Sign In
        self.showIndicator()
        self.dismissKeyboard()
        let input = SignInInput(id: id, password: password)
        SignInDataManager().postSignIn(input, viewController: self)
    }
}

extension SignInViewController {
    func didSuccessSignIn(_ result: SignInResult) {
        self.presentAlert(title: "로그인에 성공하였습니다", message: result.token)
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
