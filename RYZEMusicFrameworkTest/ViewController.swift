//
//  ViewController.swift
//  Shadhin-BL-Example
//
//  Created by Joy on 21/8/22.
//

import UIKit
import Shadhin_RYZE

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //private var dataSource : [String] = ["Create Playlist","Popular Artist","Popular Brand","Popular album","Top Trending","Music video","Top Trending video","Watch later","Latest Release","Made For You","My Downloads","Home","My Playlist","All Genre","Popular podcast","Album details","Artist details","Video player"]
    private var dataSource : [String] = ["Home","Popular Artist","Latest Release","Popular Video","Feature Podcast","Amar tune","Amar tune top 100","Radio","Goto Home"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }


    @IBAction func onButtonPressed(_ sender: Any) {
        //ShadhinBL.gotoCreatePlaylist(from: self)
        
    }
}

extension ViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if #available(iOS 14.0, *) {
            var content = cell.defaultContentConfiguration()
            content.text = dataSource[indexPath.row]
            cell.contentConfiguration = content
        } else {
            // Fallback on earlier versions
            cell.textLabel?.text = dataSource[indexPath.row]
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let type =  FeatureType(rawValue: indexPath.row)!
//        if indexPath.row == 0{
//            ShadhinBL.shared.gotoHome(nav: self.navigationController!)
//            
//        }else if indexPath.row == 1{
//            ShadhinBL.shared.openPatch(patchID: FeatureType.POPULAR_ARTIST.rawValue, navigation: self.navigationController!)
//        }else if indexPath.row == 2{
//            ShadhinBL.shared.openPatch(patchID:FeatureType.LATEST_RELEASE.rawValue, navigation: self.navigationController!)
//        }else if indexPath.row == 3{
//            ShadhinBL.shared.openPatch(patchID: FeatureType.POPULAR_VIDEO.rawValue, navigation: self.navigationController!)
//        }else if indexPath.row == 4{
//            ShadhinBL.shared.openPatch(patchID: FeatureType.PODCAST.rawValue, navigation: self.navigationController!)
//        }else if indexPath.row == 5{
//            ShadhinBL.shared.openPatch(patchID: FeatureType.AMAR_TUNE.rawValue, navigation: self.navigationController!)
//        }else if indexPath.row == 6{
//            ShadhinBL.shared.openPatch(patchID: FeatureType.AMAR_TUNE_TOP_100.rawValue, navigation: self.navigationController!)
//        }else if indexPath.row == 7{
//            ShadhinBL.shared.gotoRadio(nav: self.navigationController!)
//        }else{
//            //self.navigationController?.pushViewController(TabBarVC(), animated: true)
//        }
        
    }
}
