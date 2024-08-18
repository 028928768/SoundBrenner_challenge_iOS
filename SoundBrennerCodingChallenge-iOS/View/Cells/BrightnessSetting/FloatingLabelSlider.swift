//
//  FloatingLabelSlider.swift
//  SoundBrennerCodingChallenge-iOS
//
//  Created by Kantachat.Pua on 18/8/2567 BE.
//

import UIKit

class FloatingLabelSlider: UISlider {

    private let floatingLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        // Configure the floating label
        floatingLabel.textColor = .white
        floatingLabel.textAlignment = .center
        floatingLabel.font = UIFont.systemFont(ofSize: 16)
        
        // Add the floating label as a subview
        addSubview(floatingLabel)
        
        // Set initial label text
        updateLabelText()
        
        // Add target for value change
        addTarget(self, action: #selector(updateLabelPosition), for: .valueChanged)
    
    }
    
    @objc private func updateLabelPosition() {
        updateLabelText()
        
        let thumbRect = self.thumbRect(forBounds: bounds, trackRect: trackRect(forBounds: bounds), value: value)
        let thumbCenter = CGPoint(x: thumbRect.midX, y: thumbRect.minY)
        
        // Update label frame
        floatingLabel.sizeToFit()
        floatingLabel.frame.size = CGSize(width: max(30, floatingLabel.frame.width), height: floatingLabel.frame.height)
        floatingLabel.center = CGPoint(x: thumbCenter.x, y: thumbCenter.y - floatingLabel.frame.height / 2 - 5) // Adjust vertical position as needed
    }
    
    private func updateLabelText() {
        let brightness = Int(value)
        floatingLabel.text = "\(brightness)%"
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateLabelPosition()
    }
}
