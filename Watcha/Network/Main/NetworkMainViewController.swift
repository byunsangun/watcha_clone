//
//  NetworkMainViewController.swift
//  Watcha
//
//  Created by 변상운 on 2020/10/31.
//  Copyright © 2020 sangun. All rights reserved.
//

import UIKit

class NetworkMainViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션 바 타이틀
        self.navigationItem.title = "Network 메인"
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        self.navigationController?.pushViewController(SignInViewController(), animated: true)
    }
    
    @IBAction func searchMovieButtonTapped(_ sender: UIButton) {
        self.navigationController?.pushViewController(BoxOfficeViewController(), animated: true)
    }
}
