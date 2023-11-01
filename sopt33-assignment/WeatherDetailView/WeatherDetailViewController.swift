//
//  WeatherDetailViewController.swift
//  sopt33-assignment
//
//  Created by 최서연 on 10/22/23.
//

import UIKit

final class WeatherDetailViewController: UIViewController{
    
    private let scrollView = UIScrollView().then {
        $0.backgroundColor = .clear
        $0.contentInsetAdjustmentBehavior = .never
        $0.showsVerticalScrollIndicator = false
    }
    private let contentView = UIView().then {
        $0.backgroundColor = .clear
    }
    private let backgroundImageView = UIImageView().then {
        $0.image = UIImage(named: "background")
        $0.contentMode = .scaleAspectFill
    }
    let locationLabel = UILabel().then {
        $0.font = UIFont(name: "SFProText-Regular", size: 36)
        $0.textColor = .white
    }
    let currentTemperatureLabel = UILabel().then {
        $0.font = UIFont(name: "SFProText-Thin", size: 102)
        $0.textColor = .white
    }
    let currentWeatherLabel = UILabel().then {
        $0.font = UIFont(name: "SFProText-Regular", size: 24)
        $0.textColor = .white
    }
    var highTemperatureText: String?
    var lowTemperatureText: String?
    private lazy var highlowTemperatureLabel = UILabel().then {
        $0.text = "\(highTemperatureText ?? "")  \(lowTemperatureText ?? "")"
        $0.font = UIFont(name: "SFProText-Medium", size: 20)
        $0.textColor = .white
    }
    
