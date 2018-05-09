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
        
        // delegate
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
    
}

















