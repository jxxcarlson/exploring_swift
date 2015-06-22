//
//  ViewController.swift
//  IOSGraphicsApp
//
//  Created by James Carlson on 6/21/15.
//  Copyright © 2015 James Carlson. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    let graphicsView = GraphicsView()
    let backgroundLabel = UILabel()
    let statusLabel = UILabel()
    
    func setupLabels() {
        
        // Background label
        let backgroundFrame = CGRect(x:0, y:0, width: 380, height: 640)
        backgroundLabel.frame = backgroundFrame
        let g: CGFloat = 0.2
        backgroundLabel.backgroundColor = UIColor(red: g, green: g, blue: g, alpha: 1.0)
        self.view.addSubview(backgroundLabel)
        
        
        // Status label
        let labelFrame = CGRect(x: 20, y: 395, width: 335, height: 50)
        statusLabel.frame = labelFrame
        statusLabel.font = UIFont(name: "Courier", size: 18)
        statusLabel.textColor = UIColor.whiteColor()
        statusLabel.backgroundColor = UIColor.blackColor()
        self.view.addSubview(statusLabel)
        statusLabel.text = " Welcome!"
        
    }
    
    
    func setupGraphicsView() {
        
        self.view.addSubview(graphicsView)
        let graphicsFrame = CGRect(x: 20, y: 40, width: 330, height: 330)
        graphicsView.frame = graphicsFrame
        
        
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupLabels()
        setupGraphicsView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }


}

