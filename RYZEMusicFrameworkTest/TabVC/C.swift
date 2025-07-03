//
//  C.swift
//  Shadhin-BL-Example
//
//  Created by Joy on 1/12/22.
//

import UIKit
import Shadhin_RYZE

class C: UIViewController {

    init(){
        super.init(nibName: "C", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var radioView: BLRadioView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        radioView.isAutoPlay = true
        radioView.setTitle(title: "New Radio", backgroundColor: .gray, isDotHide: false, isSeeAll: true, seeAllArrowTint: .black)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ShadhinRyze.shared.radioInitialise(tabBarController: self.tabBarController!, delegate: self)
    }

    @IBAction func onGotoMusicPressed(_ sender: Any) {
        guard let nav = self.navigationController else{
            return
        }
        ShadhinRyze.shared.gotoHome(with: self.tabBarController, navigationController: nav)
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
extension C : RadioCallBack{
    func radioSeeAll(rcCode : String) {
        
    }
    
    func fetchTokenForRadio(complete: @escaping (String, Bool) -> Void) {
        debugPrint("need token ")
        ShadhinRyze.shared.login(number: "8801954545813") { isDone, token in
            if isDone{
                complete(token,true)
            }
        }
    }
    
    
}
