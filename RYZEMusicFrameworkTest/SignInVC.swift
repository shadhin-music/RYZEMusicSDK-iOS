//
//  SignInVC.swift
//  Shadhin-BL-Example
//
//  Created by Joy on 29/11/22.
//

import UIKit
import Shadhin_RYZE
class SignInVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textField.text = "8801917748626"
    }

    @IBAction func onLoginPressed(_ sender: UIButton) {
        
        guard let number = textField.text, !number.isEmpty, number.count  == 13 else {
            print("empty or invalid number")
            return
        }
        sender.isEnabled = false
        ShadhinRyze.shared.login(number: number) { isDone, token in
            if isDone{
                ShadhinRyze.shared.initialize(with: token,isBL: PhoneNumberVerify.isBanglalink(number), delegate: self,tabController: self.tabBarController,navigationController: self.navigationController!)
            }else{
                
            }
        }
        
    }
    @IBAction func onWithoutLogin(_ sender: Any) {
        let home = TabBarVC()
        self.navigationController?.pushViewController(home, animated: true)
        
    }
    @IBAction func onDarkMood(_ sender: Any) {
        if #available(iOS 13.0, *) {
            let scenes = UIApplication.shared.connectedScenes
            let windowScene = scenes.first as? UIWindowScene
            let window = windowScene?.windows.first
            let interfaceStyle = window?.overrideUserInterfaceStyle == .unspecified ? UIScreen.main.traitCollection.userInterfaceStyle : window?.overrideUserInterfaceStyle
            
            if interfaceStyle != .dark {
                window?.overrideUserInterfaceStyle = .dark
            } else {
                window?.overrideUserInterfaceStyle = .light
            }
        } else {
            // Fallback on earlier versions
        }
                
    }
    
}
extension SignInVC : ShadhinCoreNotifier{
    func handleMSDKPaymentEvent(eventName: String, data: [String : Any]) {
        Log.info("MSDK Payment Event - Name: \(eventName), Data: \(data)")
        print("🔍 Debug MSDK Event -> Name: \(eventName) \(data)")
        for (key, value) in data {
            print("   \(key): \(value)")
        }

    }
    func memberShipStatus(isValid: Bool, value: String) {
        print("\(isValid) \(value)")
    }

    func linkRedirect(link: String) {
        
    }
    
    func event(eventName: String, content: [String : String]) {
        
    }
    
    func shareContentWithRC(title: String, image: String, rc code: String) {
        print(title,image,code)
    }
    
    func bkashPaymentInit() {
        
    }
    
    func bksahPaymentSuccess() {
        print("payment success")
    }
    
    //music play pause state error catch 
    func player(error: String) {
        print(error)
    }
    
    func shareContentWithRC(rc code: String) {
        print(code)
    }
    
    func rcError(error: String?) {
        print(error as Any)
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
class PhoneNumberVerify {
    static func isBanglalink(_ number : String) -> Bool{
        let phone = number.replacingOccurrences(of: "+", with: "")
        let banglalinkRegex =  "^8801[49]\\d{8}$"
        do {
            let regex = try NSRegularExpression(pattern: banglalinkRegex)
            let nsString = phone as NSString
            let results = regex.matches(in: phone, range: NSRange(location: 0, length: nsString.length))
            return !results.isEmpty
        } catch let error {
            debugPrint(error.localizedDescription)
            return false
        }
    }
}
