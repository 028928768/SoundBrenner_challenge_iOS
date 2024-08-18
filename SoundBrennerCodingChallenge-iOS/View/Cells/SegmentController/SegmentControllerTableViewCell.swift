//
//  SegmentControllerTableViewCell.swift
//  SoundBrennerCodingChallenge-iOS
//
//  Created by Kantachat.Pua on 18/8/2567 BE.
//

import UIKit

class SegmentControllerTableViewCell: UITableViewCell {
    @IBOutlet weak var segmentStackView: UIStackView!
    
    @IBOutlet weak var segmentBlueView: HighlightButton!
    @IBOutlet weak var segmentBlueCircleView: UIView!
    
    @IBOutlet weak var segmentGreenView: HighlightButton!
    @IBOutlet weak var segmentGreenCircleView: UIView!
    
    @IBOutlet weak var segmentRedView: HighlightButton!
    @IBOutlet weak var segmentRedCircleView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    private func setupUI() {
        // render circle colour views
        segmentBlueCircleView.circularise()
        segmentGreenCircleView.circularise()
        segmentRedCircleView.circularise()
        
        segmentBlueView.normalBackgroundColor = UIColor.sbnElementBackgroundGrey
        segmentBlueView.highlightedBackgroundColor = UIColor.sbnElementHighlgihtGray
        
        segmentGreenView.normalBackgroundColor = UIColor.sbnElementBackgroundGrey
        segmentGreenView.highlightedBackgroundColor = UIColor.sbnElementHighlgihtGray
        
        segmentRedView.normalBackgroundColor =  UIColor.sbnElementBackgroundGrey
        segmentRedView.highlightedBackgroundColor = UIColor.sbnElementHighlgihtGray
        
        segmentBlueCircleView.backgroundColor = UIColor.sbnTeal
        segmentGreenCircleView.backgroundColor = UIColor.sbnGreen
        segmentRedCircleView.backgroundColor = UIColor.sbnOrange
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
