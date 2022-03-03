//
//  ImageVC.swift
//  otus_autolayout
//
//  Created by Anna Zharkova on 03.03.2022.
//

import UIKit

class ImageVC: UIViewController {

    @IBOutlet weak var numberDelegate: UITextField!
    @IBOutlet weak var imageList: UICollectionView!
    private var adapter: ImageAdapter? = ImageAdapter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ImagePhotoManager.shared.loadAssets { result in
            self.imageList.delegate = self.adapter
            self.imageList.dataSource = self.adapter
            self.imageList.reloadData()
        } failure: {
            print("error")
        }

    }
   
    @IBAction func onClick(_ sender: Any) {
        let text = self.numberDelegate.text ?? ""
        let number = Int(text) ?? 1
        
        self.adapter?.coef = number
        self.imageList.reloadData()
    }
    
}
