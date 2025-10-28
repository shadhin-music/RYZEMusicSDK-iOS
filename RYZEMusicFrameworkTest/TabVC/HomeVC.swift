//
//  HomeVC.swift
//  Shadhin-BL-Example
//
//  Created by Joy on 29/11/22.
//

import UIKit
import Shadhin_RYZE

var isTabbarHide: Bool = false


class HomeVC: UIViewController {
    init(){
        super.init(nibName: "HomeVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // 👉 New state for scroll detection / keyboard
    private var lastOffsetY: CGFloat = 0
    private var isKeyboardVisible = false
    private let distanceThreshold: CGFloat = 8       // ignore micro-jitters
    private let velocityThreshold: CGFloat = 80
    private var ryzeArtistView: RYZEArtistView!
    
    @IBOutlet weak var membership: UITextField!
    @IBOutlet weak var artistView: UIView!

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var sessionTimeButton: UIButton!
    
    @IBOutlet weak var sessionTimeTV: UITextField!
    
    private var dataSource : [String] = ["Home","Popular Artist","Latest Release","Popular Video","Feature Podcast","Amar tune","Amar tune top 100","Radio","Reset Cache","Open with RC Code to Artist","Open RC code to Popular Artist","open RC code to Latest Release","open RC code to Popular Bands","open RC code to Patch ","open RC code to Podcast Home","Open RC code to Top Trending","OPEN TERMS AND CONDITION","Stop Music","Play Music", "Pause Music", "Open Bkash","Voice of islam","Tomake Chai","Open radio see all from patch","SDK LOGOUT"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        let toolbar = UIToolbar()
        toolbar.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44)
        let done = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(onKeyboardDone))
        toolbar.setItems([done], animated: true)
        textField.delegate = self
        textField.inputAccessoryView = toolbar
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
        self.setupArtistView()
    }

    @IBAction func gotoRYZE(_ sender: Any) {
        guard let memberText = self.membership.text else {return}
        ShadhinRyze.shared.gotoHome(with: self.tabBarController, navigationController: self.navigationController!,membership:memberText)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ShadhinRyze.shared.setMusicPlayerVisibility(isVisibility: !isTabbarHide)
        sessionTimeButton.isEnabled = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isHomeVC {
            ShadhinRyze.shared.setMusicPlayerVisibility(isVisibility: false, isWillDisapper: true)
        } else {
            ShadhinRyze.shared.setMusicPlayerVisibility(isVisibility: false, isWillDisapper: false)
        }
    }
    
    private func setupArtistView() {
        ryzeArtistView = RYZEArtistView()
        ryzeArtistView.translatesAutoresizingMaskIntoConstraints = false
        
        artistView.addSubview(ryzeArtistView)
        
        NSLayoutConstraint.activate([
            ryzeArtistView.topAnchor.constraint(equalTo: artistView.topAnchor),
            ryzeArtistView.leadingAnchor.constraint(equalTo: artistView.leadingAnchor),
            ryzeArtistView.trailingAnchor.constraint(equalTo: artistView.trailingAnchor),
            ryzeArtistView.bottomAnchor.constraint(equalTo: artistView.bottomAnchor)
        ])
       
        ShadhinRyze.shared.didTapSeeAllArtist = { [weak self] in
            guard let self = self,let nav = self.navigationController, let tab = self.tabBarController else { return }
            ShadhinRyze.shared.openPatch(patchID: FeatureType.POPULAR_ARTIST.rawValue, navigationController: nav, tabController: tab)
        }
        ShadhinRyze.shared.didTapArtistDetails = { [weak self] artist, others in
            guard let self = self, let nav = self.navigationController, let tab = self.tabBarController else { return }
            ShadhinRyze.shared.openArtistDetailsVC(artist: artist, otherArtists: others, navigationController: nav, tabController: tab)
        }
    }

    
    @objc func onKeyboardDone(){
        textField.resignFirstResponder()
    }
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            UIView.animate(withDuration: 0.2) {
                self.bottomConstraint.constant = keyboardHeight
            }
        }
    }
    @objc func keyboardWillHide(_ notification: Notification) {
        UIView.animate(withDuration: 0.2) {
            
            self.bottomConstraint.constant = 16
        }
    }

   
    @IBAction func onButtonPressed(_ sender: Any) {
        guard let code = textField.text else {return}
        ShadhinRyze.shared.openPatch(patchID: code, navigationController: self.navigationController!, tabController: self.tabBarController)
    }
    
    @IBAction func onSessionTimeSetPressed(_ sender: Any) {
        guard let tt = sessionTimeTV.text, let time = Double(tt) else {return}
        ShadhinRyze.shared.setSessionPulesTimer(second: time)
        
        sessionTimeButton.isEnabled = false
        
    }
}

