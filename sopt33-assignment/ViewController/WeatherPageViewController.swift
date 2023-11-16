//
//  WeatherPageViewController.swift
//  sopt33-assignment
//
//  Created by 최서연 on 11/5/23.
//

import UIKit

class WeatherPageViewController: UIViewController {
    
    private let pageViewController = UIPageViewController(transitionStyle: .scroll,
                                                          navigationOrientation: .horizontal,
                                                          options: .none)
    private var pages = [WeatherDetailViewController]()
    private var pageIndex = 0
    private var pageControl = UIPageControl().then {
        $0.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 82)
        $0.backgroundColor = .systemPurple
        $0.numberOfPages = weatherData.count
        $0.currentPage = 0
        $0.isUserInteractionEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.setLayout()
        //self.setPageConfig()
    }
    
    private func setLayout() {
        self.view.addSubview(pageViewController.view)
        pageViewController.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setPageConfig() {
        pageViewController.delegate = self
        pageViewController.dataSource = self
    }
}

extension WeatherPageViewController: UIPageViewControllerDelegate{}
extension WeatherPageViewController: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController as! WeatherDetailViewController) else { return nil }
        if index == 1 {
            return nil
        }
        else {
            return pages[index - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController as! WeatherDetailViewController) else { return nil }
        if index == pages.count - 1 {
            return nil
        }
        else {
            return pages[index + 1]
        }
    }
}
