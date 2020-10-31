//
//  FirstViewController.swift
//  Watcha
//
//  Created by 변상운 on 2020/10/31.
//  Copyright © 2020 sangun. All rights reserved.
//

import UIKit

class FirstViewController: BaseViewController {

   
    @IBOutlet weak var firstNavigationBar: UINavigationBar!
    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var introLabel2: UILabel!
    @IBOutlet weak var introLabel3: UILabel!
    @IBOutlet weak var introLabel4: UILabel!
    @IBOutlet weak var introLabel5: UILabel!
    @IBOutlet weak var introLabel6: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .mainBlack
        self.navigationController?.navigationBar.isTransparent = false
        
        introLabel.font = .NotoSans(.bold, size: 38)
        introLabel2.font = .NotoSans(.regular, size: 19)
        introLabel3.font = .NotoSans(.bold, size: 25)
        introLabel4.font = .NotoSans(.regular, size: 17)
        introLabel4.textColor = UIColor.darkGray
        introLabel5.font = .NotoSans(.bold, size: 25)
        introLabel6.font = .NotoSans(.regular, size: 17)
        introLabel6.textColor = UIColor.darkGray
        
        self.firstNavigationBar.topItem?.title = "WATCHA"
        self.firstNavigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemPink, NSAttributedString.Key.font: UIFont(name: "Georgia-Bold", size: 30)!]
        
        self.firstNavigationBar.barTintColor = .mainBlack
        self.firstNavigationBar.isTransparent = false
        
    }


   
}
