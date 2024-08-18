//
//  ColorWheelTableViewCell.swift
//  SoundBrennerCodingChallenge-iOS
//
//  Created by Kantachat.Pua on 18/8/2567 BE.
//

import UIKit

class ColorWheelTableViewCell: UITableViewCell {

    @IBOutlet weak var colorWheel: ColorWheel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func setupUI() {
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
