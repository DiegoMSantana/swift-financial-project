//
//  MainViewController.swift
//  Bankey
//
//  Created by Diego Marcolino Santana on 15/01/26.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTabBar()
        self.view.backgroundColor = .blue
    }
    
    private func setupViews() {
        
        let summaryVC = AccountSummaryViewController()
        let moneyVC = MoveMoneyViewController()
        let moreVC = MoreViewController()

        summaryVC.setTabBarImage(image: "list.dash.header.rectangle", title: "Resumo")
        moneyVC.setTabBarImage(image: "arrow.left.arrow.right", title: "Transferência")
        moreVC.setTabBarImage(image: "ellipsis.circle", title: "Mais")

        let summaryNC = UINavigationController(rootViewController: summaryVC)
        let moneyNC = UINavigationController(rootViewController: moneyVC)
        let moreNC = UINavigationController(rootViewController: moreVC)

        summaryNC.view.backgroundColor = appCollor
        summaryNC.navigationBar.barTintColor = appCollor
        hideNavigationBarLine(summaryNC.navigationBar)
        
        let tabBarList = [summaryNC, moneyNC, moreNC]

        viewControllers = tabBarList
    }
    
    private func hideNavigationBarLine(_ navigationBar: UINavigationBar) {
        let img = UIImage()
        navigationBar.shadowImage = img
        navigationBar.setBackgroundImage(img, for: .default)
        navigationBar.isTranslucent = false
    }
    
    
    private func setupTabBar() {
        //tabBar.tintColor = appCollor
        tabBar.tintColor = appCollor
        tabBar.isTranslucent = true
        tabBar.backgroundColor = .systemBackground
        
    }
}

class MoveMoneyViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemOrange
    }
}

class MoreViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemPurple
    }
}

