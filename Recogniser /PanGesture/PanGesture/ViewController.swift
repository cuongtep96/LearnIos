//
//  ViewController.swift
//  PanGesture
//
//  Created by cuongdeptrai on 9/7/18.
//  Copyright © 2018 cuongdeptrai. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(onClickImageView))
        
        imgView.addGestureRecognizer(panGesture)
        let pinGesture = UIPinchGestureRecognizer(target: self, action: #selector(onClickPinch))
        imgView.addGestureRecognizer(pinGesture)
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(actionRotateGesture))
        imgView.addGestureRecognizer(rotateGesture)
        
        
        let directions: [UISwipeGestureRecognizer.Direction] = [.up , .down , .left , .right]
        
        for direction in directions {
            let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(actionSwipeGesture))
            swipeGesture.direction = direction
            imgView.addGestureRecognizer(swipeGesture)
        }
        
    
    }

    @objc func onClickImageView(recogizer: UIPanGestureRecognizer) {
        let translation = recogizer.translation(in: self.view)
        if let view = recogizer.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
            
        }
        
        recogizer.setTranslation(CGPoint.zero, in: self.view)
    }
    
    @objc func onClickPinch(recogizer: UIPinchGestureRecognizer) {
        if let view = recogizer.view {
            view.transform = view.transform.scaledBy(x: recogizer.scale, y: recogizer.scale)
            recogizer.scale = 1
            
        }
    }
    @objc func actionRotateGesture(recognizer: UIRotationGestureRecognizer) {
        if let view =  recognizer.view {
            view.transform = view.transform.rotated(by: recognizer.rotation)
            recognizer.rotation = 0
        }
        
    }
    
    @objc func actionSwipeGesture(recognizer: UISwipeGestureRecognizer) {
        switch recognizer.direction {
        case .up:
            print("Swipe up")
        case .down:
            print("Swipe down")
        case .left:
            print("Swipe left")
        case .right:
            print("Swipe Right")
            
        default:
            print("Default")
            
        }
    }
    
}

