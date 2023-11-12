//
//  TenDaysTableViewCell.swift
//  sopt33-assignment
//
//  Created by 최서연 on 11/1/23.
//

import UIKit

class TenDaysTableViewCell: UITableViewCell {
    
    static let identifier: String = "TenDaysTableViewCell"
    
    private let dayLabel = UILabel().then {
        $0.font = UIFont(name: "SFProText-Medium", size: 22)
        $0.textColor = .white
    }
    private let weatherImageView = UIImageView()
    private let rainyPercentLabel = UILabel().then {
        $0.textColor = UIColor(red: 0.506, green: 0.812, blue: 0.98, alpha: 1)
        $0.font = UIFont(name: "SFProText-Semibold", size: 15)
    }
    private let lowTemperatureLabel = UILabel().then {
        $0.textColor = .white.withAlphaComponent(0.3)
        $0.font = UIFont(name: "SFProText-Medium", size: 22)
    }
    private let highTemperatureLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "SFProText-Medium", size: 22)
    }
    private let gradeintImageView = UIImageView(image: UIImage(named: "gradient1"))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        self.backgroundColor = .clear
        
        self.contentView.snp.makeConstraints {
            $0.height.equalTo(55)
        }
        
        [dayLabel, weatherImageView, rainyPercentLabel, lowTemperatureLabel, highTemperatureLabel, gradeintImageView].forEach {
            self.contentView.addSubview($0)
        }
        dayLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
        weatherImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(87)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(26)
        }
        if rainyPercentLabel.text != nil {
            weatherImageView.snp.updateConstraints {
                $0.centerY.equalToSuperview().offset(-7)
            }
        }
        rainyPercentLabel.snp.makeConstraints {
            $0.top.equalTo(weatherImageView.snp.bottom).offset(0.85)
            $0.leading.equalToSuperview().inset(84)
        }
        lowTemperatureLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(130)
            $0.centerY.equalToSuperview()
        }
        highTemperatureLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(282)
            $0.centerY.equalToSuperview()
        }
        gradeintImageView.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(169)
            $0.centerY.equalToSuperview()
        }
    }
    
    func bindData(data: TenDaysData) {
        self.dayLabel.text = data.day
        self.weatherImageView.image = UIImage(systemName: data.weatherImage)?.withRenderingMode(.alwaysOriginal)
        self.rainyPercentLabel.text = data.rainyPercent
        self.lowTemperatureLabel.text = data.lowTemperature
        self.highTemperatureLabel.text = data.highTemperature
        //MARK: gradient값 추후 추가
        
        if data.rainyPercent != nil {
            weatherImageView.snp.updateConstraints {
                $0.centerY.equalToSuperview().offset(-7)
            }
        } else {
            weatherImageView.snp.updateConstraints {
                $0.centerY.equalToSuperview()
            }
        }
        
        self.layoutIfNeeded()
    }
}
