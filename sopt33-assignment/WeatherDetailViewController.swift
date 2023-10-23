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
        
        var stroke = UIView()
        stroke.bounds = view.bounds.insetBy(dx: -0.2, dy: -0.2)
        stroke.center = view.center
        view.addSubview(stroke)
        view.bounds = view.bounds.insetBy(dx: -0.2, dy: -0.2)
        stroke.layer.borderWidth = 0.4
        stroke.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        
        return view
    }()
    
    private var mapImageView: UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "map"))
        return imageView
    }()
    
    private var listImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "list"))
        return imageView
    }()
    
    private var pointerImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "pointer"))
        return imageView
    }()
    
    private var dotImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "dot"))
        return imageView
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
                                     roundedRectangle.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 20),
                                     roundedRectangle.widthAnchor.constraint(equalToConstant: 335),
                                     roundedRectangle.heightAnchor.constraint(equalToConstant: 212)])
        NSLayoutConstraint.activate([lineInRectangle.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 400),
                                     lineInRectangle.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 34)])
        
        [descriptionLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            backgroundImageView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([descriptionLabel.topAnchor.constraint(equalTo: roundedRectangle.topAnchor, constant: 10),
                                     descriptionLabel.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 35),
                                     descriptionLabel.widthAnchor.constraint(equalToConstant: 305),
                                     descriptionLabel.heightAnchor.constraint(equalToConstant: 45)])
        
        [navigationLine, mapImageView, listImageView, pointerImageView, dotImageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            backgroundImageView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([navigationLine.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 730),
                                     navigationLine.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor),
                                     navigationLine.widthAnchor.constraint(equalToConstant: 375)])
        NSLayoutConstraint.activate([mapImageView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 734),
                                     mapImageView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 10)])
        NSLayoutConstraint.activate([listImageView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 734),
                                     listImageView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 322)])
        NSLayoutConstraint.activate([pointerImageView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 734),
                                     pointerImageView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 161)])
        NSLayoutConstraint.activate([dotImageView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 734),
                                     dotImageView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 189)])
    }
}
