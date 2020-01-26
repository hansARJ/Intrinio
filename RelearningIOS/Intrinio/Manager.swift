//
//  Manager.swift
//  RelearningIOS
//
//  Created by Hans Arijanto on 2020-01-26.
//  Copyright © 2020 Hans Arijanto. All rights reserved.
//

import PromiseKit

extension Intrinio {
    class Manager {
        
        enum RequestError: Error {
            case badUrl
            case badRequest
            case badServer
            case badResponseFormat
        }
        
        private static let BASE_URL = "https://api-v2.intrinio.com/companies/"
        private static let API_KEY = "OmM1MDhkZTIwZjYzM2ZlZDQ1ZWExMmQ0Nzg3NjJkNzQy"
        
        init() {
        }
        
        func fetchData(company: Intrinio.CompanySymbol) -> Promise<Any> {
            return Promise { seal in
                fetchData(company: company) { result, error in
                    seal.resolve(error, result)
                }
            }
        }
        
        private func fetchData(company: Intrinio.CompanySymbol, completion: @escaping (Any?, Error?) -> Void) {
            let session = URLSession.shared
            guard var urlComponent = URLComponents(string: "\(Self.BASE_URL)\(company.rawValue)") else {
                completion(nil, RequestError.badUrl)
                return
            }
            urlComponent.query = "api_key=\(Self.API_KEY)"
            guard let url = urlComponent.url else {
                completion(nil, RequestError.badUrl)
                return
            }
            print(url)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil || data == nil {
                    completion(nil, error)
                    return
                }

                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    completion(nil, RequestError.badServer)
                    return
                }

                guard let mime = response.mimeType, mime == "application/json" else {
                    completion(nil, RequestError.badResponseFormat)
                    return
                }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    completion(json, nil)
                } catch {
                    completion(nil, error)
                }
            }
            
            task.resume()
        }
    }
}
