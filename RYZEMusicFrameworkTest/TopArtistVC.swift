//
//  TopArtistVC.swift
//  Shadhin_RYZE_Example
//
//  Created by Maruf on 30/6/25.
//

import UIKit

class TopArtistVC: UIViewController {
    
    private var collectionView: UICollectionView!
    private var dummyData: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Dummy data create (50 items)
        for i in 1...20 {
            dummyData.append("Artist \(i)")
        }
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        // Layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: view.frame.width, height: 60)
        
        // CollectionView
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        
        // Register cell
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .lightGray
        
        view.addSubview(collectionView)
        
        // Constraints
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - UICollectionView DataSource & Delegate
extension TopArtistVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        // Remove old labels if reused
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        
        // Label for dummy text
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = dummyData[indexPath.item]
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        cell.contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 16),
            label.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor)
        ])
        
        cell.backgroundColor = UIColor.cyan
        
        return cell
    }
}
