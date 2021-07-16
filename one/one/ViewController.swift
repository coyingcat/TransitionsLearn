//
//  ViewController.swift
//  one
//
//  Created by Jz D on 2021/7/14.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {

    
    let customPresentionController = CustomPresentationController(direction: .right)
    
    let customDismissController = CustomDismissController(direction: .left)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.blue
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let toCtrl = segue.destination as UIViewController
        toCtrl.transitioningDelegate = self
        toCtrl.modalPresentationStyle = .overFullScreen
        
    }
    
    
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return customPresentionController
    }
    
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        
        return customDismissController
        
        
    }
}

