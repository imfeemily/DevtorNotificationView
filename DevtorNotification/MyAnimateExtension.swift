//
//  MyAnimateExtension.swift
//  DevtorNotification
//
//  Created by Supakorn Thitivarangkool on 13/6/2562 BE.
//  Copyright © 2562 Feem.io. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
    func animateShow() {
        self.isHidden = false
        self.center.y -= self.bounds.height
        UIView.animate(withDuration: 0.25, delay: 0, options: [.curveEaseIn],
                       animations: {
                        self.center.y += self.bounds.height
                        self.layoutIfNeeded()
                        
        }, completion: nil)
    }
    
    func animateHide() {
        UIView.animate(withDuration: 0.25, delay: 0, options: [.curveLinear],
                       animations: {
                        self.center.y -= self.bounds.height
                        self.layoutIfNeeded()
                        
        },  completion: {(_ completed: Bool) -> Void in
            self.isHidden = true
        })
    }
    
    func fadeIn(_ duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: completion)  }
    
    func fadeOut(_ duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
        }, completion: completion)
    }
}

