//
//  UIViewControllerUtils.swift
//  Bankey
//
//  Created by Diego Marcolino Santana on 15/01/26.
//

import UIKit

extension UIViewController {
    
    func setStatusBar(){
        
        //Deprecated
        /*let statusBarSize = UIApplication.shared.statusBarFrame.size
         let frame = CGRect(origin: .zero, size: statusBarSize)
         let statusbarView = UIView(frame: frame)
        
         statusbarView.backgroundColor = appCollor
         self.view.addSubview(statusbarView)*/
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithTransparentBackground()
        navBarAppearance.backgroundColor = appCollor
        navBarAppearance.shadowColor = .clear
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        
    }
    
    func setTabBarImage(image: String, title: String) {
        
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: image, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)

    }
    
}
