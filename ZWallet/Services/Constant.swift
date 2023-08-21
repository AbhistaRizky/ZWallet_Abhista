//
//  Constant.swift
//  ZWallet
//
//  Created by laptop MCO on 16/08/23.
//

import Foundation

class Constant {
    static var baseURL: String {
        return Bundle.main.infoDictionary?["BaseURL"] as? String ?? ""
    }
    static var Token = UserDefaults.standard.value(forKey: "AccessToken")
    static var firstname = UserDefaults.standard.value(forKey: "firstname")
    static var lastname = UserDefaults.standard.value(forKey: "lastname")
    static var phone = UserDefaults.standard.value(forKey: "phone")
    static var image = UserDefaults.standard.value(forKey: "image") 

}
