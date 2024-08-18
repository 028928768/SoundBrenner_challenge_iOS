//
//  BrightnessTableViewCell.swift
//  SoundBrennerCodingChallenge-iOS
//
//  Created by Kantachat.Pua on 18/8/2567 BE.
//

import UIKit

class BrightnessTableViewCell: UITableViewCell {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var contentStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    private func setupUI() {
        // setup View
        mainView.backgroundColor = UIColor.sbnElementBackgroundGrey
        
        // setup Slider
        let slider = FloatingLabelSlider(frame: CGRect(x: 20, y: 100, width: 280, height: 40))
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        slider.tintColor = .white
        contentStackView.addArrangedSubview(slider)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
