//
//  SliderVC.swift
//  otus_autolayout
//
//  Created by Anna Zharkova on 03.03.2022.
//

import UIKit

class SliderVC: UIViewController {
    
    @IBOutlet weak var slider: UIPageControl!
    @IBOutlet weak var imageList: UICollectionView!
    private var adapter: SliderAdapter? = SliderAdapter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.adapter?.listener = self
        ImagePhotoManager.shared.loadAssets { result in
            self.imageList.delegate = self.adapter
            self.imageList.dataSource = self.adapter
            self.imageList.reloadData()
            self.slider.numberOfPages = result.count
            self.imageList.collectionViewLayout.invalidateLayout()
        } failure: {
            print("error")
        }

    }
    
    @IBAction func onSliderChanged(_ sender: Any) {
        let item = self.slider.currentPage
        self.imageList.scrollToItem(at: IndexPath(row: item, section: 0), at: .right, animated: true)
    }
}

extension SliderVC : ScrollOwner {
    func selectPage(page: Int) {
        self.slider.currentPage = page
    }
}

