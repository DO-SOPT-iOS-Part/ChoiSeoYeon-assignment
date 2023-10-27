//
//  weatherStackItem.swift
//  sopt33-assignment
//
//  Created by 최서연 on 10/25/23.
//

import UIKit

class weatherStackItem: UIView {
    let itemView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 44, height: 94)
        return view
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Now"
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Medium", size: 17)
        return label
    }()
    
    let weatherImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cloudy")
        return imageView
    }()
    
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "21°"
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Medium", size: 22)
        return label
    }()
    
    func setConstraint() {
        [timeLabel, weatherImage, temperatureLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            itemView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([timeLabel.topAnchor.constraint(equalTo: itemView.topAnchor)])
        NSLayoutConstraint.activate([weatherImage.topAnchor.constraint(equalTo: timeLabel.topAnchor, constant: 14)])
        NSLayoutConstraint.activate([temperatureLabel.topAnchor.constraint(equalTo: weatherImage.topAnchor, constant: 14)])
    }
    
}
