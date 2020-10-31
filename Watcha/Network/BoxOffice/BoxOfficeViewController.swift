//
//  BoxOfficeViewController.swift
//  Watcha
//
//  Created by 변상운 on 2020/10/31.
//  Copyright © 2020 sangun. All rights reserved.
//

import UIKit

class BoxOfficeViewController: BaseViewController {
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "BoxOfficeCell")
        return tableView
    }()
    
    var dailyBoxOfficeList: [DailyBoxOffice] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션 바 타이틀
        self.navigationItem.title = "영화 박스오피스"
        
        // Table View
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints { $0.edges.equalTo(self.view.safeAreaLayoutGuide) }
        
        // Request Box Office
        self.showIndicator()
        BoxOfficeDataManager().searchDailyBoxOfficeList(targetDt: "20160601", viewController: self)
    }
}

extension BoxOfficeViewController {
    func didRetrieveBoxOffice(result: BoxOfficeResult) {
        self.dismissIndicator()
        dailyBoxOfficeList = result.dailyBoxOfficeList
        tableView.reloadData()
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}

extension BoxOfficeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyBoxOfficeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "BoxOfficeCell")
        let boxOffice = dailyBoxOfficeList[indexPath.row]
        cell.textLabel?.text = "\(boxOffice.rank). \(String(boxOffice.audiCnt).insertComma)명"
        cell.detailTextLabel?.text = boxOffice.openDt
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let boxOffice = dailyBoxOfficeList[indexPath.row]
        let movieInfoViewController = MovieInfoViewController(movie: boxOffice)
        self.navigationController?.pushViewController(movieInfoViewController, animated: true)
    }
}

