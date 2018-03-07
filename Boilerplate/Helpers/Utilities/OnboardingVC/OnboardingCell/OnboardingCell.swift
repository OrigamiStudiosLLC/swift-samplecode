//
//  OnboardingCell.swift
//  Boilerplate
//
//  Created by Syed Qasim on 29/01/2018.
//  Copyright © 2018 Crewlogix. All rights reserved.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    /// Set value to this label as title of the card. In case you don't need this title then leave it empty
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDescripton: UILabel!
    @IBOutlet var imgView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
