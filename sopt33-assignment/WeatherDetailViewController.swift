//
//  WeatherDetailViewController.swift
//  sopt33-assignment
//
//  Created by 최서연 on 10/22/23.
//

import UIKit

final class WeatherDetailViewController: UIViewController{
    
    private let scrollView = UIScrollView().then {
        $0.backgroundColor = .clear
        $0.contentInsetAdjustmentBehavior = .never
        $0.showsVerticalScrollIndicator = false
    }
    private let contentView = UIView().then {
        $0.backgroundColor = .clear
    }
    private let backgroundImageView = UIImageView().then {
        $0.image = UIImage(named: "background")
        $0.contentMode = .scaleAspectFill
    }
    private let locationLabel = UILabel().then {
        $0.text = "서울특별시"
        $0.font = UIFont(name: "SFProText-Regular", size: 36)
        $0.textColor = .white
    }
    private let currentTemperatureLabel = UILabel().then {
        $0.text = "21°"
        $0.font = UIFont(name: "SFProText-Thin", size: 102)
        $0.textColor = .white
    }
    private let currentWeatherLabel = UILabel().then {
        $0.text = "흐림"
        $0.font = UIFont(name: "SFProText-Regular", size: 24)
        $0.textColor = .white
    }
    private let highLowTemperatureLabel = UILabel().then {
        $0.text = "최고:29° 최저:15°"
        $0.font = UIFont(name: "SFProDisplay-Medium", size: 20)
        $0.textColor = .white
    }
    private let roundedRectangle = UIView().then {
        $0.frame = CGRect(x: 0, y: 0, width: 335, height: 212)
        $0.layer.backgroundColor = UIColor(white: 1, alpha: 0.03).cgColor
        $0.layer.cornerRadius = 15
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = UIColor(white: 1, alpha: 0.25).cgColor
    }
    private let lineInRectangle = UIView().then {
        $0.frame = CGRect(x: 0, y: 0, width: 320, height: 0)
        $0.alpha = 0.5
        
        let stroke = UIView()
        stroke.bounds = $0.bounds.insetBy(dx: -0.1, dy: -0.1)
        stroke.center = $0.center
        $0.bounds = $0.bounds.insetBy(dx: -0.1, dy: -0.1)
        stroke.layer.borderWidth = 0.2
        stroke.layer.borderColor = UIColor(white: 1, alpha: 1).cgColor
        $0.addSubview(stroke)
    }
    private let descriptionLabel = UILabel().then {
        $0.text = "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다."
        $0.frame = CGRect(x: 0, y: 0, width: 305, height: 45)
        $0.textColor = .white
        $0.font = UIFont(name: "SFProDisplay-Regular", size: 18)
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
    }
    private let navigationLine = UIView().then {
        $0.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0)
        $0.alpha = 0.5
        
