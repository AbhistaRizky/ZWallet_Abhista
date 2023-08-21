//
//  LoginResponses.swift
//  ZWallet
//
//  Created by laptop MCO on 16/08/23.
//

import Foundation

struct LoginResponses: Codable {
    var status: Int
    var message: String
    var data: LoginDataResponses
}

struct LoginDataResponses: Codable {
    var id: Int
    var email: String
    var token: String
}
