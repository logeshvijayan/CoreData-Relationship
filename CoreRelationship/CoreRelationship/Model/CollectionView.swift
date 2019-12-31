//
//  CollectionView.swift
//  CoreRelationship
//
//  Created by logesh on 12/30/19.
//  Copyright © 2019 logesh. All rights reserved.
//

import Foundation
import UIKit

class CollectionView: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionView()
    }
    
    
    func setupCollectionView()  {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register
    }
}


extension CollectionView : UICollectionViewDelegate,UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
