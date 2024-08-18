//
//  SegmentControllerTableViewCell.swift
//  SoundBrennerCodingChallenge-iOS
//
//  Created by Kantachat.Pua on 18/8/2567 BE.
//

import UIKit

protocol SegmentCustomButtonDelegate: AnyObject {
    func didTappedColorButton(color: UIColor)
}

class SegmentControllerTableViewCell: UITableViewCell {
    @IBOutlet weak var segmentStackView: UIStackView!
    
    @IBOutlet weak var segmentBlueView: HighlightButton!
    @IBOutlet weak var segmentBlueCircleView: UIView!
    
    @IBOutlet weak var segmentGreenView: HighlightButton!
    @IBOutlet weak var segmentGreenCircleView: UIView!
    
    @IBOutlet weak var segmentRedView: HighlightButton!
    @IBOutlet weak var segmentRedCircleView: UIView!
    weak var delegate: SegmentCustomButtonDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    private func setupUI() {
        // render circle color views
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
        
        let tapBlueGesture = UITapGestureRecognizer(target: self, action: #selector(self.onPressBlueCircleView))
        self.segmentBlueCircleView.addGestureRecognizer(tapBlueGesture)
        
        let tapGreenGesture = UITapGestureRecognizer(target: self, action: #selector(self.onPressGreenCircleView))
        self.segmentGreenCircleView.addGestureRecognizer(tapGreenGesture)
        
        let tapRedGesture = UITapGestureRecognizer(target: self, action: #selector(self.onPressRedCircleView))
        self.segmentRedCircleView.addGestureRecognizer(tapRedGesture)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - actions
    @IBAction func didTapBlueButton(_ sender: Any) {
        if let color = segmentBlueCircleView.backgroundColor {
            delegate?.didTappedColorButton(color: color)
        }
    }
    
    @IBAction func didTapGreenButton(_ sender: Any) {
        if let color = segmentGreenCircleView.backgroundColor {
            delegate?.didTappedColorButton(color: color)
        }
    }
    
    @IBAction func didTapRedButton(_ sender: Any) {
        if let color = segmentRedCircleView.backgroundColor {
            delegate?.didTappedColorButton(color: color)
        }
    }
    
    @objc func onPressBlueCircleView(sender: UITapGestureRecognizer) {
        if let color = segmentBlueCircleView.backgroundColor {
            delegate?.didTappedColorButton(color: color)
        }
    }
    
    @objc func onPressGreenCircleView(sender: UITapGestureRecognizer) {
        if let color = segmentGreenCircleView.backgroundColor {
            delegate?.didTappedColorButton(color: color)
        }
    }
    
    @objc func onPressRedCircleView(sender: UITapGestureRecognizer) {
        if let color = segmentRedCircleView.backgroundColor {
            delegate?.didTappedColorButton(color: color)
        }
    }
    
    
}

extension SegmentControllerTableViewCell: SegmentControllerCellDelegate {
    func updateSelectedColor(color: UIColor) {
        // get color components
        let ciColor = CIColor(color: color)
        let alpha = ciColor.alpha
        let red = ciColor.red
        let green = ciColor.green
        let blue = ciColor.blue
        // blue
        segmentBlueCircleView.backgroundColor = UIColor(red: 0, green: 0, blue: blue, alpha: alpha)
        // green
        segmentGreenCircleView.backgroundColor = UIColor(red: 0, green: green, blue: 0, alpha: alpha)
        // red
        segmentRedCircleView.backgroundColor = UIColor(red: red, green: 0, blue: 0, alpha: alpha)
    }
}
