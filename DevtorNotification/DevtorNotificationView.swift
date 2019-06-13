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
        
        var originTouchPoint: CGPoint = CGPoint(x: 0, y: 0)
        var consignmentNumber: String = ""
        
        @IBOutlet weak var imageViewIcon: UIImageView!{
            didSet {
                imageViewIcon.contentMode = .scaleAspectFit
            }
        }
        @IBOutlet weak var labelNotificationTitle: UILabel!{
            didSet {
                labelNotificationTitle.text = ""
                labelNotificationTitle.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
                labelNotificationTitle.textColor = UIColor.kerryGray
                labelNotificationTitle.sizeToFit()
                labelNotificationTitle.numberOfLines = 0
            }
        }
        @IBOutlet weak var labelNotificationMessage: UILabel!{
            didSet {
                labelNotificationMessage.text = ""
                labelNotificationMessage.font = UIFont.systemFont(ofSize: 14, weight: .regular)
                labelNotificationMessage.textColor = UIColor.kerryGray
            }
        }
        
        override func awakeFromNib() {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.isOpaque = false
            self.backgroundColor = UIColor.white
            self.isHidden = true
            self.alpha = 0
            UIView.animate(withDuration: 0.25, delay: 0, options: [.curveEaseIn],
                           animations: {
                            self.alpha = 1
                            
            }, completion: nil)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.animateShow()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                self.closeView()
            }
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
        
        func setupView(title: String, message: String, consignmentNumber: String) {
            labelNotificationTitle.text = title
            labelNotificationMessage.text = message
            self.consignmentNumber = consignmentNumber
            labelNotificationMessage.sizeToFit()
            labelNotificationTitle.sizeToFit()
            _ = UIViewPropertyAnimator(duration: 0.4, curve: .easeIn) {
                self.layoutIfNeeded()
            }
            
            NSLayoutConstraint.activate([
                
                self.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
                self.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
                self.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
                
                ])
            
        }
        
        func closeView() {
            UIView.animate(withDuration: 0.3, delay: 0, options: [.curveLinear],
                           animations: {
                            self.center.y -= self.bounds.height
                            self.layoutIfNeeded()
                            
            },  completion: {(_ completed: Bool) -> Void in
                self.isHidden = true
                self.removeFromSuperview()
            })
        }
        
        @IBAction func viewNotificationTapped(_ sender: Any) {
            self.closeView()
        }
        
        @IBAction func backgroundTapped(_ sender: Any) {
            closeView()
        }
        
        @IBAction func onViewNotificationPanGesture(_ sender: UIPanGestureRecognizer) {
            let touchPoint = sender.location(in: self.window)
            switch sender.state {
            case .began:
                originTouchPoint = touchPoint
            case .changed:
                if touchPoint.y - originTouchPoint.y < 0 {
                    self.frame = CGRect(x: 0, y: touchPoint.y - originTouchPoint.y, width: self.frame.width, height: self.frame.height)
                }
            case .ended, .cancelled:
                if touchPoint.y - originTouchPoint.y < 100 {
                    UIView.animate(withDuration: 0.3, delay: 0, options: [.curveLinear],
                                   animations: {
                                    self.center.y -= self.bounds.height
                                    self.layoutIfNeeded()
                                    self.alpha = 0
                    },  completion: {(_ completed: Bool) -> Void in
                        self.removeFromSuperview()
                    })
                }else{
                    UIView.animate(withDuration: 0.3) {
                        self.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
                    }
                }
            default:
                break
            }
        }
    
}
