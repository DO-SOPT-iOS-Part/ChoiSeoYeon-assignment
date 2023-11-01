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

// 키보드가 한글이 안먹어서 location값을 영어로 임시설정함
var weatherList: [WeatherCardData] = [
    .init(location: "Seoul", currentWeather: "부분적으로 흐림", currentTemperature: "16°", highTemperature: "최고:23°", lowTemperature: "최저:15°"),
    .init(location: "KwangJinGu", currentWeather: "대체로 흐림", currentTemperature: "14°", highTemperature: "최고:22°", lowTemperature: "최저:14°"),
    .init(location: "Busan", currentWeather: "청명함", currentTemperature: "17°", highTemperature: "최고:25°", lowTemperature: "최저:11°"),
    .init(location: "Gangnueng", currentWeather: "대체로 청명함", currentTemperature: "13°", highTemperature: "최고:23°", lowTemperature: "최저:12°"),
    .init(location: "Tyoko", currentWeather: "청명함", currentTemperature: "15°", highTemperature: "최고:22°", lowTemperature: "최저:13°"),
    .init(location: "Osaka", currentWeather: "청명함", currentTemperature: "13°", highTemperature: "최고:23°", lowTemperature: "최저:11°"),
    .init(location: "Kyoto", currentWeather: "겁나 흐림", currentTemperature: "10°", highTemperature: "최고:19°", lowTemperature: "최저:9°")
]
