//
//  ViewModel.swift
//  SoundBrennerCodingChallenge-iOS
//
//  Created by Kantachat.Pua on 18/8/2567 BE.
//

import Foundation

class ViewModel {
    var objects: MainComponentModel
    let colorWheelCellNib = "ColorWheelTableViewCell"
    let segmentControllerCellNib = "SegmentControllerTableViewCell"
    let brightnessAdjustCellNib = "BrightnessTableViewCell"
    
    let colorWheelCellIdentifier = Constants.MainComponentCellIdentifier.colorWheel
    let segmentControllerCellIdentifier = Constants.MainComponentCellIdentifier.segmentController
    let brightnessAdjustCellIdentifier = Constants.MainComponentCellIdentifier.brightnessAdjustment
    
    init(objects: MainComponentModel) {
        self.objects = objects
    }
    
    func requestMainComponents() {
        objects.component.append(.colorWheel)
        objects.component.append(.segmentController)
        objects.component.append(.brightnessAdjustment)
    }
    
    func getNumberOfRowInMainComponent() -> Int {
        return objects.component.count
    }
}
