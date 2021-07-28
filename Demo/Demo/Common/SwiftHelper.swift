//
//  SwiftHelper.swift
//  Demo
//
//  Created by Deepak Kumar on 26/07/21.
//

import Foundation

struct SwiftHelper {
    static func getJSONData(fileName: String, fileExtension: String = "json") -> Data? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
                do {
                    let data = try Data(contentsOf: url)
                    return data
                } catch(let error) {
                    debugPrint("JSON File Read ERROR: \(error)")
                }
            }
        return nil
    }
    
    static func getModel<T: Decodable>(from jsonData: Data?) -> T? {
        guard let data = jsonData else {
            return nil
        }
        do {
            let model = try JSONDecoder().decode(T.self, from: data)
            return model
        } catch(let error) {
            debugPrint("JSON Decode ERROR: \(error)")
            return nil
        }
    }
}
