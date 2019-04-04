//
//  JSONDecoder.swift
//  UpstackDemo
//
//  Created by Djuro Alfirevic on 4/4/19.
//  Copyright © 2019 Djuro Alfirevic. All rights reserved.
//

import Foundation

extension JSONDecoder {
    
    func decode<T: Decodable>(_ type: T.Type, fromURL url: String, completion: @escaping (T) -> Void) {
        guard let url = URL(string: url) else { fatalError("Invalid URL passed.") }
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                let downloadedFriends = try self.decode(type, from:
                    data)

                DispatchQueue.main.async {
                    completion(downloadedFriends)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}

