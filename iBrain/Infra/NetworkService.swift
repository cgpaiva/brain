//
//  NetworkService.swift
//  iBrain
//
//  Created by Gabriel on 09/01/23.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol {
    func request<T: Decodable>(router: Router, completion: @escaping (Result<T, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func request<T>(router: Router, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {

        AF.request(router.url, method: router.method, parameters: router.params, encoding: JSONEncoding.default, headers: router.headers)
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
