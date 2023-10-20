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
    
    var optionImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "options"))
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "날씨"
        label.font = UIFont(name: "SFProText-Bold", size: 36)
        label.textColor = .white
        return label
    }()
    
    var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "도시 또는 공항 검색"
        textField.font = UIFont(name: "SFProText-Medium", size: 19)
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .darkGray
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    private func setLayout() {
        self.view.backgroundColor = .black
        
        [optionImageView, titleLabel, searchTextField].forEach{ [weak self] view in
            guard let self else { return }
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        
        NSLayoutConstraint.activate([optionImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 52),
                                     optionImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 321)])
        
        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 97),
                                     titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)])
        
        NSLayoutConstraint.activate([searchTextField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 149),
                                     searchTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                                     searchTextField.widthAnchor.constraint(equalToConstant: 335),
                                     searchTextField.heightAnchor.constraint(equalToConstant: 40)])
    }
}

