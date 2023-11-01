//
//  TodayWeatherData.swift
//  sopt33-assignment
//
//  Created by 최서연 on 11/1/23.
//

import UIKit

struct TodayWeatherData {
    let time: String
    var weatherImage: String
    let temperature: String
    
    init(time: String, weatherImage: String, temperature: String) {
        self.time = time
        self.weatherImage = weatherImage
        self.temperature = temperature
    }
}

var todayWeatherList: [TodayWeatherData] = [
    .init(time: "Now", weatherImage: "cloudy", temperature: "21°"),
    .init(time: "10시", weatherImage: "rainyandsunny", temperature: "21°"),
    .init(time: "11시", weatherImage: "heavyrainy", temperature: "19°"),
    .init(time: "12시", weatherImage: "rainy", temperature: "19°"),
    .init(time: "13시", weatherImage: "thunder", temperature: "18°"),
    .init(time: "14시", weatherImage: "cloudy", temperature: "18°"),
    .init(time: "15시", weatherImage: "rainyandsunny", temperature: "67°"),
    .init(time: "16시", weatherImage: "heavyrainy", temperature: "88°"),
    .init(time: "17시", weatherImage: "rainy", temperature: "11°"),
    .init(time: "18시", weatherImage: "thunder", temperature: "12°"),
    .init(time: "19시", weatherImage: "rainyandsunny", temperature: "13°")
]
