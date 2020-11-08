//
//  SpecificCollectionViewController.swift
//  Watcha
//
//  Created by 변상운 on 2020/11/08.
//  Copyright © 2020 sangun. All rights reserved.
//

import UIKit

class SpecificcharacteristicViewController: UIViewController {

    @IBOutlet weak var specificCollectionView: UICollectionView!
    var movieList : [ViedoHome] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nibTableViewCellName = UINib(nibName: "SpecificCollectionViewCell", bundle: nil)
        specificCollectionView.register(nibTableViewCellName, forCellWithReuseIdentifier: "SpecificCollectionViewCell")
        
        
    }


}
