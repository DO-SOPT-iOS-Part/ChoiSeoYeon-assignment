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
    
    let city = ["daegu", "daejeon", "busan", "sokcho", "jeju"]
    
    private let tableView = UITableView(frame: .zero, style: .plain).then {
        $0.backgroundColor = .black
    }
    
    private var filteredList: [WeatherDataModel] = []
    private var isSearchActive: Bool = false
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerWeatherData()
        self.setUI()
        self.reload()
    }
    
    func registerWeatherData() {
        for i in 0...city.count-1 {
            Task {
                if let result = try await GetWeatherService.shared.PostRegisterData(cityName: city[i]) {
                    weatherData.append(WeatherDataModel(name: result.name, main: result.main, timezone: result.timezone, weather: result.weather))
                    tableView.reloadData() // 테이블뷰 업데이트 요놈을 빼먹으면 안돼 ....
                }
            }
        }
    }
    
    private func setUI() {
        self.setNavigationBar()
        self.setLayout()
        self.setTableViewConfig()
    }
    
    private func reload() {
        self.tableView.reloadData()
    }
    
    private func setNavigationBar() {
        self.navigationItem.title = "날씨"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            .font: UIFont(name: "SFProText-Bold", size: 36)!,
            .foregroundColor: UIColor.white
        ]
        
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
        
        searchController.searchBar.delegate = self
    }
    
    private func setLayout() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        tableView.showsVerticalScrollIndicator = false
    }
    
    private func setTableViewConfig() {
        self.tableView.register(WeatherCardTableViewCell.self,
                                forCellReuseIdentifier: WeatherCardTableViewCell.identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    // 셀 클릭 시 화면 전환 및 데이터 전달
    @objc func cardTapped(sender: UITapGestureRecognizer) {
        guard let indexPath = tableView.indexPath(for: sender.view as! UITableViewCell) else { return }
        let selectedData: WeatherDataModel
        
        if isSearchActive {
            selectedData = filteredList[indexPath.row]
        }
        else {
            selectedData = weatherData[indexPath.row]
        }
        
        // 데이터값 소숫점 버림 적용
        let numberForMatter = NumberFormatter()
        numberForMatter.roundingMode = .floor
        numberForMatter.maximumSignificantDigits = 1
        
        let temperature = selectedData.main["temp"] ?? 0
        let maxTemperature = selectedData.main["temp_max"] ?? 0
        let minTemperature = selectedData.main["temp_min"] ?? 0
        
        let detailVC = WeatherDetailViewController()
        
        detailVC.locationLabel.text = translateCityNameToKorean(name: selectedData.name)
        detailVC.currentTemperatureLabel.text = "\(numberForMatter.string(for: temperature) ?? "")°"
        detailVC.currentWeatherLabel.text = selectedData.weather[0].description
        detailVC.highTemperatureText = "최고:\(numberForMatter.string(for: maxTemperature) ?? "")°"
        detailVC.lowTemperatureText = "최저:\(numberForMatter.string(for: minTemperature) ?? "")°"
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension WeatherListViewController: UITableViewDelegate {}
extension WeatherListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearchActive {
            return filteredList.count
        }
        else {
            return weatherData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherCardTableViewCell.identifier,
                                                       for: indexPath) as? WeatherCardTableViewCell else {return UITableViewCell()}
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cardTapped))
        cell.isUserInteractionEnabled = true
        cell.addGestureRecognizer(tapGesture)
        
        if isSearchActive {
            cell.bindData(data: filteredList[indexPath.row])
        }
        else {
            cell.bindData(data: weatherData[indexPath.row])
        }
        
        return cell
    }
}

extension WeatherListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterItems(with: searchText)
        self.reload()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.resignFirstResponder() // 키보드 내림
        filterItems(with: "")
        self.reload()
    }
    
    private func filterItems(with searchText: String) {
        if searchText.isEmpty {
            // 검색어가 비어있으면 모든 항목을 포함
            isSearchActive = false
        } else {
            // 검색어를 기준으로 weatherList 배열을 필터링하여 검색 결과를 filteredList에 저장
            filteredList = weatherData.filter { $0.name.range(of: searchText, options: .anchored) != nil }
            isSearchActive = true
        }
    }
}



