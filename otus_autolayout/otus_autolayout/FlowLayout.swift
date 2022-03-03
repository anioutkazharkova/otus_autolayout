//
//  FlowLayout.swift
//  otus_autolayout
//
//  Created by Anna Zharkova on 03.03.2022.
//

import UIKit

class FlowLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
        initContent()
    }
    func initContent() {
        
        estimatedItemSize = CGSize(width: UIScreen.main.bounds.size.width, height: 500)
        itemSize = CGSize(width: UIScreen.main.bounds.size.width, height: 500)
       minimumInteritemSpacing = 1
        minimumLineSpacing = 1
       sectionInset = UIEdgeInsets.zero
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initContent()
    }
}
