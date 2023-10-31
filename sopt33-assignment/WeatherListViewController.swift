//
//  WeatherListViewController.swift
//  sopt33-assignment
//
//  Created by 최서연 on 10/19/23.
//

import UIKit
import SnapKit
import Then

final class WeatherListViewController: UIViewController {
    
    private let scrollView = UIScrollView().then {
        $0.backgroundColor = .black
        $0.contentInsetAdjustmentBehavior = .never
    }
    
    private let contentView = UIView().then {
        $0.backgroundColor = .black
    }
    
    private let optionImageView = UIImageView(image: UIImage(named: "options"))
    
    private let titleLabel = UILabel().then {
        $0.text = "날씨"
        $0.font = UIFont(name: "SFProText-Bold", size: 36)
        $0.textColor = .white
    }
    
    private let searchBar = UISearchBar().then {
        $0.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        $0.searchTextField.attributedPlaceholder = NSMutableAttributedString(string: "도시 또는 공항 검색", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)])
        $0.searchTextField.backgroundColor = .white.withAlphaComponent(0.1)
        $0.searchTextField.font = UIFont(name: "SFProText-Regular", size: 19)
        $0.searchTextField.textColor = .white.withAlphaComponent(0.5)
        $0.setImage(UIImage(named: "finder"), for: .search, state: .normal)
    }
    
    private var weatherCardView = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.setLayout()
    }
    
    private func setLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: self.view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
        
        contentView.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalToSuperview()
            $0.width.equalTo(scrollView.snp.width)
        }
        
        [optionImageView, titleLabel, searchBar].forEach{
            contentView.addSubview($0)
        }
        
        optionImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(52)
            $0.leading.equalToSuperview().inset(321)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(97)
            $0.leading.equalToSuperview().inset(20)
        }
        searchBar.snp.makeConstraints {
            $0.top.equalToSuperview().inset(149)
            $0.leading.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().offset(-12)
            $0.height.equalTo(40)
        }
        
        weatherCardView = createWeatherCardView()
        
        contentView.addSubview(weatherCardView)
        
        weatherCardView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(204)
            $0.leading.equalToSuperview().inset(20)
        }
    }
}

extension WeatherListViewController {
    
    func createWeatherCardView() -> UIButton {
        let cardView = UIButton().then {
            $0.setImage(UIImage(named: "weatherlist"), for: .normal)
        }
        let myLocationLabel = UILabel().then {
            $0.text = "나의 위치"
            $0.font = UIFont(name: "SFProText-Bold", size: 24)
            $0.textColor = .white
        }
        let myLocateLabel = UILabel().then {
            $0.text = "서울특별시"
            $0.font = UIFont(name: "SFProText-Medium", size: 17)
            $0.textColor = .white
        }
        let myweatherLabel = UILabel().then {
            $0.text = "흐림"
            $0.font = UIFont(name: "SFProText-Medium", size: 16)
            $0.textColor = .white
        }
        let currentTemperature = UILabel().then {
            $0.text = "21°"
            $0.font = UIFont(name: "SFProText-Light", size: 52)
            $0.textColor = .white
        }
        let todayHighTemperatureLabel = UILabel().then {
            $0.text = "최고:29°"
            $0.font = UIFont(name: "SFProText-Medium", size: 15)
            $0.textColor = .white
        }
        let todayLowTemperatureLabel = UILabel().then {
            $0.text = "최저:15°"
            $0.font = UIFont(name: "SFProText-Medium", size: 15)
            $0.textColor = .white
        }
        
        [myLocationLabel, myLocateLabel, myweatherLabel, currentTemperature, todayHighTemperatureLabel, todayLowTemperatureLabel].forEach{
            cardView.addSubview($0)
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
            $0.top.equalToSuperview().inset(87)
            $0.leading.equalToSuperview().inset(16)
        }
        currentTemperature.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.leading.equalToSuperview().inset(249)
        }
        todayHighTemperatureLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(87)
            $0.leading.equalTo(myweatherLabel.snp.trailing).offset(150)
        }
        todayLowTemperatureLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(87)
            $0.leading.equalTo(myweatherLabel.snp.trailing).offset(216)
        }
        
        cardView.addTarget(self, action: #selector(cardTapped), for: .touchUpInside)
        
        return cardView
    }
    
    @objc func cardTapped() {
        let detailVC = WeatherDetailViewController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
