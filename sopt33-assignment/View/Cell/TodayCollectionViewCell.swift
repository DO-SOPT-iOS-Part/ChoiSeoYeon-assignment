//
//  TodayCollectionViewCell.swift
//  sopt33-assignment
//
//  Created by 최서연 on 11/1/23.
//

import UIKit

class TodayCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "TodayCollectionViewCell"
    
    private let timeLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "SFProDisplay-Medium", size: 17)
        $0.textAlignment = .center
    }
    private var weatherImage = UIImageView()
    private let temperatureLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "SFProDisplay-Medium", size: 22)
        $0.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        [timeLabel, weatherImage, temperatureLabel].forEach {
            self.contentView.addSubview($0)
        }
        timeLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(3)
            $0.centerX.equalToSuperview()
        }
        weatherImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(36)
            $0.leading.equalToSuperview()
            $0.width.height.equalTo(44)
            $0.centerX.equalToSuperview()
        }
        temperatureLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(94)
            $0.leading.equalToSuperview().inset(6)
            $0.centerX.equalToSuperview()
        }
    }
    
    func bindData(data: TodayWeatherData) {
        self.timeLabel.text = data.time
        self.weatherImage.image = UIImage(named: data.weatherImage)
        self.temperatureLabel.text = data.temperature
    }
}
