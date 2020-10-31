//
//  MovieInfoViewController.swift
//  Watcha
//
//  Created by 변상운 on 2020/10/31.
//  Copyright © 2020 sangun. All rights reserved.
//

import UIKit

class MovieInfoViewController: BaseViewController {
    var infoLabel: UILabel = {
        let label = UILabel()
        label.font = .NotoSans(.medium, size: 16)
        return label
    }()
    
    let movie: DailyBoxOffice
    
    init(movie: DailyBoxOffice) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션 바 타이틀
        self.navigationItem.title = movie.movieCd
        
        // Info Label
        infoLabel.text = movie.movieNm
        self.view.addSubview(infoLabel)
        infoLabel.snp.makeConstraints { $0.center.equalToSuperview() }
    }
}

