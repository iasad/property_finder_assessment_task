//
//  CustomCollectionViewCell.swift
//  Property_Finder
//
//  Created by Asad 'Bunny' on 26/11/2018.
//  Copyright © 2018 Asad 'Bunny'. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    //IBOutlets
    @IBOutlet weak var thumbnailImage: CachedImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var title: UILabel!
}
