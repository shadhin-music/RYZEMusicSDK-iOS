
//
//  TabBarVC.swift
//  Shadhin-BL-Example
//
//  Created by Joy on 1/12/22.
//

import UIKit
import Shadhin_RYZE

var isHomeVC : Bool = true

class TabBarVC: UITabBarController {
    
    init(){
        super.init(nibName: "TabBarVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: - Setup Tab Bar Items
        let aItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
        let cItem = UITabBarItem(title: "Artist", image: UIImage(named: "home"), tag: 1)
        
        let a = HomeVC()
        a.tabBarItem = aItem
    
        let b = TopArtistVC()
        let nav = UINavigationController(rootViewController: b)
        nav.isNavigationBarHidden = true
        nav.tabBarItem = cItem
        b.view.backgroundColor = .gray
        
        viewControllers = [a, nav]
        
        // MARK: - Set Delegate
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

// MARK: - UITabBarControllerDelegate
extension TabBarVC: UITabBarControllerDelegate {
    
    /// Called when a tab bar button is tapped
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let selectedIndex = tabBarController.selectedIndex
        print("Tab clicked: \(selectedIndex)")
        
        switch selectedIndex {
        case 0:
            isHomeVC = true
        case 1:
            isHomeVC = false
        default:
            break
        }
    }
}
