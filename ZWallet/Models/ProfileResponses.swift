//
//  ProfileResponses.swift
//  ZWallet
//
//  Created by laptop MCO on 16/08/23.
//

import Foundation

struct ProfileResponses: Codable {
    var status: Int
    var message: String
    var data: ProfileDataResponses
}

struct ProfileDataResponses: Codable {
    var firstname: String
    var lastname: String
    var email: String
    var phone: String
    var image: String
}