    private let roundedRectangle = UIView().then {
        $0.frame = CGRect(x: 0, y: 0, width: 335, height: 212)
        $0.layer.backgroundColor = UIColor(white: 1, alpha: 0.03).cgColor
        $0.layer.cornerRadius = 15
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = UIColor(white: 1, alpha: 0.25).cgColor
    }
    private let lineInRectangle = UIView().then {
        $0.frame = CGRect(x: 0, y: 0, width: 320, height: 0)
        $0.alpha = 0.5
        
        let stroke = UIView()
        stroke.bounds = $0.bounds.insetBy(dx: -0.1, dy: -0.1)
        stroke.center = $0.center
        $0.bounds = $0.bounds.insetBy(dx: -0.1, dy: -0.1)
        stroke.layer.borderWidth = 0.2
        stroke.layer.borderColor = UIColor(white: 1, alpha: 1).cgColor
        $0.addSubview(stroke)
    }
    private let descriptionLabel = UILabel().then {
        $0.text = "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다."
        $0.frame = CGRect(x: 0, y: 0, width: 305, height: 45)
        $0.textColor = .white
        $0.font = UIFont(name: "SFProText-Regular", size: 18)
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
    }
    private let todayCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.backgroundColor = .clear
        $0.showsHorizontalScrollIndicator = false
    }
    private let roundedRectangle2 = UIView().then {
        $0.frame = CGRect(x: 0, y: 0, width: 335, height: 675)
        $0.layer.backgroundColor = UIColor(white: 1, alpha: 0.03).cgColor
        $0.layer.cornerRadius = 15
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = UIColor(white: 1, alpha: 0.25).cgColor
    }
    private let calendarImageView = UIImageView(image: UIImage(named: "calendar"))
    private let descriptionLabel2 = UILabel().then {
        $0.text = "10일간의 일기예보"
        $0.alpha = 0.3
        $0.textColor = .white
        $0.font = UIFont(name: "SFProText-Medium", size: 15)
    }
    private let tendaysTableView = UITableView(frame: .zero, style: .plain).then {
        $0.backgroundColor = .clear
        $0.separatorColor = .white.withAlphaComponent(0.5)
        $0.separatorStyle = .singleLine
        $0.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 25)
    }
    
    private let bottomTabbarBox = UIView().then {
        $0.layer.backgroundColor = UIColor(red: 0.165, green: 0.188, blue: 0.251, alpha: 1).cgColor
    }
    private let mapImageView = UIImageView(image: UIImage(named: "map"))
    private let pointerImageView = UIImageView(image: UIImage(named: "pointer"))
    private let dotImageView = UIImageView(image: UIImage(named: "dot"))
    private let listButton = UIButton().then {
        $0.setImage(UIImage(named: "list"), for: .normal)
        $0.addTarget(self, action: #selector(popButton), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackground()
        self.setLayout()
        self.setCollectionViewConfig()
        self.setCollectionViewLayout()
        
        self.setTableViewConfig()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    @objc func popButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setBackground() {
        self.view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1400)
        }
    }
    
    private func setLayout() {
        [locationLabel, currentTemperatureLabel, currentWeatherLabel, highlowTemperatureLabel].forEach{
            contentView.addSubview($0)
        }
        locationLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(78)
            $0.centerX.equalToSuperview()
        }
        currentTemperatureLabel.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.top).inset(42)
            $0.centerX.equalToSuperview().inset(-0.5)
        }
        currentWeatherLabel.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.top).inset(154)
            $0.centerX.equalToSuperview()
        }
        highlowTemperatureLabel.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.top).inset(188)
            $0.centerX.equalToSuperview()
        }
        
        contentView.addSubview(roundedRectangle)
        roundedRectangle.snp.makeConstraints {
            $0.top.equalToSuperview().inset(334)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(335)
            $0.height.equalTo(212)
        }
        
        [descriptionLabel, lineInRectangle, todayCollectionView].forEach {
            roundedRectangle.addSubview($0)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.width.equalTo(305)
            $0.height.equalTo(45)
        }
        lineInRectangle.snp.makeConstraints {
            $0.top.equalToSuperview().inset(66)
            $0.leading.trailing.equalToSuperview().inset(14)
        }
        todayCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(80)
            $0.leading.bottom.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview()
        }
        
        contentView.addSubview(roundedRectangle2)
        roundedRectangle2.snp.makeConstraints {
            $0.top.equalTo(roundedRectangle.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(675)
        }
        [calendarImageView, descriptionLabel2, tendaysTableView].forEach {
            roundedRectangle2.addSubview($0)
        }
        calendarImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(13)
            $0.leading.equalToSuperview().inset(15)
        }
        descriptionLabel2.snp.makeConstraints {
            $0.top.equalToSuperview().inset(11)
            $0.leading.equalToSuperview().inset(40)
        }
        tendaysTableView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(38)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        contentView.addSubview(bottomTabbarBox)
        bottomTabbarBox.snp.makeConstraints {
            $0.bottom.equalTo(self.view)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(82)
        }
        
        [mapImageView, listButton, pointerImageView, dotImageView].forEach {
            bottomTabbarBox.addSubview($0)
        }
        mapImageView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(34)
            $0.leading.equalToSuperview().inset(10)
        }
        listButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(34)
            $0.leading.equalToSuperview().inset(322)
        }
        pointerImageView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(44)
            $0.leading.equalToSuperview().inset(161)
        }
        dotImageView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(44)
            $0.leading.equalToSuperview().inset(189)
        }
    }
    
    private func setCollectionViewConfig() {
        self.todayCollectionView.register(TodayCollectionViewCell.self,
                                          forCellWithReuseIdentifier: TodayCollectionViewCell.identifier)
        self.todayCollectionView.delegate = self
        self.todayCollectionView.dataSource = self
    }
    
    private func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 44 , height: 122)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 22
        flowLayout.minimumInteritemSpacing = 3
        self.todayCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    private func setTableViewConfig() {
        self.tendaysTableView.register(TenDaysTableViewCell.self,
                                       forCellReuseIdentifier: TenDaysTableViewCell.identifier)
        self.tendaysTableView.delegate = self
        self.tendaysTableView.dataSource = self
    }
}

extension WeatherDetailViewController: UICollectionViewDelegate {}
extension WeatherDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return todayWeatherList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: TodayCollectionViewCell.identifier,
                                                            for: indexPath) as? TodayCollectionViewCell else {return UICollectionViewCell()}
        item.bindData(data: todayWeatherList[indexPath.row])
        return item
    }
}

extension WeatherDetailViewController: UITableViewDelegate {}
extension WeatherDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tendaysList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TenDaysTableViewCell.identifier,
                                                       for: indexPath) as? TenDaysTableViewCell else {return UITableViewCell()}
        cell.bindData(data: tendaysList[indexPath.row])
        return cell
    }
}
