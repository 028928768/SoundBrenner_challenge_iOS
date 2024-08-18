//
//  HighlightButton.swift
//  SoundBrennerCodingChallenge-iOS
//
//  Created by Kantachat.Pua on 18/8/2567 BE.
//

import Foundation
import UIKit

class HighlightButton: UIButton {
    @IBInspectable var normalBackgroundColor: UIColor? {
        didSet {
            backgroundColor = normalBackgroundColor
        }
    }
    @IBInspectable var highlightedBackgroundColor: UIColor?
    var highlightDuration: TimeInterval = 0.5
    
    override var isHighlighted: Bool {
        didSet {
            if oldValue == false && isHighlighted {
                // set highlight state
                hightlight()
            } else if oldValue == true && !isHighlighted {
                // set unhightlight state
                unhighlight()
            }
        }
    }
    
    func hightlight() {
        // animate changes for highlighting state
        animateBackground(to: highlightedBackgroundColor, duration: highlightDuration)
    }
    
    func unhighlight() {
        // animate changes for unhighlighting state
        animateBackground(to: normalBackgroundColor, duration: highlightDuration)
    }
    
    private func animateBackground(to color: UIColor?, duration: TimeInterval) {
        guard let color = color else { return }
        UIView.animate(withDuration: highlightDuration, animations: {
            self.backgroundColor = color
        })
    }
}