extension HomeVC : UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // You have two types of data: a TopArtistCell and a list of strings.
        // It's best to handle these in different sections.
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1 // The first section has only one row for the TopArtistCell
        }
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue and return a standard cell for other sections
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if #available(iOS 14.0, *) {
            var content = cell.defaultContentConfiguration()
            content.text = dataSource[indexPath.row]
            cell.contentConfiguration = content
        } else {
            cell.textLabel?.text = dataSource[indexPath.row]
        }
        
        return cell
    }
    
    // Make sure you also handle numberOfSections correctly
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let type =  FeatureType(rawValue: indexPath.row)!
        if indexPath.row == 0{
            guard let memberText = self.membership.text else {return}
            ShadhinRyze.shared.gotoHome(
                with: self.tabBarController,
                navigationController: self.navigationController ?? UINavigationController(),
                membership: memberText
            )
            print(memberText)
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
            ShadhinRyze.shared.openPatch(patchID: "NDM2X2E=", navigationController: self.navigationController!, tabController: self.tabBarController)
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
            ShadhinRyze.shared.openPatch(patchID: "MTAxMzQxX3M=", navigationController: self.navigationController!, tabController: self.tabBarController)
        }
        else if indexPath.row == 16{
            ShadhinRyze.shared.openPatch(patchID: "MDAwMF9URVJNU0FORENPTkRJVElPTg==", navigationController: self.navigationController!, tabController: self.tabBarController)
        }else if indexPath.row == 17{
                ShadhinRyze.shared.stopMusic()
        }else if indexPath.row == 18{
            ShadhinRyze.shared.playMusic()
        }else if indexPath.row == 19{
            ShadhinRyze.shared.pauseMusic()
        }else if indexPath.row == 20{
            ShadhinRyze.shared.openPatch(patchID: "MDAwMF9CS0FTSA==", navigationController: self.navigationController!, tabController: self.tabBarController)
        }else if indexPath.row == 21{
            ShadhinRyze.shared.openPatch(patchID: "MDAwMF9WRFZJ", navigationController: self.navigationController!, tabController: self.tabBarController)
        }else if indexPath.row == 22{
            ShadhinRyze.shared.openPatch(patchID: "MDAwMF9QRFRD", navigationController: self.navigationController!, tabController: self.tabBarController)
        }else if indexPath.row == 23{
            ShadhinRyze.shared.openPatch(patchID: "UDA5N19wYXRjaA==", navigationController: self.navigationController!, tabController: self.tabBarController)
        } else if indexPath.row == 24 {
            ShadhinRyze.shared.stopMusic()
        }
    }
    
    
    // MARK: Scroll-driven tab bar toggle
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        lastOffsetY = scrollView.contentOffset.y
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard !isKeyboardVisible, let tbc = tabBarController else { return }
        
        let y = scrollView.contentOffset.y
        let delta = y - lastOffsetY
        if abs(delta) < distanceThreshold { return }
        
        let velocityY = scrollView.panGestureRecognizer.velocity(in: scrollView).y
        
        if delta > 0, velocityY < -velocityThreshold {
            // Scrolling down → hide
            ShadhinRyze.shared.setMusicPlayerVisibility(isVisibility: false)
            tbc.ryze_setTabBar(hidden: true)
            isTabbarHide = true
        } else if delta < 0, velocityY > velocityThreshold {
            // Scrolling up → show
            ShadhinRyze.shared.setMusicPlayerVisibility(isVisibility: true, duration: 0.3)
            tbc.ryze_setTabBar(hidden: false)
            isTabbarHide = false
        }
        
        lastOffsetY = y
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate, scrollView.contentOffset.y <= 0 {
            tabBarController?.ryze_setTabBar(hidden: false)
    //        ShadhinRyze.shared.setMusicPlayerVisibility(isVisible: false)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= 0 {
            tabBarController?.ryze_setTabBar(hidden: false)
        //    ShadhinRyze.shared.setMusicPlayerVisibility(isVisible: false)
        }
    }
    
}

extension HomeVC : UITextFieldDelegate{
    
}
extension HomeVC:ShadhinLogNotifier {
    func handleMSDKPaymentEvent(eventName: String, data: [String : Any]) {
        
    }


    func tokenStatus(token isValid: Bool, error: String?) {
        
    }

    func patchError(error: String) {
        
    }

    func amarTuneError(error: String?) {
        
    }

    func rcError(error: String?) {
        
    }

    func shareContentWithRC(title: String, image: String, rc code: String) {
        
    }

    func player(error: String) {
        
    }

    func bkashPaymentInit() {
        
    }

    func bkashPaymentSuccess() {
        
    }

    func tokenFetchSuccess(complete: @escaping () -> Void) {
        
    }

    func event(
        eventName: String,
        contentName: String,
        contentType: String,
        patchName: String
    ) {
        
    }

    func linkRedirect(link: String) {
        
    }

    func memberShipStatus(isValid: Bool, value: String) {
        print("\(isValid) \(value)")
    }

    
}


extension UITabBarController {
    private struct RYZEHolder { static var isHidden = false }
    
    var ryze_isTabBarHidden: Bool {
        get { RYZEHolder.isHidden }
        set { RYZEHolder.isHidden = newValue }
    }
    
    func ryze_setTabBar(hidden: Bool, animated: Bool = true) {
        guard ryze_isTabBarHidden != hidden else { return }
        ryze_isTabBarHidden = hidden
        let tb = tabBar
        let height = tb.frame.height + (tb.window?.safeAreaInsets.bottom ?? 0)
        let target = hidden ? CGAffineTransform(translationX: 0, y: height + 6) : .identity
        let animations = {
            tb.transform = target
            tb.alpha = hidden ? 0.0 : 1.0

        }
        if animated {
            UIView.animate(withDuration: 0.22,
                           delay: 0,
                           options: [.beginFromCurrentState, .curveEaseInOut],
                           animations: animations)
        } else {
            animations()
        }
    }
}
