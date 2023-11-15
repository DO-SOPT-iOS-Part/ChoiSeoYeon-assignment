//
//  GetWeatherService.swift
//  sopt33-assignment
//
//  Created by 최서연 on 11/14/23.
//

import UIKit

class GetWeatherService {
    // 싱글톤 패턴 생성
    static let shared = GetWeatherService()
    private init() {}
    
    //MARK: 개인 API값 숨기기
    let APIkey = "69f6efb6b2106d07e5892d1f4c2a6342"
    
    func makeRequest(cityName: String) -> URLRequest {
        //MARK: 강제 언래핑 수정하기
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(APIkey)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }

    func PostRegisterData(cityName: String) async throws -> WeatherDataModel? {
        do {
            let request = self.makeRequest(cityName: cityName)
            let (data, response) = try await URLSession.shared.data(for: request)
            //dump(request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            //dump(response)
            return parseWeatherInfoData(data: data)
        } catch {
            throw error
        }
    }
    
    private func parseWeatherInfoData(data: Data) -> WeatherDataModel? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(WeatherDataModel.self, from: data)
            return result
        } catch {
            print(error)
            return nil
        }
    }
}
