//
//  ColorWheelTableViewCell.swift
//  SoundBrennerCodingChallenge-iOS
//
//  Created by Kantachat.Pua on 18/8/2567 BE.
//

import UIKit

protocol ColorPickerDelegate: AnyObject {
    func colorDidChange(color: UIColor)
}

class ColorWheelTableViewCell: UITableViewCell {
    @IBOutlet weak var colorWheel: ColorWheel!
    @IBOutlet weak var colorPicker: UIView!
    weak var delegate: ColorPickerDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    private func setupUI() {
        // setup handle
        colorPicker.layer.cornerRadius = colorPicker.frame.width/2
        colorPicker.layer.borderWidth = 2
        colorPicker.layer.borderColor = UIColor.white.cgColor
        colorPicker.layer.shadowColor = UIColor.black.cgColor
        colorPicker.layer.shadowOffset = CGSize(width: 0, height: 4)
        colorPicker.layer.shadowOpacity = 0.5
        colorPicker.layer.shadowRadius = 23
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.onPressColorWheel))
        self.colorWheel.addGestureRecognizer(tapGesture)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.onPanColorPicker))
        self.colorPicker.addGestureRecognizer(panGesture)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func onPressColorWheel(sender: UITapGestureRecognizer) {
        let point = sender.location(in: colorWheel)
        let color = colorWheel.colorAtPoint(point: point)
        colorPicker.backgroundColor = color
        colorPicker.layer.position = point
        delegate?.colorDidChange(color: color)
    }
    
    @objc func onPanColorPicker(sender: UIPanGestureRecognizer) {
        let point = sender.location(in: colorWheel)
        let color = colorWheel.colorAtPoint(point: point)
        delegate?.colorDidChange(color: color)
        colorPicker.backgroundColor = colorWheel.colorAtPoint(point: point)
        self.colorWheel.bringSubviewToFront(colorPicker)
        let translation = sender.translation(in: self.colorWheel)
        colorPicker.center = CGPoint(x: colorPicker.center.x + translation.x, y: colorPicker.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.colorWheel)
    }
    
}

extension ColorWheelTableViewCell: ColorWheelCellDelegate {
    func updateSelectedColor(color: UIColor) {
        if let point = colorWheel.pointFromColor(color: color) {
            colorPicker.layer.position = point
        }
    }
}
