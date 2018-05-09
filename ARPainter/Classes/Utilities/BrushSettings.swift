//
//  BrushSettings.swift
//  ARPainter
//
//  Created by Miyoshi Masataka on 2018/05/09.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import Foundation
import UIKit

class BrushSettings {
    
    enum Shape {
        case box
        case capsule
        case cone
        case cylinder
        case pyramid
        case sphere
        case torus
        case tube
    }
    
    public var color: UIColor = .orange
    public var shape: Shape = .box
    public var size: CGFloat = 0.5
    public var isSpnning: Bool = false
    
}





















