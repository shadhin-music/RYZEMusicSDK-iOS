//
//  HomeVC.swift
//  Shadhin-BL-Example
//
//  Created by Joy on 29/11/22.
//

import UIKit
import Shadhin_RYZE
class HomeVC: UIViewController {
    private var membership: String = "Gold"
    init(){
        super.init(nibName: "HomeVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource : [String] = [
        "Home",
        "Popular Artist",
        "Latest Release",
        "Popular Video",
        "Feature Podcast",
        "Amar tune",
        "Amar tune top 100",
        "Radio","Reset Cache",
        "Open with RC Code to Artist",
        "Open RC code to Album",
        "open RC code to Track",
        "open RC code to playlist",
        "open RC code to Patch",
        "open RC code to Podcast Show",
        "Open RC code to podcast episode",
        "Open RC code to terms and condition",
        "Stop Music",
        "Bkash Open",
        "Voice of Islam",
        "Tomake chai","Radio see all","Radio see all old"]
    
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

extension HomeVC : UITableViewDataSource,UITableViewDelegate{
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
        // Here need set the membership status
        if indexPath.row == 0{
            ShadhinRyze.shared
                .gotoHome(
                    with: self.tabBarController,
                    navigationController: self.navigationController!,
                    membership:membership
                )
            
        }else if indexPath.row == 1{
            ShadhinRyze.shared.openPatch(patchID: FeatureType.POPULAR_ARTIST.rawValue, navigationController: self.navigationController!,tabController: self.tabBarController)
        }else if indexPath.row == 2{
            ShadhinRyze.shared.openPatch(patchID:FeatureType.LATEST_RELEASE.rawValue, navigationController: self.navigationController!,tabController: self.tabBarController)
        }else if indexPath.row == 3{
            ShadhinRyze.shared.openPatch(patchID: FeatureType.POPULAR_VIDEO.rawValue, navigationController: self.navigationController!,tabController: self.tabBarController)
        }else if indexPath.row == 4{
            ShadhinRyze.shared.openPatch(patchID: FeatureType.PODCAST.rawValue, navigationController: self.navigationController!,tabController: self.tabBarController)
        }else if indexPath.row == 5{
            ShadhinRyze.shared.openPatch(patchID: FeatureType.AMAR_TUNE.rawValue, navigationController: self.navigationController!,tabController: self.tabBarController)
        }else if indexPath.row == 6{
            ShadhinRyze.shared.openPatch(patchID: FeatureType.AMAR_TUNE_TOP_100.rawValue, navigationController: self.navigationController!,tabController: self.tabBarController)
        }else if indexPath.row == 7{
            ShadhinRyze.shared.openPatch(patchID: "MzAwMDlfcmFkaW8=", navigationController: self.navigationController!, tabController: self.tabBarController)
            //ShadhinBL.shared.openPatch(patchID: "30001_radio", navigationController: self.navigationController!, tabController: self.tabBarController)
        }else if indexPath.row == 8{
            ShadhinRyze.shared.clearAllCache()
        }else if indexPath.row == 9{
            ShadhinRyze.shared.openPatch(patchID: "NzBfYQ==", navigationController: self.navigationController!, tabController: self.tabBarController)
        }else if indexPath.row == 10{
            ShadhinRyze.shared.openPatch(patchID: "UDAwOV9QYXRjaA==", navigationController: self.navigationController!, tabController: self.tabBarController)
        }else if indexPath.row == 11{
            ShadhinRyze.shared.openPatch(patchID: "UDAzMF9QYXRjaA==", navigationController: self.navigationController!, tabController: self.tabBarController)
        }else if indexPath.row == 12{
            ShadhinRyze.shared.openPatch(patchID: "UDA1MF9QYXRjaA==", navigationController: self.navigationController!, tabController: self.tabBarController)
        }else if indexPath.row == 13{
            ShadhinRyze.shared.openPatch(patchID: "UDA2OV9QYXRjaA==", navigationController: self.navigationController!, tabController: self.tabBarController)
        }else if indexPath.row == 14{
            ShadhinRyze.shared.openPatch(patchID: "UDA4MF9QYXRjaA==", navigationController: self.navigationController!, tabController: self.tabBarController)
        }else if indexPath.row == 15{
            ShadhinRyze.shared.openPatch(patchID: "UDA3Ml9QYXRjaA==", navigationController: self.navigationController!, tabController: self.tabBarController)
        }else if indexPath.row == 16{
            ShadhinRyze.shared.openPatch(patchID: "MDAwMF9URVJNU0FORENPTkRJVElPTg==", navigationController: self.navigationController!, tabController: self.tabBarController)
        }else if indexPath.row == 17{
            ShadhinRyze.shared.stopMusic()
        }else if indexPath.row == 18{
            ShadhinRyze.shared.openPatch(patchID: "MDAwMF9CS0FTSA==", navigationController: self.navigationController!, tabController: self.tabBarController)
        }else if indexPath.row == 19{
            ShadhinRyze.shared.openPatch(patchID: "MDAwMF9WRFZJ", navigationController: self.navigationController!, tabController: self.tabBarController)
        }else if indexPath.row == 20{
            ShadhinRyze.shared.openPatch(patchID: "MDAwMF9QRFRD", navigationController: self.navigationController!, tabController: self.tabBarController)
        }else if indexPath.row == 21{
            ShadhinRyze.shared.openPatch(patchID: "UDA5N19wYXRjaA==", navigationController: self.navigationController!, tabController: self.tabBarController)
        }else {
            ShadhinRyze.shared.openPatch(patchID: "radio", navigationController: self.navigationController!, tabController: self.tabBarController)
        }
        
    }
}
extension HomeVC : RadioCallBack{
    func radioSeeAll(rcCode : String) {
        
    }
    
    func fetchTokenForRadio(complete: @escaping (String, Bool) -> Void) {
        
    }
    
    
}
