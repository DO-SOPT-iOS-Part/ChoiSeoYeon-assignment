//
//  WeatherDataModel.swift
//  sopt33-assignment
//
//  Created by 최서연 on 11/15/23.
//

import Foundation

struct WeatherDataModel: Codable {
    let name: String
    let main: Dictionary<String, Double>
    
    enum CodingKeys: CodingKey {
        case name
        case main
    }
}
