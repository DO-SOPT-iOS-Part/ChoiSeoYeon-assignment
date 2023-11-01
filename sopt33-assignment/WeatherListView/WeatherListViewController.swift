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
    
    private let tableView = UITableView(frame: .zero, style: .plain).then {
        $0.backgroundColor = .black
        $0.rowHeight = 117
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()
        self.setLayout()
        self.setTableViewConfig()
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
    }
    
    private func setLayout() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setTableViewConfig() {
        self.tableView.register(WeatherCardTableViewCell.self,
                                forCellReuseIdentifier: WeatherCardTableViewCell.identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    @objc func cardTapped() {
        let detailVC = WeatherDetailViewController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension WeatherListViewController: UITableViewDelegate {}
extension WeatherListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherCardTableViewCell.identifier,
                                                       for: indexPath) as? WeatherCardTableViewCell else {return UITableViewCell()}
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cardTapped))
        cell.isUserInteractionEnabled = true
        cell.addGestureRecognizer(tapGesture)
        
        cell.bindData(data: weatherList[indexPath.row])
        return cell
    }
}



