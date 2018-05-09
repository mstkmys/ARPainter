//
//  ARObject.swift
//  ARPainter
//
//  Created by Miyoshi Masataka on 2018/05/09.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import Foundation
import ARKit

struct ARObject {
    
    // MARK: - Properties
    
    public var sceneView: ARSCNView
    
    // MARK: - Methods
    
    public func eraseNode(named nameToErase: String) {
        sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            if node.name == nameToErase {
                node.removeFromParentNode()
            }
        }
    }
    
    public static func createBrush(brushShape: BrushSettings.Shape, brushSize: CGFloat, position: SCNVector3) -> SCNNode {
        let minSize: CGFloat = 0.02
        let maxSize: CGFloat = 0.5
        let shapeSize = minSize + brushSize * (minSize + maxSize)
        let brush: SCNNode!
        switch brushShape {
        case .box:
            brush = SCNNode(geometry: SCNBox(width: shapeSize, height: shapeSize, length: shapeSize, chamferRadius: 0))
        case .capsule:
            brush = SCNNode(geometry: SCNCapsule(capRadius: shapeSize / 8, height: shapeSize))
            brush.eulerAngles = SCNVector3(0, 0, Double.pi / 2)
        case .cone:
            brush = SCNNode(geometry: SCNCone(topRadius: 0, bottomRadius: shapeSize / 8, height: shapeSize))
            brush.eulerAngles = SCNVector3(0, 0, Double.pi / 2)
        case .cylinder:
            brush = SCNNode(geometry: SCNCylinder(radius: shapeSize / 8, height: shapeSize))
            brush.eulerAngles = SCNVector3(0, 0, Double.pi / 2)
        case .pyramid:
            brush = SCNNode(geometry: SCNPyramid(width: shapeSize, height: shapeSize, length: shapeSize))
        case .sphere:
            brush = SCNNode(geometry: SCNSphere(radius: shapeSize / 2))
        case .torus:
            brush = SCNNode(geometry: SCNTorus(ringRadius: shapeSize / 2, pipeRadius: shapeSize / 8))
            brush.eulerAngles = SCNVector3(0, 0, Double.pi / 2)
        case .tube:
            brush = SCNNode(geometry: SCNTube(innerRadius: shapeSize / 10, outerRadius: shapeSize / 8, height: shapeSize))
            brush.eulerAngles = SCNVector3(0, 0, Double.pi / 2)
        }
        brush.position = position
        return brush
    }
    
}



























