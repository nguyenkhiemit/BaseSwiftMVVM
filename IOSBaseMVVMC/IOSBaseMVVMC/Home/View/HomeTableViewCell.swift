//
//  HomeTableViewCell.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/7/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {
    
    static let CellIdentifier = "HomeTableViewCell"
    
    @IBOutlet weak var bookingImageView: UIImageView!
    
    @IBOutlet weak var bookingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bindData(booking: Booking) {
        let url = URL(string: BASE_IMAGE_URL + booking.image!)
        bookingImageView.kf.setImage(with: url)
        
        bookingLabel.text = booking.name
    }

}
