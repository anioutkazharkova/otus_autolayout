//
//  ImagePhotoManager.swift
//  otus_autolayout
//
//  Created by Anna Zharkova on 03.03.2022.
//

import Foundation
import UIKit
import Photos

class ImagePhotoManager: NSObject {
    var assets: PHFetchResult<AnyObject>? = nil
    static let shared = ImagePhotoManager()
    
    func loadAssets(success: @escaping(PHFetchResult<AnyObject>)->Void,
                    failure: @escaping()->Void) {
        if PHPhotoLibrary.authorizationStatus() == .authorized {
            self.loadAssets(success: success)
        } else {
            PHPhotoLibrary.requestAuthorization { status in
                if status == .authorized {
                    self.loadAssets(success: success)
                } else {
                    failure()
                }
            }
        }
    }
    
    func loadAssets(success: @escaping(PHFetchResult<AnyObject>)->Void) {
        let fetchOptions = PHFetchOptions()
        //fetchOptions.sortDescriptors = [NSSortDescriptor(key: "createdDate", ascending: false)]
        fetchOptions.fetchLimit = 250000
        assets = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: fetchOptions) as? PHFetchResult<AnyObject>
        success(assets!)
    }
    
    func loadImageForAsset(index: Int, size: CGFloat, success: @escaping(UIImage)->Void) {
        if let item = assets?[index] as? PHAsset {
            PHImageManager.default().requestImage(for: item, targetSize: CGSize(width: size, height: size), contentMode: .aspectFill, options: nil) { image, data in
                guard let image = image else {return}
                success(image)
            }
        }
    }
    
}
