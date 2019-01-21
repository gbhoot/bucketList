//
//  BucketCell.swift
//  bucketList
//
//  Created by Gurpal Bhoot on 11/1/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class BucketCell: UITableViewCell {
    
    @IBOutlet weak var indexLbl: UILabel!
    @IBOutlet weak var bucketLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(index: Int, content: String) {
        indexLbl.text = "\(index)"
        bucketLbl.text = content
    }
}
