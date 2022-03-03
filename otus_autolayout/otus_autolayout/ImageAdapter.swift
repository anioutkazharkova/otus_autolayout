//
//  ImageAdapter.swift
//  otus_autolayout
//
//  Created by Anna Zharkova on 03.03.2022.
//

import Foundation
import UIKit

class ImageAdapter: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
 
    var coef: Int = 3 {
        didSet {
            setupSize()
        }
    }
    
    private var size: CGFloat = 0
    
    func setupSize(){
        self.size = (UIScreen.main.bounds.width - 20) / CGFloat(coef)
    }

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return ImagePhotoManager.shared.assets?.count ?? 0
}
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageViewCell", for: indexPath) as? ImageViewCell else {return UICollectionViewCell()}
    ImagePhotoManager.shared.loadImageForAsset(index: indexPath.row, size: 120) { image in
        cell.imageView.image = image
    }
    return cell
}
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
