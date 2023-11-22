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
    let rainyPercent: String?
    let lowTemperature: String
    let highTemperature: String
    let gradientImage: String
    
    init(day: String, weatherImage: String, rainyPercent: String?, lowTemperature: String, highTemperature: String, gradientImage: String) {
        self.day = day
        self.weatherImage = weatherImage
        self.rainyPercent = rainyPercent
        self.lowTemperature = lowTemperature
        self.highTemperature = highTemperature
        self.gradientImage = gradientImage
    }
}

var tendaysList: [TenDaysData] = [
    .init(day: "오늘", weatherImage: "cloud.sun.rain.fill", rainyPercent: nil, lowTemperature: "15°", highTemperature: "29°", gradientImage: "gradient1"),
    .init(day: "월", weatherImage: "cloud.drizzle.fill", rainyPercent: "60%", lowTemperature: "18°", highTemperature: "27°", gradientImage: "gradient2"),
    .init(day: "화", weatherImage: "cloud.drizzle.fill", rainyPercent: "60%", lowTemperature: "20°", highTemperature: "25°", gradientImage: "gradient3"),
    .init(day: "수", weatherImage: "cloud.drizzle.fill", rainyPercent: "70%", lowTemperature: "17°", highTemperature: "25°", gradientImage: "gradient4"),
    .init(day: "목", weatherImage: "cloud.drizzle.fill", rainyPercent: "50%", lowTemperature: "17°", highTemperature: "25°", gradientImage: "gradient5"),
    .init(day: "금", weatherImage: "cloud.sun.fill", rainyPercent: nil, lowTemperature: "20°", highTemperature: "26°", gradientImage: "gradient6"),
    .init(day: "토", weatherImage: "sun.max.fill", rainyPercent: nil, lowTemperature: "18°", highTemperature: "25°", gradientImage: "gradient7"),
    .init(day: "일", weatherImage: "cloud.drizzle.fill", rainyPercent: "50%", lowTemperature: "13°", highTemperature: "21°", gradientImage: "gradient8"),
    .init(day: "월", weatherImage: "cloud.drizzle.fill", rainyPercent: "50%", lowTemperature: "12°", highTemperature: "19°", gradientImage: "gradient9"),
    .init(day: "화", weatherImage: "sun.max.fill", rainyPercent: nil, lowTemperature: "18°", highTemperature: "25°", gradientImage: "gradient10")
]
