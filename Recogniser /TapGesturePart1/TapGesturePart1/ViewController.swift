//
//  ViewController.swift
//  TapGesturePart1
//
//  Created by SHUBHAM AGARWAL on 09/07/18.
//  Copyright © 2018 SHUBHAM AGARWAL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageGesture = UITapGestureRecognizer(target: self, action: #selector(onTapImage))
        imageGesture.numberOfTapsRequired = 2
        imgView.addGestureRecognizer(imageGesture)
        
        let labelGesture = UITapGestureRecognizer(target: self, action: #selector(onTapLabel))
        lbl.addGestureRecognizer(labelGesture)
        
        let viewGesture = UITapGestureRecognizer(target: self, action: #selector(onTapView))
        self.view.addGestureRecognizer(viewGesture)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func onTapImage() {
        lbl.text = "Image Tapped"
    }
    
    @objc func onTapLabel() {
        lbl.text = "Label Tapped"
    }
    
    @objc func onTapView() {
        lbl.text = "View Tapped"
    }

}

