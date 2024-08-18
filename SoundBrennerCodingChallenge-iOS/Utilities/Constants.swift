//
//  Constants.swift
//  SoundBrennerCodingChallenge-iOS
//
//  Created by Kantachat.Pua on 18/8/2567 BE.
//

import Foundation

class Constants {
    enum MainComponent {
        case colorWheel
        case segmentController
        case brightnessAdjustment
    }
    
    struct MainComponentCellIdentifier {
        static let colorWheel = "colorWheelTableViewCell_identifier"
        static let segmentController = "segmentCustomCell_identifier"
        static let brightnessAdjustment = "brightnessSettingCell_identifier"
    }
}
