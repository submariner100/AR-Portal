//
//  ViewController.swift
//  AR-Portal
//
//  Created by Macbook on 03/10/2017.
//  Copyright © 2017 Chappy-App. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

	@IBOutlet weak var sceneView: ARSCNView!
	
	@IBOutlet weak var planeDetected: UILabel!
	let configuration = ARWorldTrackingConfiguration()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
		self.configuration.planeDetection = .horizontal
		self.sceneView.session.run(configuration)
		self.sceneView.delegate = self
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
		guard anchor is ARPlaneAnchor else {return}
		DispatchQueue.main.async {
			self.planeDetected.isHidden = false
		}
			DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
			self.planeDetected.isHidden = true
		}
	}

}

