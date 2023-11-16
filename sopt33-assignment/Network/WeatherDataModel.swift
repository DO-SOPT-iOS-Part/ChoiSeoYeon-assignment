//
//  WeatherDataModel.swift
//  sopt33-assignment
//
//  Created by 최서연 on 11/15/23.
//

import Foundation

struct WeatherDataModel: Codable {
    var name: String
    var main: Dictionary<String, Double>
    var timezone: Int
    var weather: [Weather]
    
    enum CodingKeys: CodingKey {
        case name
        case main
        case timezone
        case weather
    }
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

var weatherData = [WeatherDataModel]()

func translateCityNameToKorean(name: String) -> String {
    let translations: [String: String] = [
        "Daegu": "대구",
        "Daejeon": "대전",
        "Busan": "부산",
        "Sokcho": "속초",
        "Jeju City": "제주도"
    ]
    return translations[name] ?? name
}

func makeTimeZoneToTime(timeZone: Int) -> String {
    let today = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = TimeZone(secondsFromGMT: timeZone)
    dateFormatter.dateFormat = "HH:mm"
    return dateFormatter.string(from: today)
}



