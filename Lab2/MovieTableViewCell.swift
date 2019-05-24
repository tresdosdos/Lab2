//
//  MovieTableViewCell.swift
//  Lab2
//
//  Created by Viachaslau on 5/24/19.
//  Copyright © 2019 tresdosdos. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setTitle(title: String?) {
        movieTitle.text = title
    }
    
}
