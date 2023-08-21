//
//  API.swift
//  ZWallet
//
//  Created by laptop MCO on 16/08/23.
//

import Foundation
import Moya

enum Auth {
    case login(email: String, password: String)
    case signUp(username: String, email: String, password: String)
    case forgotPassword(email: String, password: String)
    case getProfile
    case logout
}

extension Auth: TargetType {
    var baseURL: URL {
        return URL(string: "http://54.158.117.176:8000")!
    }
    var path: String {
        switch self {
        case .login:
            return "/auth/login"
        case .signUp:
            return "/auth/signup"
        case .forgotPassword:
            return "/auth/reset"
        case .getProfile:
            return "/user/myProfile"
        case .logout:
            return "/auth/logout/\(Constant.Token ?? "")"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login, .signUp:
            return .post
        case .getProfile:
            return .get
        case .forgotPassword:
            return .patch
        case  .logout:
            return .delete
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .login(let email, let password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: URLEncoding.default)
        case .getProfile, .logout:
            return .requestPlain
        case .signUp(let username, let email, let password):
            return .requestParameters(parameters: ["username": username, "email": email, "password": password], encoding: URLEncoding.default)
        case .forgotPassword(let email, let password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .login, .signUp, .forgotPassword:
            return nil
        case .getProfile, .logout:
            return ["Authorization": "Bearer \(Constant.Token ?? "")"]
        }
    }
    
}
