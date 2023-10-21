//
//  ViewController.swift
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

final class ViewController: UIViewController {
    
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
    
    private var searchTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "SFProText-Medium", size: 19)
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .systemBackground
        textField.attributedPlaceholder = NSAttributedString(
            string: "도시 또는 공항 검색", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.textColor = .lightText
        textField.setLeftPaddingPoints(58)
        return textField
    }()
    
    private var weatherCardView: UIView = {
        let cardView = UIView()
        let weatherListImageView = UIImageView(image: UIImage(named: "weatherlist"))
        weatherListImageView.frame = CGRect(x: 0, y: 0, width: 335, height: 117)
        cardView.addSubview(weatherListImageView)
        
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
            weatherListImageView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([myLocationLabel.topAnchor.constraint(equalTo: weatherListImageView.topAnchor, constant: 10),
                                     myLocationLabel.leadingAnchor.constraint(equalTo: weatherListImageView.leadingAnchor, constant: 16)])
        NSLayoutConstraint.activate([myLocateLabel.topAnchor.constraint(equalTo: weatherListImageView.topAnchor, constant: 44),
                                     myLocateLabel.leadingAnchor.constraint(equalTo: weatherListImageView.leadingAnchor, constant: 16)])
        NSLayoutConstraint.activate([myweatherLabel.topAnchor.constraint(equalTo: weatherListImageView.topAnchor, constant: 87),
                                     myweatherLabel.leadingAnchor.constraint(equalTo: weatherListImageView.leadingAnchor, constant: 16)])
        NSLayoutConstraint.activate([currentTemperature.topAnchor.constraint(equalTo: weatherListImageView.topAnchor, constant: 4),
                                     currentTemperature.leadingAnchor.constraint(equalTo: weatherListImageView.leadingAnchor, constant: 249)])
        NSLayoutConstraint.activate([todayHighTemperatureLabel.topAnchor.constraint(equalTo: weatherListImageView.topAnchor, constant: 87),
                                     todayHighTemperatureLabel.leadingAnchor.constraint(equalTo: myweatherLabel.leadingAnchor, constant: 180)])
        NSLayoutConstraint.activate([todayLowTemperatureLabel.topAnchor.constraint(equalTo: weatherListImageView.topAnchor, constant: 87),
                                     todayLowTemperatureLabel.leadingAnchor.constraint(equalTo: todayHighTemperatureLabel.leadingAnchor, constant: 66)])
        
        return cardView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
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
        
        [optionImageView, titleLabel, searchTextField].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([optionImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 52),
                                     optionImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 321)])
        
        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 97),
                                     titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20)])
        
        NSLayoutConstraint.activate([searchTextField.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 149),
                                     searchTextField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
                                     searchTextField.widthAnchor.constraint(equalToConstant: 335),
                                     searchTextField.heightAnchor.constraint(equalToConstant: 40)])
        
        weatherCardView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(weatherCardView)
        
        NSLayoutConstraint.activate([weatherCardView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 204),
                                     weatherCardView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20)])
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}

