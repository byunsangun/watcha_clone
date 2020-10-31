//
//  TransitionNextViewController.swift
//  Watcha
//
//  Created by 변상운 on 2020/10/31.
//  Copyright © 2020 sangun. All rights reserved.
//

import UIKit
import SnapKit

class TransitionNextViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dismissButton = UIButton()
        self.view.addSubview(dismissButton)
        dismissButton.setTitle("뒤로가기/닫기", for: .normal)
        dismissButton.setTitleColor(.systemBlue, for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        dismissButton.snp.makeConstraints { $0.center.equalToSuperview() }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = .red
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.view.backgroundColor = .yellow
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.view.backgroundColor = .green
    }
    
    @objc func dismissView() {
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
