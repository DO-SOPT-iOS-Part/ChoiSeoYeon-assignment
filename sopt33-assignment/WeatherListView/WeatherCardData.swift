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
    var LowTemperature: String
    
    init(location: String, currentWeather: String, currentTemperature: String, highTemperature: String, LowTemperature: String) {
        self.location = location
        self.currentWeather = currentWeather
        self.currentTemperature = currentTemperature
        self.highTemperature = highTemperature
        self.LowTemperature = LowTemperature
    }
}

var weatherList: [WeatherCardData] = [
    .init(location: "Seoul", currentWeather: "부분적으로 흐림", currentTemperature: "16°", highTemperature: "최고:23°", LowTemperature: "최저:15°"),
    .init(location: "KwangJinGu", currentWeather: "대체로 흐림", currentTemperature: "14°", highTemperature: "최고:22°", LowTemperature: "최저:14°"),
    .init(location: "Busan", currentWeather: "청명함", currentTemperature: "17°", highTemperature: "최고:25°", LowTemperature: "최저:11°"),
    .init(location: "GangRueng", currentWeather: "대체로 청명함", currentTemperature: "13°", highTemperature: "최고:23°", LowTemperature: "최저:12°"),
    .init(location: "Tyoko", currentWeather: "청명함", currentTemperature: "15°", highTemperature: "최고:22°", LowTemperature: "최저:13°"),
    .init(location: "Osaka", currentWeather: "청명함", currentTemperature: "13°", highTemperature: "최고:23°", LowTemperature: "최저:11°"),
    .init(location: "Kyoto", currentWeather: "겁나 흐림", currentTemperature: "10°", highTemperature: "최고:19°", LowTemperature: "최저:9°")
]
