//
//  weatherStackItem.swift
//  sopt33-assignment
//
//  Created by 최서연 on 10/25/23.
//

import UIKit

func weatherStackItem(time: String, imageName: String, temperature: String) -> UIView {
    
    let itemView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 44, height: 122)
        return view
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = time
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Medium", size: 17)
        return label
    }()
    
    let weatherImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        return imageView
    }()
    
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = temperature
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Medium", size: 22)
        return label
    }()
    
    [timeLabel, weatherImage, temperatureLabel].forEach {
        $0.translatesAutoresizingMaskIntoConstraints = false
        itemView.addSubview($0)
    }
    
    NSLayoutConstraint.activate([timeLabel.topAnchor.constraint(equalTo: itemView.topAnchor)])
    NSLayoutConstraint.activate([weatherImage.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 14)])
    NSLayoutConstraint.activate([temperatureLabel.topAnchor.constraint(equalTo: weatherImage.bottomAnchor, constant: 14)])
    
    // 가로 가운데 정렬
    NSLayoutConstraint.activate([timeLabel.centerXAnchor.constraint(equalTo: itemView.centerXAnchor)])
    NSLayoutConstraint.activate([weatherImage.centerXAnchor.constraint(equalTo: itemView.centerXAnchor)])
    NSLayoutConstraint.activate([temperatureLabel.centerXAnchor.constraint(equalTo: itemView.centerXAnchor)])
    
    return itemView
}
