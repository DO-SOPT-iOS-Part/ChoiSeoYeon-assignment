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
        textField.attributedPlaceholder = NSAttributedString(string: "도시 또는 공항 검색", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.textColor = .lightText
        return textField
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
    }
}

