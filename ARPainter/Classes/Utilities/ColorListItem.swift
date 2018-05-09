//
//  ColorListItem.swift
//  ARPainter
//
//  Created by Miyoshi Masataka on 2018/05/09.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import Foundation
import UIKit

struct ColorListItem {
    
    public let name: String
    public let color: UIColor
    
    public static var colors: [ColorListItem] {
        return [
            ColorListItem(name: "Orange", color: .orange),
            ColorListItem(name: "Blue", color: .blue),
            ColorListItem(name: "Purple", color: .purple),
            ColorListItem(name: "Green", color: .green),
            ColorListItem(name: "White", color: .white),
            ColorListItem(name: "Brown", color: .brown),
            ColorListItem(name: "Red", color: .red),
        ]
    }
    
}
























