//
//  TenDaysData.swift
//  sopt33-assignment
//
//  Created by 최서연 on 11/1/23.
//

import Foundation

struct TenDaysData{
    let day: String
    let weatherImage: String
    let lowTemperature: String
    let highTemperature: String
    //MARK: gradient값 추후 추가
    
    init(day: String, weatherImage: String, lowTemperature: String, highTemperature: String) {
        self.day = day
        self.weatherImage = weatherImage
        self.lowTemperature = lowTemperature
        self.highTemperature = highTemperature
    }
}

var tendaysList: [TenDaysData] = [
    .init(day: "오늘", weatherImage: "cloud.sun.rain.fill", lowTemperature: "15°", highTemperature: "29°"),
    .init(day: "월", weatherImage: "cloud.drizzle.fill", lowTemperature: "18°", highTemperature: "27°"),
    .init(day: "화", weatherImage: "cloud.drizzle.fill", lowTemperature: "20°", highTemperature: "25°"),
    .init(day: "수", weatherImage: "cloud.drizzle.fill", lowTemperature: "17°", highTemperature: "25°"),
    .init(day: "목", weatherImage: "cloud.drizzle.fill", lowTemperature: "17°", highTemperature: "25°"),
    .init(day: "금", weatherImage: "cloud.sun.fill", lowTemperature: "20°", highTemperature: "26°"),
    .init(day: "토", weatherImage: "sun.max.fill", lowTemperature: "18°", highTemperature: "25°"),
    .init(day: "일", weatherImage: "cloud.drizzle.fill", lowTemperature: "13°", highTemperature: "21°"),
    .init(day: "월", weatherImage: "cloud.drizzle.fill", lowTemperature: "12°", highTemperature: "19°"),
    .init(day: "화", weatherImage: "sun.max.fill", lowTemperature: "18°", highTemperature: "25°"),
    .init(day: "화", weatherImage: "sun.max.fill", lowTemperature: "18°", highTemperature: "25°")

]
