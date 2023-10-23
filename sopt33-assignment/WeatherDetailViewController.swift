//
//  WeatherDetailViewController.swift
//  sopt33-assignment
//
//  Created by 최서연 on 10/22/23.
//

import UIKit

final class WeatherDetailViewController: UIViewController{
    private var backgroundImageView: UIImageView = {
        let backgroundImage = UIImage(named: "background")
        let backgroundImageView = UIImageView(image: backgroundImage)
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackground()
    }
    
    private func setBackground() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(backgroundImageView)
        
        NSLayoutConstraint.activate([backgroundImageView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     backgroundImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     backgroundImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     backgroundImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)])
        
        self.setLayout()
    }
    
    private func setLayout() {
        [locationLabel, currentTemperatureLabel, currentWeatherLabel, highLowTemperatureLabel].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            backgroundImageView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([locationLabel.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 78),
                                     locationLabel.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor)])
        NSLayoutConstraint.activate([currentTemperatureLabel.topAnchor.constraint(equalTo: locationLabel.topAnchor, constant: 42),
                                     currentTemperatureLabel.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor, constant: -0.5)])
        NSLayoutConstraint.activate([currentWeatherLabel.topAnchor.constraint(equalTo: locationLabel.topAnchor, constant: 154),
                                     currentWeatherLabel.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor)])
        NSLayoutConstraint.activate([highLowTemperatureLabel.topAnchor.constraint(equalTo: locationLabel.topAnchor, constant: 188),
                                     highLowTemperatureLabel.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor)])
        
        [roundedRectangle, lineInRectangle].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            backgroundImageView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([roundedRectangle.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 334),
                                     roundedRectangle.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 20)])
        NSLayoutConstraint.activate([lineInRectangle.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 400),
                                     lineInRectangle.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 34)])
        
        [descriptionLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            backgroundImageView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([descriptionLabel.topAnchor.constraint(equalTo: roundedRectangle.topAnchor, constant: 10),
                                     descriptionLabel.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 35)])
    }
}
