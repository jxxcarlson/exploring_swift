//
//  ViewController.swift
//  universe01
//
//  Created by James Carlson on 6/15/15.
//  Copyright © 2015 James Carlson. All rights reserved.
//

/// http://www.raywenderlich.com/90488/calayer-in-ios-with-swift-10-examples
// Invocations: https://developer.apple.com/swift/blog/?id=19


import UIKit



class ViewController: UIViewController {
    
    let clockTick = 0.01
    let sideLength = 335.0
    let graphicsView = GraphicsView()
    
    let backgroundLabel = UILabel()
    let statusLabel = UILabel()

    
    func setupLabels() {
        
    
        let backgroundFrame = CGRect(x:0, y:0, width: 380, height: 640)
        backgroundLabel.frame = backgroundFrame
        print(backgroundLabel)
        backgroundLabel.backgroundColor = UIColor.blackColor()
        self.view.addSubview(backgroundLabel)
        
        
        let labelFrame = CGRect(x: 20, y: 375, width: 335, height: 50)
        statusLabel.frame = labelFrame
        statusLabel.font = UIFont(name: "Courier", size: 18)
        statusLabel.textColor = UIColor.whiteColor()
        self.view.addSubview(statusLabel)
        
        
    }
    
    func setupGraphicsViews() {
        
        self.view.addSubview(graphicsView)
        let graphicsFrame = CGRect(x: 20, y: 40, width: sideLength, height: sideLength)
        graphicsView.frame = graphicsFrame
        

    }
    
    
    func setupUniverse() {
        
        sharedUniverse.width = sideLength
        sharedUniverse.height = sideLength
        
        // Initialzie universe
        let obj1 = Particle(cx: 0, cy: 0, r: 60.0)
        obj1.color = UIColor(red:1.0, green:0.0, blue:0.0, alpha:0.5)
        obj1.x = -40
        let obj2 = Particle(cx: 0, cy: 0, r: 30.0)
        obj2.color = UIColor(red:0.0, green:0.5, blue:0.15, alpha:0.5)
        
        
        sharedUniverse.create(obj1)
        sharedUniverse.create(obj2)

    }
    
    func update() {
        
        sharedUniverse.step()
        statusLabel.text = sharedUniverse.status()
        graphicsView.setNeedsDisplay()
        
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        setupLabels()
        setupGraphicsViews()
        setupUniverse()
        
        var count = 0
        NSTimer.schedule(repeatInterval: clockTick) { timer in
            count++
            self.update()
            if count >= 1200000 {
                timer.invalidate()
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

