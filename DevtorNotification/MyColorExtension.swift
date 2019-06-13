//
//  MyColorExtension.swift
//  DevtorNotification
//
//  Created by Supakorn Thitivarangkool on 13/6/2562 BE.
//  Copyright © 2562 Feem.io. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static let kerryOrange = UIColor.init(hexString: "#FF7000")
    static let kerryOrangeDark = UIColor.init(hexString: "#CE5000")
    static let kerryGray   = UIColor.init(hexString: "#58595B")
    static let placeholder = UIColor.init(hexString: "#C8C8C8")
    static let textViewBorder = UIColor.init(hexString: "#E3E3E3")
    static let facebook = UIColor.init(hexString: "4267B2")
}

extension UIColor {
    
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
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
    
}

extension Data {
    var hexString: String {
        return map { String(format: "%02.2hhx", arguments: [$0]) }.joined()
    }
}
