//
//  CategoryTableViewCell.swift
//  custom_app
//
//  Created by Yifan Ning on 18/04/2018.
//  Copyright © 2018 Yifan Ning. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

  
    @IBOutlet weak var indexing: UILabel!
    @IBOutlet weak var sheetName: UILabel!
    @IBOutlet weak var authorName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
