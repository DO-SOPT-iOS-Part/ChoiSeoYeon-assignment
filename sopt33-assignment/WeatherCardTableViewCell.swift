//
//  WeatherCardTableViewCell.swift
//  sopt33-assignment
//
//  Created by 최서연 on 10/31/23.
//

import UIKit

class WeatherCardTableViewCell: UITableViewCell {
    
    static let identifier: String = "WeatherCardTableViewCell"
    
    private let cardView = UIButton().then {
        $0.setImage(UIImage(named: "weatherlist"), for: .normal)
        $0.contentMode = .scaleAspectFill
    }
    private let myLocationLabel = UILabel().then {
        $0.text = "나의 위치"
        $0.font = UIFont(name: "SFProText-Bold", size: 24)
        $0.textColor = .white
    }
    private let myLocateLabel = UILabel().then {
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
        
        self.contentView.addSubview(cardView)
        cardView.snp.makeConstraints{
            $0.top.equalTo(self).offset(5)
            $0.bottom.equalTo(self).offset(-5)
            $0.width.equalTo(UIScreen.main.bounds.width-38)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        [myLocationLabel, myLocateLabel, myweatherLabel, currentTemperature, todayHighTemperatureLabel, todayLowTemperatureLabel].forEach {
            self.cardView.addSubview($0)
        }
        myLocationLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(16)
        }
        myLocateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(44)
            $0.leading.equalToSuperview().inset(16)
        }
        myweatherLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(16)
        }
        currentTemperature.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.leading.equalToSuperview().inset(249)
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
    
    func bindData(data: WeatherCardData) {
        self.myLocateLabel.text = data.location
        self.myweatherLabel.text = data.currentWeather
        self.currentTemperature.text = data.currentTemperature
        self.todayHighTemperatureLabel.text = data.highTemperature
        self.todayLowTemperatureLabel.text = data.LowTemperature
    }
    
    @objc func cardTapped() {
        let detailVC = WeatherDetailViewController()
        WeatherListViewController().navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