        let stroke = UIView()
        stroke.bounds = $0.bounds.insetBy(dx: -0.1, dy: -0.1)
        stroke.center = $0.center
        $0.bounds = $0.bounds.insetBy(dx: -0.1, dy: -0.1)
        stroke.layer.borderWidth = 0.2
        stroke.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        $0.addSubview(stroke)
    }
    private let mapImageView = UIImageView(image: UIImage(named: "map"))
    private let pointerImageView = UIImageView(image: UIImage(named: "pointer"))
    private let dotImageView = UIImageView(image: UIImage(named: "dot"))
    private let listButton = UIButton().then {
        $0.setImage(UIImage(named: "list"), for: .normal)
        $0.addTarget(self, action: #selector(popButton), for: .touchUpInside)
    }
    private let weatherHorizontalScrollView = UIScrollView().then {
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .clear
    }
    private let weatherStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 22
        $0.backgroundColor = .clear
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackground()
        self.setLayout()
        self.setStackItem()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    @objc func popButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setBackground() {
        self.view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(1000)
        }
    }
    
    private func setLayout() {
        [locationLabel, currentTemperatureLabel, currentWeatherLabel, highLowTemperatureLabel].forEach{
            contentView.addSubview($0)
        }
        locationLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(78)
            $0.centerX.equalToSuperview()
        }
        currentTemperatureLabel.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.top).inset(42)
            $0.centerX.equalToSuperview().inset(-0.5)
        }
        currentWeatherLabel.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.top).inset(154)
            $0.centerX.equalToSuperview()
        }
        highLowTemperatureLabel.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.top).inset(188)
            $0.centerX.equalToSuperview()
        }
        
        contentView.addSubview(roundedRectangle)
        roundedRectangle.snp.makeConstraints {
            $0.top.equalToSuperview().inset(334)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(335)
            $0.height.equalTo(212)
        }
        
        [descriptionLabel, lineInRectangle, weatherHorizontalScrollView].forEach {
            roundedRectangle.addSubview($0)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.width.equalTo(305)
            $0.height.equalTo(45)
        }
        lineInRectangle.snp.makeConstraints {
            $0.top.equalToSuperview().inset(66)
            $0.leading.trailing.equalToSuperview().inset(14)
        }
        weatherHorizontalScrollView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(80)
            $0.leading.trailing.bottom.equalToSuperview().inset(10)
        }
        
        weatherHorizontalScrollView.addSubview(weatherStackView)
        weatherStackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.width.equalTo(650)
        }
        
        [navigationLine, mapImageView, listButton, pointerImageView, dotImageView].forEach {
            contentView.addSubview($0)
        }
        navigationLine.snp.makeConstraints {
            $0.bottom.equalTo(contentView.snp.top).inset(UIScreen.main.bounds.height-82)
            $0.leading.trailing.equalToSuperview()
        }
        mapImageView.snp.makeConstraints {
            $0.bottom.equalTo(contentView.snp.top).inset(UIScreen.main.bounds.height-34)
            $0.leading.equalToSuperview().inset(10)
        }
        listButton.snp.makeConstraints {
            $0.bottom.equalTo(contentView.snp.top).inset(UIScreen.main.bounds.height-34)
            $0.leading.equalToSuperview().inset(322)
        }
        pointerImageView.snp.makeConstraints {
            $0.bottom.equalTo(contentView.snp.top).inset(UIScreen.main.bounds.height-44)
            $0.leading.equalToSuperview().inset(161)
        }
        dotImageView.snp.makeConstraints {
            $0.bottom.equalTo(contentView.snp.top).inset(UIScreen.main.bounds.height-44)
            $0.leading.equalToSuperview().inset(189)
        }
    }
}

extension WeatherDetailViewController {
    private func setStackItem() {
        let stackItemArray = [weatherStackItem(time: "Now", imageName: "cloudy", temperature: "21°"),
                              weatherStackItem(time: "10시", imageName: "rainyandsunny", temperature: "21°"),
                              weatherStackItem(time: "11시", imageName: "heavyrainy", temperature: "19°"),
                              weatherStackItem(time: "12시", imageName: "rainy", temperature: "19°"),
                              weatherStackItem(time: "13시", imageName: "thunder", temperature: "18°"),
                              weatherStackItem(time: "14시", imageName: "cloudy", temperature: "18°"),
                              weatherStackItem(time: "15시", imageName: "rainyandsunny", temperature: "67°"),
                              weatherStackItem(time: "16시", imageName: "heavyrainy", temperature: "88°"),
                              weatherStackItem(time: "17시", imageName: "rainy", temperature: "11°"),
                              weatherStackItem(time: "18시", imageName: "thunder", temperature: "12°"),
                              weatherStackItem(time: "19시", imageName: "rainyandsunny", temperature: "13°")]
        
        for item in stackItemArray {
            weatherStackView.addArrangedSubview(item)
            item.snp.makeConstraints {
                $0.width.equalTo(44)
            }
        }
    }
}
