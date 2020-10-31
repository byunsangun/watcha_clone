//
//  SignInResponse.swift
//  Watcha
//
//  Created by 변상운 on 2020/10/31.
//  Copyright © 2020 sangun. All rights reserved.
//

struct SignInResponse: Decodable {
    var code: Int
    var message: String
    var isSuccess: Bool
    var result: SignInResult?
}

struct SignInResult: Decodable {
    var token: String
    var userInfoIdx: Int
}
