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

        let aItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        let bItem = UITabBarItem(title: "Radio", image: UIImage(systemName: "dot.radiowaves.left.and.right"), tag: 1)
        let cItem = UITabBarItem(title: "Music", image: UIImage(systemName: "music.note.list"), tag: 2)
        let dItem = UITabBarItem(title: "Artist", image: UIImage(systemName: "person.crop.square"), tag: 3)
        let a = HomeVC()
        let aNav = UINavigationController(rootViewController: a)
        aNav.isNavigationBarHidden = true
        aNav.tabBarItem = aItem
        
        let b = A()
        
        let bNav = UINavigationController(rootViewController: b)
        bNav.tabBarItem = bItem
        
        let c = C()
        let nav = UINavigationController(rootViewController: c)
        nav.isNavigationBarHidden = true
        nav.tabBarItem = cItem
        c.view.backgroundColor = .gray
        
        let bTab = ArtistViewVC()
        let bNavView = UINavigationController(rootViewController: bTab)
        bNavView.isNavigationBarHidden = true
        bNavView.tabBarItem = dItem
        
        viewControllers = [aNav,bNav,nav,bNavView]
      
        
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
