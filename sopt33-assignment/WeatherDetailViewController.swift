//
//  WeatherDetailViewController.swift
//  sopt33-assignment
//
//  Created by 최서연 on 10/22/23.
//

import UIKit

final class WeatherDetailViewController: UIViewController{
    
    private var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .clear
        view.contentInsetAdjustmentBehavior = .never
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private var backgroundImageView: UIImageView = {
        let backgroundImage = UIImage(named: "background")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleAspectFill
        return backgroundImageView
    }()
    
    private var locationLabel: UILabel = {
        let label = UILabel()
        label.text = "의정부시"
        label.font = UIFont(name: "SFProText-Regular", size: 36)
        label.textColor = .white
        return label
    }()
    
    private var currentTemperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "21°"
        label.font = UIFont(name: "SFProText-Thin", size: 102)
        label.textColor = .white
        return label
    }()
    
    private var currentWeatherLabel: UILabel = {
        let label = UILabel()
        label.text = "흐림"
        label.font = UIFont(name: "SFProText-Regular", size: 24)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    private var highLowTemperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "최고:29° 최저:15°"
        label.font = UIFont(name: "SFProDisplay-Medium", size: 20)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    private var roundedRectangle: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 335, height: 212)
        view.alpha = 0.2
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.03).cgColor
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25).cgColor
        return view
    }()
    
    private var lineInRectangle: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 320, height: 0)
        view.alpha = 0.5
        
        let stroke = UIView()
        stroke.bounds = view.bounds.insetBy(dx: -0.1, dy: -0.1)
        stroke.center = view.center
        view.addSubview(stroke)
        view.bounds = view.bounds.insetBy(dx: -0.1, dy: -0.1)
        stroke.layer.borderWidth = 0.2
        stroke.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        
        return view
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 305, height: 45)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Regular", size: 18)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.02
        label.attributedText = NSMutableAttributedString(string: "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다.",
                                                         attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return label
    }()
    
    private var navigationLine: UIView = {
        var view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 375, height: 0)
        view.alpha = 0.3
        
        var shadows = UIView()
        shadows.frame = view.frame
        shadows.clipsToBounds = false
        view.addSubview(shadows)
        
        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 0)
        
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 2
        layer0.shadowOffset = CGSize(width: 0, height: 0)
        layer0.bounds = shadows.bounds
        layer0.position = shadows.center
        shadows.layer.addSublayer(layer0)
        
        return view
    }()
    
    private var mapImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "map"))
        return imageView
    }()
    
    private var listButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "list"), for: .normal)
        button.addTarget(self, action: #selector(popButton), for: .touchUpInside)
        return button
    }()
    
    private var pointerImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "pointer"))
        return imageView
    }()
    
    private var dotImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "dot"))
        return imageView
    }()
    
    private var weatherHorizontalScrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .clear
        return view
    }()
    
    private var weatherStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 22
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackground()
        self.setStackItem()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    @objc func popButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setBackground() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(backgroundImageView)
        NSLayoutConstraint.activate([backgroundImageView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     backgroundImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     backgroundImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     backgroundImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)])
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                                     scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)])
        
        NSLayoutConstraint.activate([contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
                                     contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
                                     contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
                                     contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
                                     contentView.heightAnchor.constraint(equalToConstant: 1000)])
        
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        self.setLayout()
    }
    
    private func setLayout() {
        [locationLabel, currentTemperatureLabel, currentWeatherLabel, highLowTemperatureLabel].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([locationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 78),
                                     locationLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)])
        NSLayoutConstraint.activate([currentTemperatureLabel.topAnchor.constraint(equalTo: locationLabel.topAnchor, constant: 42),
                                     currentTemperatureLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -0.5)])
        NSLayoutConstraint.activate([currentWeatherLabel.topAnchor.constraint(equalTo: locationLabel.topAnchor, constant: 154),
                                     currentWeatherLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)])
        NSLayoutConstraint.activate([highLowTemperatureLabel.topAnchor.constraint(equalTo: locationLabel.topAnchor, constant: 188),
                                     highLowTemperatureLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)])
        
        [roundedRectangle, lineInRectangle].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([roundedRectangle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 334),
                                     roundedRectangle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                                     roundedRectangle.widthAnchor.constraint(equalToConstant: 335),
                                     roundedRectangle.heightAnchor.constraint(equalToConstant: 212)])
        NSLayoutConstraint.activate([lineInRectangle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 400),
                                     lineInRectangle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 34)])
        
        [descriptionLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        weatherHorizontalScrollView.translatesAutoresizingMaskIntoConstraints = false
        roundedRectangle.addSubview(weatherHorizontalScrollView)
        
        NSLayoutConstraint.activate([descriptionLabel.topAnchor.constraint(equalTo: roundedRectangle.topAnchor, constant: 10),
                                     descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35),
                                     descriptionLabel.widthAnchor.constraint(equalToConstant: 305),
                                     descriptionLabel.heightAnchor.constraint(equalToConstant: 45)])
        
        NSLayoutConstraint.activate([weatherHorizontalScrollView.topAnchor.constraint(equalTo: lineInRectangle.topAnchor, constant: 14),
                                     weatherHorizontalScrollView.leadingAnchor.constraint(equalTo: roundedRectangle.leadingAnchor),
                                     weatherHorizontalScrollView.heightAnchor.constraint(equalToConstant: 94),
                                     weatherHorizontalScrollView.bottomAnchor.constraint(equalTo: roundedRectangle.bottomAnchor, constant: -10)])
        
        weatherStackView.translatesAutoresizingMaskIntoConstraints = false
        weatherHorizontalScrollView.addSubview(weatherStackView)
        
        NSLayoutConstraint.activate([weatherStackView.topAnchor.constraint(equalTo: weatherHorizontalScrollView.contentLayoutGuide.topAnchor),
                                     weatherStackView.leadingAnchor.constraint(equalTo: weatherHorizontalScrollView.contentLayoutGuide.leadingAnchor),
                                     weatherStackView.trailingAnchor.constraint(equalTo: weatherHorizontalScrollView.contentLayoutGuide.trailingAnchor),
                                     weatherStackView.bottomAnchor.constraint(equalTo: weatherHorizontalScrollView.contentLayoutGuide.bottomAnchor)])
        
        let stackViewWidth = weatherStackView.widthAnchor.constraint(greaterThanOrEqualTo: weatherHorizontalScrollView.widthAnchor)
        stackViewWidth.priority = .defaultLow
        stackViewWidth.isActive = true
        
        [navigationLine, mapImageView, listButton, pointerImageView, dotImageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([navigationLine.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 730),
                                     navigationLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     navigationLine.widthAnchor.constraint(equalToConstant: 375)])
        NSLayoutConstraint.activate([mapImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 734),
                                     mapImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)])
        NSLayoutConstraint.activate([listButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 734),
                                     listButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 322)])
        NSLayoutConstraint.activate([pointerImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 734),
                                     pointerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 161)])
        NSLayoutConstraint.activate([dotImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 734),
                                     dotImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 189)])
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
            item.translatesAutoresizingMaskIntoConstraints = false
            weatherStackView.addArrangedSubview(item)
            
            NSLayoutConstraint.activate([item.widthAnchor.constraint(equalToConstant: 44),
                                         item.heightAnchor.constraint(equalToConstant: 122)])
        }
    }
}
