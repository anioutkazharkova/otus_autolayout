//
//  SliderAdapter.swift
//  otus_autolayout
//
//  Created by Anna Zharkova on 03.03.2022.
//

import Foundation

import Foundation
import UIKit

class SliderAdapter: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
 
    weak var listener: ScrollOwner? = nil

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return ImagePhotoManager.shared.assets?.count ?? 0
}
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageViewCell", for: indexPath) as? BigImageViewCell else {return UICollectionViewCell()}
    ImagePhotoManager.shared.loadImageForAsset(index: indexPath.row, size: 500) { image in
        cell.imageView.image = image
    }
    return cell
}
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.size.width
        let height = collectionView.bounds.size.height
        return CGSize(width: width, height: height)
    }
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        self.listener?.selectPage(page: Int(page))
    }
}

protocol ScrollOwner: AnyObject {
    func selectPage(page: Int)
}
