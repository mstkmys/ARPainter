//
//  ShapeListItem.swift
//  ARPainter
//
//  Created by Miyoshi Masataka on 2018/05/09.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import Foundation
import UIKit

struct ShapeListItem {
    
    public let name: String
    public let shape: BrushSettings.Shape
    
    public static var shapes: [ShapeListItem] {
        return [
            ShapeListItem(name: "Box", shape: .box),
            ShapeListItem(name: "Capsule", shape: .capsule),
            ShapeListItem(name: "Cone", shape: .cone),
            ShapeListItem(name: "Cylinder", shape: .cylinder),
            ShapeListItem(name: "Pyramid", shape: .pyramid),
            ShapeListItem(name: "Sphere", shape: .sphere),
            ShapeListItem(name: "Torus", shape: .torus),
            ShapeListItem(name: "Tube", shape: .tube)
        ]
    }
    
}

























