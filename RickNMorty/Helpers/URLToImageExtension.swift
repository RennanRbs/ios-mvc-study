//
//  URLToImageExtension.swift
//  RickNMorty
//
//  Created by Gabriel Palhares on 23/07/19.
//  Copyright © 2019 Gabriel Palhares. All rights reserved.
//

import UIKit


extension UIImageView {
    
    // Send a request and save as an UIImage
    public func imageFrom(url urlString: String) {
        guard let url = URL(string: urlString) else {
            print("Couldn't create URL from \(urlString)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, responde, error) in
            if let responseData = data {
                if let image = UIImage(data: responseData) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
        task.resume()
    }

}
