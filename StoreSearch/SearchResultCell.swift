//
//  SearchResultCell.swift
//  StoreSearch
//
//  Created by BT-Training on 08/09/16.
//  Copyright © 2016 BT-Training. All rights reserved.
//

import UIKit

class SearchResultCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var artWorkImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let selectedView = UIView(frame: CGRect.zero)
        selectedView.backgroundColor = UIColor(red: 20/255, green: 160/255, blue: 160/255, alpha: 0.5)
        self.selectedBackgroundView = selectedView
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
