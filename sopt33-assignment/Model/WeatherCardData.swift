//
//  WeatherCardData.swift
//  sopt33-assignment
//
//  Created by 최서연 on 11/1/23.
//

import Foundation

struct WeatherCardData {
    let location: String
    let currentWeather: String
    let currentTemperature: String
    let highTemperature: String
    var lowTemperature: String
    
    init(location: String, currentWeather: String, currentTemperature: String, highTemperature: String, lowTemperature: String) {
        self.location = location
        self.currentWeather = currentWeather
        self.currentTemperature = currentTemperature
        self.highTemperature = highTemperature
        self.lowTemperature = lowTemperature
    }
}

var weatherList: [WeatherCardData] = [
    .init(location: "서울특별시", currentWeather: "부분적으로 흐림", currentTemperature: "16°", highTemperature: "최고:23°", lowTemperature: "최저:15°"),
    .init(location: "광진구", currentWeather: "대체로 흐림", currentTemperature: "14°", highTemperature: "최고:22°", lowTemperature: "최저:14°"),
    .init(location: "부산시", currentWeather: "청명함", currentTemperature: "17°", highTemperature: "최고:25°", lowTemperature: "최저:11°"),
    .init(location: "강릉시", currentWeather: "대체로 청명함", currentTemperature: "13°", highTemperature: "최고:23°", lowTemperature: "최저:12°"),
    .init(location: "도쿄", currentWeather: "청명함", currentTemperature: "15°", highTemperature: "최고:22°", lowTemperature: "최저:13°"),
    .init(location: "오사카시", currentWeather: "청명함", currentTemperature: "13°", highTemperature: "최고:23°", lowTemperature: "최저:11°"),
    .init(location: "교토시", currentWeather: "겁나 흐림", currentTemperature: "10°", highTemperature: "최고:19°", lowTemperature: "최저:9°")
]
