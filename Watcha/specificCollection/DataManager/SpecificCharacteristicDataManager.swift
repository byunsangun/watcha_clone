//
//  SpecificCharacteristicDataManager.swift
//  Watcha
//
//  Created by 변상운 on 2020/11/12.
//  Copyright © 2020 sangun. All rights reserved.
//

import Alamofire

class SpecificCharacteristicDataManager {
    
    func requestGenreList(viewController: SpecificCharacteristicViewController, genreIdx: Int) {
        let url = "https://prod.ericapp.shop/videos/genre-country?genre=\(genreIdx)"
        //Constant.jwt = UserDefaults.standard.string(forKey: "jwt")
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default,  headers: nil)
            .validate()
            .responseDecodable(of: SpecificCharacteristicResponse.self) { response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess {
                        viewController.didRetriveMovieList(response)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    print(String(data: response.data!, encoding: .utf8)!)
                    viewController.failToMovieList("서버와의 연결이 원활하지 않습니다(메인 영화 불러오기)")
                }
        }
    }
    
    
    func requestCountryList(viewController: SpecificCharacteristicViewController, countryIdx: Int) {
        let url = "https://prod.ericapp.shop/videos/genre-country?country=\(countryIdx)"
        //Constant.jwt = UserDefaults.standard.string(forKey: "jwt")
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default,  headers: nil)
            .validate()
            .responseDecodable(of: SpecificCharacteristicResponse.self) { response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess {
                        viewController.didRetriveMovieList(response)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    print(String(data: response.data!, encoding: .utf8)!)
                    viewController.failToMovieList("서버와의 연결이 원활하지 않습니다(메인 영화 불러오기)")
                }
        }
    }

    
}

