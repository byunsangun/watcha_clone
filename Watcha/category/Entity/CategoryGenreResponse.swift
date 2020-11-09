//
//  CategoryResponse.swift
//  Watcha
//
//  Created by 변상운 on 2020/11/09.
//  Copyright © 2020 sangun. All rights reserved.
//

struct CategoryGenreResponse: Codable {
    let result: [ResultGenre]
    let isSuccess: Bool
    let code: Int
    let message: String
}

// MARK: - Result
struct ResultGenre: Codable {
    let idx: Int
    let genreTitle: String
}
