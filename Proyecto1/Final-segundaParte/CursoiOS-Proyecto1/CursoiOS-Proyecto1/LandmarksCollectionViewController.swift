//
//  LandmarksCollectionViewController.swift
//  CursoiOS-Proyecto1
//
//  Created by Abrahán Fernández on 04/01/2021.
//

import UIKit

private let reuseIdentifier = "PictureCell"

class LandmarksCollectionViewController: UICollectionViewController {

    static let viewIdentifier = "LandmarksCollectionView"

    let landmarks = landmarkData

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Collección"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Do any additional setup after loading the view.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return landmarks.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PictureCell
    
        // Configure the cell
        cell.imageView.image = landmarks[indexPath.item].image
    
        return cell
    }

    // MARK: - UICollectionViewDelegate
    // MARK: - Navigation

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let image = landmarks[indexPath.item].image

        let viewController = storyboard?.instantiateViewController(identifier:  DetailViewController.viewIdentifier) as! DetailViewController
        viewController.image = image

        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

