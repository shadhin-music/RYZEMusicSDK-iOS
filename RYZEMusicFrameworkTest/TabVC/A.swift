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
        if let vv = ShadhinRyze.shared.radioView(isAutoPlay: true){
            vv.setTitle(title: "New Radio View", backgroundColor: .white, isDotHide: false, isSeeAll: true, seeAllArrowTint: .green)
            radioView.addSubview(vv)
            vv.translatesAutoresizingMaskIntoConstraints = false
            vv.topAnchor.constraint(equalTo: radioView.topAnchor).isActive = true
            vv.bottomAnchor.constraint(equalTo: radioView.bottomAnchor).isActive = true
            vv.leadingAnchor.constraint(equalTo: radioView.leadingAnchor).isActive = true
            vv.trailingAnchor.constraint(equalTo: radioView.trailingAnchor).isActive = true
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ShadhinRyze.shared.radioInitialise(tabBarController: self.tabBarController!,delegate : self)
        
    }

}
extension A : RadioCallBack{
    func radioSeeAll(rcCode: String) {
        print("Radio see all pressed")
        //ShadhinBL.shared.openPatch(patchID: rcCode, navigationController: self.navigationController!, tabController: self.tabBarController)
    }
    
    
    func fetchTokenForRadio(complete: @escaping (String, Bool) -> Void) {
        ShadhinRyze.shared.login(number: "8801930186707") { isDone, token in
            if isDone{
                complete(token,true)
            }
        }
    }
    
}
