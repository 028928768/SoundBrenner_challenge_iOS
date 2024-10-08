//
//  UIColorExtension.swift
//  SoundBrennerCodingChallenge-iOS
//
//  Created by Kantachat.Pua on 18/8/2567 BE.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    class var sbnBasicDarkGrey: UIColor {
        return UIColor(hex: "#1a1a1a")
    }
    
    class var sbnElementBackgroundGrey: UIColor {
        return UIColor(hex: "#2c2c2c")
    }
    
    class var sbnElementHighlgihtGray: UIColor {
        return UIColor(hex: "#3b3b3b")
    }
    
    class var sbnTeal: UIColor {
        return UIColor(hex: "#00c2a3")
    }
    
    class var sbnGreen: UIColor {
        return UIColor(hex: "#4ba54f")
    }
    
    class var sbnOrange: UIColor {
        return UIColor(hex: "#ff6100")
    }
}
