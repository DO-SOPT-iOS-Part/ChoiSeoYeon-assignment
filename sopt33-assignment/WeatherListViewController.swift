//
//  WeatherListViewController.swift
//  sopt33-assignment
//
//  Created by 최서연 on 10/19/23.
//

import UIKit
import SnapKit
import Then

final class WeatherListViewController: UIViewController {
    
    private let scrollView = UIScrollView().then {
        $0.backgroundColor = .black
        $0.contentInsetAdjustmentBehavior = .never
    }
    
    private let contentView = UIView().then {
        $0.backgroundColor = .black
    }
    
    private let tableView = UITableView(frame: .zero, style: .plain).then {
        $0.backgroundColor = .red
    }
    
    private var weatherCardView = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()
        self.setLayout()
    }
    
    private func setNavigationBar() {
        let largeTitleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "SFProText-Bold", size: 36)!,
            .foregroundColor: UIColor.white
        ]
        self.navigationItem.title = "날씨"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.largeTitleTextAttributes = largeTitleAttributes
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "options"), style: .plain, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem?.tintColor = .white
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.searchTextField.attributedPlaceholder = NSMutableAttributedString(string: "도시 또는 공항 검색", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)])
        searchController.searchBar.searchTextField.backgroundColor = .white.withAlphaComponent(0.1)
        searchController.searchBar.searchTextField.font = UIFont(name: "SFProText-Regular", size: 19)
        searchController.searchBar.searchTextField.textColor = .white.withAlphaComponent(0.5)
        searchController.searchBar.setImage(UIImage(named: "finder"), for: .search, state: .normal)
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func setLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalToSuperview()
            $0.width.equalTo(scrollView.snp.width)
            $0.height.equalTo(1000)
        }
        
        weatherCardView = createWeatherCardView()
        
        contentView.addSubview(weatherCardView)
        
        weatherCardView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(204)
            $0.leading.equalToSuperview().inset(20)
        }
    }
}

extension WeatherListViewController {
    
    func createWeatherCardView() -> UIButton {
        let cardView = UIButton().then {
            $0.setImage(UIImage(named: "weatherlist"), for: .normal)
        }
        let myLocationLabel = UILabel().then {
            $0.text = "나의 위치"
            $0.font = UIFont(name: "SFProText-Bold", size: 24)
            $0.textColor = .white
        }
        let myLocateLabel = UILabel().then {
            $0.text = "서울특별시"
            $0.font = UIFont(name: "SFProText-Medium", size: 17)
            $0.textColor = .white
        }
        let myweatherLabel = UILabel().then {
            $0.text = "흐림"
            $0.font = UIFont(name: "SFProText-Medium", size: 16)
            $0.textColor = .white
        }
        let currentTemperature = UILabel().then {
            $0.text = "21°"
            $0.font = UIFont(name: "SFProText-Light", size: 52)
            $0.textColor = .white
        }
        let todayHighTemperatureLabel = UILabel().then {
            $0.text = "최고:29°"
            $0.font = UIFont(name: "SFProText-Medium", size: 15)
            $0.textColor = .white
        }
        let todayLowTemperatureLabel = UILabel().then {
            $0.text = "최저:15°"
            $0.font = UIFont(name: "SFProText-Medium", size: 15)
            $0.textColor = .white
        }
        
        [myLocationLabel, myLocateLabel, myweatherLabel, currentTemperature, todayHighTemperatureLabel, todayLowTemperatureLabel].forEach{
            cardView.addSubview($0)
        }
        
        myLocationLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(16)
        }
        myLocateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(44)
            $0.leading.equalToSuperview().inset(16)
        }
        myweatherLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(87)
            $0.leading.equalToSuperview().inset(16)
        }
        currentTemperature.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.leading.equalToSuperview().inset(249)
        }
        todayHighTemperatureLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(87)
            $0.leading.equalTo(myweatherLabel.snp.trailing).offset(150)
        }
        todayLowTemperatureLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(87)
            $0.leading.equalTo(myweatherLabel.snp.trailing).offset(216)
        }
        
        cardView.addTarget(self, action: #selector(cardTapped), for: .touchUpInside)
        
        return cardView
    }
    
    @objc func cardTapped() {
        let detailVC = WeatherDetailViewController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
