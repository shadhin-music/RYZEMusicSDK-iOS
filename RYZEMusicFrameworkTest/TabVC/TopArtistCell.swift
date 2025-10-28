//
//  TopArtistCell.swift
//  RYZE_Example
//
//  Created by Maruf on 15/10/25.
//

//
//  TopArtistCell.swift
//  RYZE_Example
//
//  Created by Maruf on 15/10/25.
//

import UIKit
import Shadhin_RYZE

protocol TopArtistCellDelegate: AnyObject {
    func didTapSeeAllArtists()
    func didTapArtistDetails(artist: ArtistDataModel, others: [ArtistDataModel])
}

class TopArtistCell: UITableViewCell {
    
    // MARK: - Reuse Identifier & Nib
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    // MARK: - Outlets
    @IBOutlet weak var artistView: RYZEArtistView!
    
    // MARK: - Delegate
    weak var delegate: TopArtistCellDelegate?
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // ✅ Handle artist item tap
        
//        ShadhinRyze.shared.didTapSeeAllArtist = { [weak self] in
//            ShadhinRyze.shared.openPatch(patchID: FeatureType.POPULAR_ARTIST.rawValue, navigationController: nav, tabController: nil)
//        }
//        ShadhinRyze.shared.didTapArtistDetails = { [weak self] artist, others in
//            guard let self = self, let nav = self.navigationController, let tab = self.tabBarController else { return }
//            ShadhinRyze.shared.openArtistDetailsVC(artist: artist, otherArtists: others, navigationController: nav, tabController: tab)
//        }

    }
    // MARK: - Private setup
    private func configureArtistView() {
     
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
       // artistView.clear()  // Prevents old data flashes
    }
}
