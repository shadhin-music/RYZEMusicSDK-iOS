//
//  TabBarVC.swift
//  Shadhin-BL-Example
//
//  Created by Joy on 1/12/22.
//

import UIKit
import Shadhin_RYZE

class TabBarVC: UITabBarController {

    init(){
        super.init(nibName: "TabBarVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let aItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
        let bItem = UITabBarItem(title: "B", image: UIImage(named: "home"), tag: 1)
        let cItem = UITabBarItem(title: "C", image: UIImage(named: "home"), tag: 2)
        
        let a = HomeVC()
        let aNav = UINavigationController(rootViewController: a)
        aNav.isNavigationBarHidden = true
        aNav.tabBarItem = aItem
        
        let b = C()
        b.tabBarItem = bItem
        
        let c = A()
        let nav = UINavigationController(rootViewController: c)
        nav.isNavigationBarHidden = true
        nav.tabBarItem = cItem
        c.view.backgroundColor = .gray
        viewControllers = [aNav,b,nav]
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
