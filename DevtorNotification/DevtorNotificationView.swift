//
//  DevtorNotificationView.swift
//  DevtorNotification
//
//  Created by Supakorn Thitivarangkool on 11/6/2562 BE.
//  Copyright © 2562 Feem.io. All rights reserved.
//

import Foundation
import UIKit

class DevtorNotificationView: UIView {
    
    let colors : [UIColor] = [.red, .orange, .yellow, .green, .blue, .purple]
    var colorCounter = 0
    /*
     This method will be called when a frame is passed to the constructor of DevtorNotificationView.
     Will customize properties here.
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let scheduledColorChanged = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { (timer) in
            UIView.animate(withDuration: 2.0) {
                self.layer.backgroundColor = self.colors[self.colorCounter % 6].cgColor
                self.colorCounter+=1
            }
        }
        scheduledColorChanged.fire()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let scheduledColorChanged = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { (timer) in
            UIView.animate(withDuration: 2.0) {
                self.layer.backgroundColor = self.colors[self.colorCounter % 6].cgColor
                self.colorCounter+=1
            }
        }
        scheduledColorChanged.fire()
    }
}
