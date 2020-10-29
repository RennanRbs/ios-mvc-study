//
//  NetworkManager.swift
//  RickNMorty
//
//  Created by Gabriel Palhares on 15/07/19.
//  Copyright © 2019 Gabriel Palhares. All rights reserved.
//

import Foundation

class NetworkManager {
    static let sharedInstance = NetworkManager()
    private init() {}
    
    func createGetRequest(url: String) -> URLRequest {
        let getURL = URL(string: url)!
        var getRequest = URLRequest(url: getURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
        getRequest.httpMethod = "GET"
        return getRequest
    }
    
    func sendGetRequest<T:Codable>(getRequest: URLRequest, type: T.Type, completion: @escaping (_ result: T?,_ error: Error?) -> Void) {
        let getTask = URLSession.shared.dataTask(with: getRequest) { (data, response, err) in
            guard err == nil else {
                print("GET Request in \(getRequest) Error: \(String(describing: err))")
                return
            }
            
            if let receivedData = data {
                do {
                    let resultObject = try JSONDecoder().decode(type, from: receivedData)
                    DispatchQueue.main.async {
                        completion(resultObject, nil)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                }
            } else {
                print("Received empty response from \(getRequest)")
            }
        }
        DispatchQueue.main.async(qos: .background) {
            getTask.resume()
        }
    }
}
