//
//  Config.swift
//  sopt33-assignment
//
//  Created by 최서연 on 11/17/23.
//

import Foundation
enum Config {
    enum Keys {
        enum Plist {
            static let apiKey = "API_KEY"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist cannot found.")
        }
        return dict
    }()
}
