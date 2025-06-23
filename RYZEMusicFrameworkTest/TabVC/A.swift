//
//  A.swift
//  Shadhin-BL-Example
//
//  Created by Joy on 1/12/22.
//

import UIKit
import Shadhin_RYZE
class A: UIViewController {

    init(){
        super.init(nibName: "A", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var radioView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        if let vv = ShadhinBL.shared.radioView(isAutoPlay: true){
//            radioView.addSubview(vv)
//            vv.translatesAutoresizingMaskIntoConstraints = false
//            vv.topAnchor.constraint(equalTo: radioView.topAnchor).isActive = true
//            vv.bottomAnchor.constraint(equalTo: radioView.bottomAnchor).isActive = true
//            vv.leadingAnchor.constraint(equalTo: radioView.leadingAnchor).isActive = true
//            vv.trailingAnchor.constraint(equalTo: radioView.trailingAnchor).isActive = true
//        }
//        ShadhinBL.shared.radioInitialise(tabBarController: self.tabBarController!, delegate: self)
    }

    @IBAction func onGotoMusicPressd(_ sender: Any) {
        guard let nav = self.navigationController else{
            return
        }
        ShadhinBL.shared.gotoHome(with: self.tabBarController, navigationController: nav)
    }

}
extension A : RadioCallBack{
    func radioSeeAll(rcCode : String) {
        
    }
    
    func fetchTokenForRadio(complete: @escaping (String, Bool) -> Void) {
        debugPrint("need token ")
        ShadhinBL.shared.login(number: "8801954545813") { isDone, token in
            if isDone{
                complete(token,true)
            }
        }
    }
    
    
}
