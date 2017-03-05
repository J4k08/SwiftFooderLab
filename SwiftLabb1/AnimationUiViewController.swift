//
//  AnimationUiViewController.swift
//  SwiftLabb1
//
//  Created by Jakob Haglöf on 2017-02-27.
//  Copyright © 2017 Jakob Haglöf. All rights reserved.
//

import UIKit

class AnimationUiViewController: UIViewController {

    @IBOutlet weak var M: UILabel!
    @IBOutlet weak var A: UILabel!
    @IBOutlet weak var T: UILabel!
    @IBOutlet weak var S: UILabel!
    @IBOutlet weak var Ö: UILabel!
    @IBOutlet weak var K: UILabel!
    
    @IBOutlet weak var pressLabel: UILabel!
    @IBOutlet weak var theLabel: UILabel!
    @IBOutlet weak var screenLabel: UILabel!
    
    var dynamicAnimator : UIDynamicAnimator!
    var gravity : UIGravityBehavior!
    var collision : UICollisionBehavior!
    var push : UIPushBehavior!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pressLabel.alpha = 0
        pressLabel.text = "RYCK"
        theLabel.alpha = 0
        theLabel.text = "PÅ"
        screenLabel.alpha = 0
        screenLabel.text = "SKÄRMEN"
        
        M.center = CGPoint(x: -10, y: 235)
        A.center = CGPoint(x: -10, y: 220)
        T.center = CGPoint(x: -10, y: 250)
        
        topPartIntro()
    }
    
    func topPartIntro() {
        UIView.animate(withDuration: 4, animations: {
            self.M.center = CGPoint(x: 78, y: 235)
            self.A.center = CGPoint(x: 110, y: 235)
            self.T.center = CGPoint(x: 136, y: 235)
        }, completion: {
            finished in
            
            self.gravityPutOn()
            
        })
        
        fadeLabels()
        
    }
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        
        
        
    }
    func gravityPutOn() {
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [M,A,K, Ö])
        dynamicAnimator.addBehavior(gravity)
        
        collision = UICollisionBehavior(items: [M,A,S,Ö,K])
        collision.translatesReferenceBoundsIntoBoundary = true
        dynamicAnimator.addBehavior(collision)
        
    }
    
    func fadeLabels() {
        UIView.animate(withDuration: 7, animations: {
            self.pressLabel.alpha = 0.1
            self.theLabel.alpha = 0.1
            self.screenLabel.alpha = 0.1
        }, completion: {
            finished in
            UIView.animate(withDuration: 3, animations: {
            self.pressLabel.alpha = 1.0
            self.theLabel.alpha = 1.0
            self.screenLabel.alpha = 1.0
            })
        })
    }
}
