//
//  SpecificCollectionViewController.swift
//  Watcha
//
//  Created by 변상운 on 2020/11/08.
//  Copyright © 2020 sangun. All rights reserved.
//

import UIKit

class SpecificCharacteristicViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    

    @IBOutlet weak var specificCharacteristicCollectionView: UICollectionView!
    var specificCharcteristicList : [ResultSpecific] = []
    
    var genreIdxSent = 0
    var genreIdx = 0
    
    var countryIdxSent = 0
    var countryIdx = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        genreIdx = genreIdxSent
        countryIdx = countryIdxSent
        
        // 영화 리스트 api 호출
        self.showIndicator()
        if(genreIdxSent != 0 && countryIdxSent == 0) {
            SpecificCharacteristicDataManager().requestGenreList(viewController: self, genreIdx: genreIdx)
        }
        else if(genreIdxSent == 0 && countryIdxSent != 0){
            SpecificCharacteristicDataManager().requestCountryList(viewController: self, countryIdx: countryIdx)
        }
        
        
        
        specificCharacteristicCollectionView.delegate = self
        specificCharacteristicCollectionView.dataSource = self
        specificCharacteristicCollectionView.backgroundColor = .black

        let nibTableViewCellName = UINib(nibName: "SpecificCharacteristicViewCell", bundle: nil)
        specificCharacteristicCollectionView.register(nibTableViewCellName, forCellWithReuseIdentifier: "SpecificCharacteristicViewCell")
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        layout.itemSize = CGSize(width: width / 2 - 10, height: width / 2 - 40)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        specificCharacteristicCollectionView!.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(specificCharcteristicList.count != 0){
            return specificCharcteristicList.count
        }
        else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SpecificCharacteristicViewCell", for: indexPath) as! SpecificCharacteristicViewCell
        
        if(specificCharcteristicList.count != 0){
            let url = URL(string: "\(specificCharcteristicList[indexPath.row].posterImage)")
            let data = try? Data(contentsOf: url!)
            cell.movieImage.image = UIImage(data: data!)
            
            cell.movieName.text = specificCharcteristicList[indexPath.row].videoName
            cell.tag = specificCharcteristicList[indexPath.row].videoIdx
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextVC = MovieDetailViewController()
        nextVC.videoIdxSent = specificCharcteristicList[indexPath.row].videoIdx
        self.navigationController?.pushViewController(nextVC, animated: true)
    }


}


extension SpecificCharacteristicViewController {
    func didRetriveMovieList(_ Result : SpecificCharacteristicResponse) {
        
        dismissIndicator()
        specificCharcteristicList.append(contentsOf: Result.result)
        specificCharacteristicCollectionView.reloadData()
        print("success")
    }
    
    func failToMovieList(_ message: String){
        print("failure")
        self.presentAlert(title: message)
    }
}
