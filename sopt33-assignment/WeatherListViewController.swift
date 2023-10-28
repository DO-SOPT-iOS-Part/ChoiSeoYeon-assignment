//
//  WeatherListViewController.swift
//  sopt33-assignment
//
//  Created by 최서연 on 10/19/23.
//

//*** SF Pro Text ***
//SFProText-Regular
//SFProText-Thin
//SFProText-Light
//SFProText-Medium
//SFProText-Bold

import UIKit

final class WeatherListViewController: UIViewController {
    
    private var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .black
        view.contentInsetAdjustmentBehavior = .never
        return view
    }()
    
    private var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private var optionImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "options"))
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "날씨"
        label.font = UIFont(name: "SFProText-Bold", size: 36)
        label.textColor = .white
        return label
    }()
    
    private var searchBar: UISearchBar = {
        let bar = UISearchBar()
        // 서치바의 배경이 흰색이 되는 현상 해결
        bar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        bar.backgroundColor = .clear
        bar.barTintColor = UIColor(white: 1, alpha: 0.1)
        bar.placeholder = "도시 또는 공항 검색"
        bar.searchTextField.tintColor = UIColor(white: 1, alpha: 0.5)
        bar.searchTextField.font = UIFont(name: "SFProText-Regular", size: 19)
        bar.searchTextField.textColor = .white
        bar.setImage(UIImage(named: "finder"), for: .search, state: .normal)
        return bar
    }()
    
    private var weatherCardView: UIButton = {
        let cardView = UIButton()
        
        cardView.frame = CGRect(x: 0, y: 0, width: 335, height: 117)
        cardView.setImage(UIImage(named: "weatherlist"), for: .normal)
        
        var myLocationLabel = UILabel()
        myLocationLabel.text = "나의 위치"
        myLocationLabel.font =  UIFont(name: "SFProText-Bold", size: 24)
        myLocationLabel.textColor = .white
        
        var myLocateLabel = UILabel()
        myLocateLabel.text = "의정부시"
        myLocateLabel.font = UIFont(name: "SFProText-Medium", size: 17)
        myLocateLabel.textColor = .white
        
        var myweatherLabel = UILabel()
        myweatherLabel.text = "흐림"
        myweatherLabel.font = UIFont(name: "SFProText-Medium", size: 16)
        myweatherLabel.textColor = .white
        
        var currentTemperature = UILabel()
        currentTemperature.text = "21°"
        currentTemperature.font = UIFont(name: "SFProText-Light", size: 52)
        currentTemperature.textColor = .white
        
        var todayHighTemperatureLabel = UILabel()
        todayHighTemperatureLabel.text = "최고:29°"
        todayHighTemperatureLabel.font = UIFont(name: "SFProText-Medium", size: 15)
        todayHighTemperatureLabel.textColor = .white
        
        var todayLowTemperatureLabel = UILabel()
        todayLowTemperatureLabel.text = "최저:15°"
        todayLowTemperatureLabel.font = UIFont(name: "SFProText-Medium", size: 15)
        todayLowTemperatureLabel.textColor = .white
        
        [myLocationLabel, myLocateLabel, myweatherLabel, currentTemperature, todayHighTemperatureLabel, todayLowTemperatureLabel].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            cardView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([myLocationLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
                                     myLocationLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16)])
        NSLayoutConstraint.activate([myLocateLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 44),
                                     myLocateLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16)])
        NSLayoutConstraint.activate([myweatherLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 87),
                                     myweatherLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16)])
        NSLayoutConstraint.activate([currentTemperature.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 4),
                                     currentTemperature.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 249)])
        NSLayoutConstraint.activate([todayHighTemperatureLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 87),
                                     todayHighTemperatureLabel.leadingAnchor.constraint(equalTo: myweatherLabel.leadingAnchor, constant: 180)])
        NSLayoutConstraint.activate([todayLowTemperatureLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 87),
                                     todayLowTemperatureLabel.leadingAnchor.constraint(equalTo: todayHighTemperatureLabel.leadingAnchor, constant: 66)])
        
        cardView.addTarget(self, action: #selector(cardViewTapped), for: .touchUpInside)
        
        return cardView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
    }
    
    @objc func cardViewTapped() {
        let detailVC = WeatherDetailViewController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    private func setLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                                     scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)])
        
        NSLayoutConstraint.activate([contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
                                     contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
                                     contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
                                     contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
                                     contentView.heightAnchor.constraint(equalToConstant: 2000)])
        
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: self.view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
        
        [optionImageView, titleLabel, searchBar].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([optionImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 52),
                                     optionImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 321)])
        
        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 97),
                                     titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20)])
        
        NSLayoutConstraint.activate([searchBar.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 149),
                                     searchBar.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
                                     searchBar.widthAnchor.constraint(equalToConstant: 335),
                                     searchBar.heightAnchor.constraint(equalToConstant: 40)])
        
        weatherCardView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(weatherCardView)
        
        NSLayoutConstraint.activate([weatherCardView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 204),
                                     weatherCardView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20)])
    }
}



