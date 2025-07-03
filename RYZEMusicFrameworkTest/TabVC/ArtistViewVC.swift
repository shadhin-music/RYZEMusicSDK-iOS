//
//  ArtistViewVC.swift
//  RYZEMusicFrameworkTest
//
//  Created by Maruf on 3/7/25.
//

import UIKit
import Shadhin_RYZE

class ArtistViewVC: UIViewController {
    @IBOutlet weak var artistView: RYZEArtistView!

    init(){
        super.init(nibName: "ArtistViewVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ShadhinRyze.shared.artistView()
        ShadhinRyze.shared.didTapSeeAllArtist = { [weak self] in
            guard let self = self,let nav = self.navigationController, let tab = self.tabBarController else { return }
            ShadhinRyze.shared.openPatch(patchID: FeatureType.POPULAR_ARTIST.rawValue, navigationController: nav, tabController: tab)
        }
        ShadhinRyze.shared.didTapArtistDetails = { [weak self] artist, others in
            guard let self = self, let nav = self.navigationController, let tab = self.tabBarController else { return }
            ShadhinRyze.shared.openArtistDetailsVC( artist: artist, otherArtists: others, navigationController: nav, tabController: tab)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ShadhinRyze.shared.hideMusicPlayer()
    }



}
