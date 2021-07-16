//
//  CustomPresentationController.swift
//  one
//
//  Created by Jz D on 2021/7/14.
//

import Foundation

import UIKit


enum PresentingDirection{
    case top, right, left, bottom
    
    var bounds: CGRect{
        UIScreen.main.bounds
    }
    
    func offsetF(withFrame viewFrame: CGRect) -> CGRect{
        let h = bounds.size.height
        let w = bounds.size.width
        switch self {
        case .top:
            return viewFrame.offsetBy(dx: 0, dy: -h)
        case .bottom:
            return viewFrame.offsetBy(dx: 0, dy: h)
        case .left:
            return viewFrame.offsetBy(dx: -w, dy: 0)
            
        case .right:
            return viewFrame.offsetBy(dx: w, dy: 0)
            
        }
        
    }
}


class CustomPresentationController: NSObject, UIViewControllerAnimatedTransitioning{
    
    
    fileprivate var presentingDirection: PresentingDirection
    
    
    init(direction orientation: PresentingDirection) {
        presentingDirection = orientation
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromCtrl = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
              let toCtrl = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else{
            return
        }
         
        let finalCtrlFrame = transitionContext.finalFrame(for: toCtrl)
        let containerView = transitionContext.containerView
        
        toCtrl.view.frame = presentingDirection.offsetF(withFrame: finalCtrlFrame)
        containerView.addSubview(toCtrl.view)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: .curveLinear) {
            fromCtrl.view.alpha = 0.5
            toCtrl.view.frame = finalCtrlFrame
        } completion: { _ in
            fromCtrl.view.alpha = 1
            transitionContext.completeTransition(true)
        }
    }
}




class CustomDismissController: NSObject, UIViewControllerAnimatedTransitioning{
    
    
    fileprivate var presentingDirection: PresentingDirection
    
    
    init(direction orientation: PresentingDirection) {
        presentingDirection = orientation
    }
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    
    
    
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromCtrl = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
              let toCtrl = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to), let toView = toCtrl.view else{
            return
        }
        
        let finalCtrlFrame = transitionContext.finalFrame(for: fromCtrl)
        let containerView = transitionContext.containerView
        fromCtrl.view.alpha = 0.5
        toView.frame = presentingDirection.offsetF(withFrame: finalCtrlFrame)
    

        containerView.bringSubviewToFront(toView)
  
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: .curveLinear) {
            toView.frame = finalCtrlFrame
       
        } completion: { _ in
            let success = !transitionContext.transitionWasCancelled
            transitionContext.completeTransition(success)
        }
    }
}







class CustomDismissControllerError: NSObject, UIViewControllerAnimatedTransitioning{
    
    
    fileprivate var presentingDirection: PresentingDirection
    
    
    init(direction orientation: PresentingDirection) {
        presentingDirection = orientation
    }
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    
    
    
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromCtrl = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
              let toCtrl = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to), let toView = toCtrl.view, let snapshot = fromCtrl.view.snapshotView(afterScreenUpdates: false) else{
            return
        }
        
        let finalCtrlFrame = transitionContext.finalFrame(for: fromCtrl)
        let containerView = transitionContext.containerView
        fromCtrl.view.isHidden = true
        snapshot.frame = finalCtrlFrame
        containerView.addSubview(snapshot)
        toView.frame = presentingDirection.offsetF(withFrame: finalCtrlFrame)
    

        containerView.bringSubviewToFront(toView)
  
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: .curveLinear) {
            toView.frame = finalCtrlFrame
       
        } completion: { _ in
            let success = !transitionContext.transitionWasCancelled
            transitionContext.completeTransition(success)
        }

    }
    
    
    
    
    
    
    
    
    
    
}
