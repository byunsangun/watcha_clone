//
//  SpecificCharacteristicResponse.swift
//  Watcha
//
//  Created by 변상운 on 2020/11/12.
//  Copyright © 2020 sangun. All rights reserved.
//

struct SpecificCharacteristicResponse: Codable {
    let result: [ResultSpecific]
    let isSuccess: Bool
    let code: Int
    let message: String
}

// MARK: - Result
struct ResultSpecific: Codable {
    let videoIdx: Int
    let posterImage: String
    let videoName: String
}

