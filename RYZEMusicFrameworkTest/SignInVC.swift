//
//  SignInVC.swift
//  Shadhin-BL-Example
//
//  Created by Joy on 29/11/22.
//

import UIKit
import Shadhin_RYZE
import LinkPresentation

class SignInVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var radioView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textField.text = "8801930186707" // 8801930186707 pro // 8801409900051
    }

    @IBAction func onLoginPressed(_ sender: UIButton) {
        
        guard let number = textField.text, !number.isEmpty, number.count  == 13 else {
            print("empty or invalid number")
            return
        }
        sender.isEnabled = false
        
        ShadhinRyze.shared.login(number: number) { isDone, token in
            if isDone{
                //ShadhinBL.shared.tokenInitialize(with: token,isBL: PhoneNumberVerify.isBanglalink(number))
                ShadhinRyze.shared.initialize(with: token,isBL: PhoneNumberVerify.isBanglalink(number), delegate: self,tabController: self.tabBarController,navigationController: self.navigationController!)
            }else{
                let alert = UIAlertController(title: "Login Failed", message: "Please try again.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true)
                sender.isEnabled = true
            }
        }
        
    }
    @IBAction func signInWithoutNumberPressed(_ sender: Any) {
        let home = TabBarVC()
        self.navigationController?.pushViewController(home, animated: true)
    }
}
extension SignInVC : ShadhinCoreNotifier{
    func handleMSDKPaymentEvent(eventName: String, data: [String : Any]) {
        
    }

    func memberShipStatus(isValid: Bool, value: String) {
        print("\(isValid) \(value)")
       // print("\(isValid)", to: "\(value)")
    }

    func linkRedirect(link: String) {
        print(link)
        guard let url = URL(string: link), UIApplication.shared.canOpenURL(url)else {return}
        UIApplication.shared.open(url)
    }
    
    func event(eventName: String, data content: [String : String]) {
        print(eventName)
    }
    
    func bkashPaymentInit() {
        print("payment pop up show")
    }
    
    func shareContentWithRC(title: String, image: String, rc code: String) {
        
//        DispatchQueue.global(qos: .background).async{
//            if let url = URL(string: image), let data = try? Data(contentsOf: url){
//                //subtile must be a valid url link. thats redirect to app
//                let item = ShareableImage(image: UIImage(data: data), title: title,subtitle: url)
//                DispatchQueue.main.async {
//                    if let topVC = UIApplication.shared.topMostViewController(){
//
//                        let share = UIActivityViewController(activityItems: [item], applicationActivities: nil)
//                        share.title = title
//                        topVC.present(share, animated: true)
//                    }
//                }
//
//
//            }
//        }
        print("RC Code : ",code,image,title)
        ShadhinRyze.shared.openPatch(patchID: code,navigationController: self.navigationController!,tabController: self.tabBarController)
        UIPasteboard.general.string = code
        
    }
    
    func bksahPaymentSuccess() {
        print("subscription done")
    }
    
    func player(error: String) {
        print(error)
    }
    
    
    func rcError(error: String?) {
        print(error)
    }
    
    func amarTuneError(error: String?) {
        print(error as Any)
    }
    
    func tokenStatus(token isValid: Bool, error: String?) {
        if isValid{
            let home = TabBarVC()
            self.navigationController?.pushViewController(home, animated: true)
        }
    }
    
    func patchError(error: String) {
        print(error)
    }
    
    
}

