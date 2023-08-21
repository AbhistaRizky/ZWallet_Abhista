//
//  AuthNetwork.swift
//  ZWallet
//
//  Created by laptop MCO on 16/08/23.
//

import Foundation
import Moya

class AuthNetwork {
    
    func login(email: String, password: String, completion: @escaping (LoginDataResponses?, Error?) -> ()) {
        let provider = MoyaProvider<Auth>(
            plugins: [NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))]
        )
        provider.request(.login(email: email, password: password)) { response in
            switch response{
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let loginResponse = try decoder.decode(LoginResponses.self, from: result.data)
                    completion(loginResponse.data, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func getProfile(completion: @escaping (ProfileDataResponses?, Error?) -> ()) {
        let provider = MoyaProvider<Auth>(plugins: [NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))])
        
        provider.request(.getProfile) { response in
            switch response{
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let profileResponse = try decoder.decode(ProfileResponses.self, from: result.data)
                    completion(profileResponse.data, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func signUp(username: String, email: String, password: String, completion: @escaping (SignUpResponses?, Error?) -> ()) {
        let provider = MoyaProvider<Auth>(
            plugins: [NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))]
        )
        provider.request(.signUp(username: username, email: email, password: password)) { response in
            switch response{
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let signUpResponse = try decoder.decode(SignUpResponses.self, from: result.data)
                    completion(signUpResponse, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func forgotPassword(email: String, password: String, completion: @escaping (ForgotPasswordResponses?, Error?) -> ()) {
        let provider = MoyaProvider<Auth>(
            plugins: [NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))]
        )
        provider.request(.forgotPassword(email: email, password: password)) { response in
            switch response{
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let forgotPasswordResponse = try decoder.decode(ForgotPasswordResponses.self, from: result.data)
                    completion(forgotPasswordResponse, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func logout(completion: @escaping (LogoutResponses?) -> ()) {
        let provider = MoyaProvider<Auth>(plugins: [NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))])
        
        provider.request(.logout) { response in
            switch response{
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let logoutResponse = try decoder.decode(LogoutResponses.self, from: result.data)
                    completion(logoutResponse)
                } catch _ {
                    completion(nil)
                }
            case .failure(_):
                completion(nil)
            }
        }
    }
    
}
