//
//  RequestManager.swift
//  RelearningIOS
//
//  Created by Hans Arijanto on 2020-01-26.
//  Copyright © 2020 Hans Arijanto. All rights reserved.
//

import Foundation
import PromiseKit

class RequestManager {
    enum RequestError: Error {
        case badUrl
        case badRequest
        case badServer
        case noData
        case badResponseFormat
    }
    
    enum MimeType: String {
        case json = "application/json"
    }
    
    func getJSON(url: String, query: String?) -> Promise<Any> {
        return get(url: url, query: query).map { data in
            try JSONSerialization.jsonObject(with: data, options: [])
        }
    }
    
    func get(url: String, query: String?) -> Promise<Data> {
        return Promise {
            get(url: url, query: query, completion: $0.resolve)
        }
    }
    
    func get(url: String, query: String?, mimeType: MimeType = .json, completion: @escaping (Data?, Error?) -> Void) {
        let session = URLSession.shared
        guard var urlComponent = URLComponents(string: url) else {
            completion(nil, RequestError.badUrl)
            return
        }
        urlComponent.query = query
        guard let url = urlComponent.url else {
            completion(nil, RequestError.badUrl)
            return
        }

        let task = session.dataTask(with: url) { data, response, error in
            if error != nil || data == nil {
                completion(nil, error)
                return
            }

            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                completion(nil, RequestError.badServer)
                return
            }

            guard let mime = response.mimeType, mime == mimeType.rawValue else {
                completion(nil, RequestError.badResponseFormat)
                return
            }
            
            if (data != nil) {
                completion(data, nil)
            } else {
                completion(nil, RequestError.noData)
            }
        }
        
        task.resume()
    }
}
