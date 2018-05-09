//
//  PaintViewController.swift
//  ARPainter
//
//  Created by Miyoshi Masataka on 2018/05/09.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import UIKit
import ARKit

class PaintViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var scnView: ARSCNView!
    @IBOutlet weak var paintButton: UIButton!
    
    internal var brushSettings: BrushSettings!
    private let configuration = ARWorldTrackingConfiguration()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let rootTabBarController = self.tabBarController as! RootTabBaViewController
        brushSettings = rootTabBarController.burushSettings
        scnView.delegate = self
        scnView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        scnView.showsStatistics = false
        scnView.autoenablesDefaultLighting = true
        scnView.session.run(configuration)
    }
    
    // MARK: - Actions
    
    @IBAction func paintButtonTapped(_ sender: UIButton) {
    }
    
}

// MARK: - ARSCNViewDelgate
/*******************************************************************************************/
extension PaintViewController: ARSCNViewDelegate {
    
    func renderer(_ renderer: SCNSceneRenderer, willRenderScene scene: SCNScene, atTime time: TimeInterval) {
        guard let pointOfView = scnView.pointOfView else { return }
        let transform = pointOfView.transform
        let orientation = SCNVector3(-transform.m31, -transform.m32, -transform.m33)
        let location = SCNVector3(transform.m41, transform.m42, transform.m43)
        let position = location + orientation
        DispatchQueue.main.async {
            let brush = ARObject.createBrush(
                brushShape: self.brushSettings.shape,
                brushSize: self.brushSettings.size,
                position: position
            )
            let arObject = ARObject(sceneView: self.scnView)
            arObject.eraseNode(named: "cursor")
            if self.paintButton.isHighlighted {
                brush.geometry?.firstMaterial?.diffuse.contents = self.brushSettings.color
                brush.geometry?.firstMaterial?.specular.contents = UIColor.white
                if self.brushSettings.isSpnning {
                    let rotateAction = SCNAction.rotate(by: 2 * .pi, around: SCNVector3(0, 1, 0), duration: 2)
                    let rotateForeverAction = SCNAction.repeatForever(rotateAction)
                    brush.runAction(rotateForeverAction)
                }
            } else {
                brush.geometry?.firstMaterial?.diffuse.contents = UIColor.gray
                brush.name = "cursor"
            }
            self.scnView.scene.rootNode.addChildNode(brush)
        }
    }
    
}

func +(left: SCNVector3, right: SCNVector3) -> SCNVector3 {
    return SCNVector3(left.x + right.x,
                      left.y + right.y,
                      left.z + right.z)
}


















