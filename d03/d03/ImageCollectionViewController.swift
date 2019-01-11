//
//  ImageCollectionViewController.swift
//  d03
//
//  Created by Octavio orlando OJEDA ARONIZ on 1/11/19.
//  Copyright © 2019 Octavio orlando OJEDA ARONIZ. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ImageCollectionViewCell"

class ImageCollectionViewController: UICollectionViewController {

    var urls = [
     "https://www.nasa.gov/sites/default/files/styles/full_width/public/thumbnails/image/e0102_lg.jpg?itok=sd9lOayI",
     "https://www.nasa.gov/sites/default/files/styles/full_width/public/thumbnails/image/e0102_lg.jpg?itok=sd9lOayI",
     "https://www.nasa.gov/sites/default/files/styles/full_width/public/thumbnails/image/e0102_lg.jpg?itok=sd9lOayI",
     "https://www.nasa.gov/sites/default/files/styles/full_width/public/thumbnails/image/e0102_lg.jpg?itok=sd9lOayI",
    ]
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        let ll = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout;
        ll.itemSize = CGSize(width: self.view.bounds.width / 3, height: self.view.bounds.height / 3);
        ll.minimumInteritemSpacing = 1;
        ll.minimumLineSpacing = 1;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func loadImage(url: String) -> UIImage? {
        if let url = URL(string : url) {
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents {
                return UIImage(data: imageData)
            }
        }
        return nil
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return urls.count
    }


    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        let imageview:UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width / 3 , height: self.view.bounds.width / 3))
        let image:UIImage = loadImage(url: urls[indexPath.row])!
        
        imageview.image = image
        
        cell.contentView.addSubview(imageview)
        return cell
    }
}
