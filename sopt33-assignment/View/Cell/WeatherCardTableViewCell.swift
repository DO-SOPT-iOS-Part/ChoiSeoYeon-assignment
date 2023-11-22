//
//  WeatherCardTableViewCell.swift
//  sopt33-assignment
//
//  Created by 최서연 on 10/31/23.
//

import UIKit

class WeatherCardTableViewCell: UITableViewCell {
    
    static let identifier: String = "WeatherCardTableViewCell"

    private let backgroundImageView = UIImageView().then {
        $0.image = UIImage(named: "weatherlist")
    }
    private let myLocationLabel = UILabel().then {
        $0.font = UIFont(name: "SFProText-Bold", size: 24)
        $0.textColor = .white
    }
    private let myTimeLabel = UILabel().then {
        $0.font = UIFont(name: "SFProText-Medium", size: 17)
        $0.textColor = .white
    }
    private let myweatherLabel = UILabel().then {
        $0.font = UIFont(name: "SFProText-Medium", size: 16)
        $0.textColor = .white
    }
    private let currentTemperature = UILabel().then {
        $0.font = UIFont(name: "SFProText-Light", size: 52)
        $0.textColor = .white
    }
    private let todayHighTemperatureLabel = UILabel().then {
        $0.font = UIFont(name: "SFProText-Medium", size: 15)
        $0.textColor = .white
    }
    private let todayLowTemperatureLabel = UILabel().then {
        $0.font = UIFont(name: "SFProText-Medium", size: 15)
        $0.textColor = .white
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        self.backgroundColor = .black
        
        self.contentView.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(5)
            $0.bottom.equalToSuperview().offset(-5)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        [myLocationLabel, myTimeLabel, myweatherLabel, currentTemperature, todayHighTemperatureLabel, todayLowTemperatureLabel].forEach {
            self.backgroundImageView.addSubview($0)
        }
        myLocationLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(16)
        }
        myTimeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(44)
            $0.leading.equalToSuperview().inset(16)
        }
        myweatherLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(16)
        }
        currentTemperature.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.trailing.equalToSuperview().inset(20)
        }
        todayHighTemperatureLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(196)
        }
        todayLowTemperatureLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(262)
        }
    }

    func bindData(data: WeatherDataModel) {
        let numberForMatter = NumberFormatter()
        numberForMatter.roundingMode = .floor
        numberForMatter.maximumSignificantDigits = 1
        
        let temperature = data.main["temp"] ?? 0
        let maxTemperature = data.main["temp_max"] ?? 0
        let minTemperature = data.main["temp_min"] ?? 0
 
        self.myLocationLabel.text = translateCityNameToKorean(name: data.name)
        self.myTimeLabel.text = makeTimeZoneToTime(timeZone: data.timezone)
        self.myweatherLabel.text = data.weather[0].description
        self.currentTemperature.text = "\(numberForMatter.string(for: temperature) ?? "")°"
        self.todayLowTemperatureLabel.text = "최저:\(numberForMatter.string(for: minTemperature) ?? "")°"
        self.todayHighTemperatureLabel.text = "최고:\(numberForMatter.string(for: maxTemperature) ?? "")°"
    }
}
