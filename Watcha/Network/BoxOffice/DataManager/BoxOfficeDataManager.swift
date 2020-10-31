//
//  BoxOfficeDataManager.swift
//  Watcha
//
//  Created by 변상운 on 2020/10/31.
//  Copyright © 2020 sangun. All rights reserved.
//

import Alamofire

class BoxOfficeDataManager {
    func searchDailyBoxOfficeList(targetDt: String, viewController: BoxOfficeViewController) {
        let url = "\(Constant.KOBIS_BASE_URL)/boxoffice/searchDailyBoxOfficeList.json"
            + "?key=\(KobisKey.DAILY_BOXOFFICE_KEY)"
            + "&targetDt=\(targetDt)"
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .validate()
            .responseDecodable(of: BoxOfficeResponse.self) { response in
                switch response.result {
                case .success(let response):
                    viewController.didRetrieveBoxOffice(result: response.boxOfficeResult)
                case .failure(let error):
                    print(error.localizedDescription)
                    viewController.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}

