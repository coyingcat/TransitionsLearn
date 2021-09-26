//
//  AnimatePush.swift
//  two
//
//  Created by Jz D on 2021/9/26.
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





class NavBaseCustomAnimatorPush: NSObject, UIViewControllerAnimatedTransitioning{
    
    fileprivate var presentingDirection: PresentingDirection
    
    
    init(direction orientation: PresentingDirection) {
        presentingDirection = orientation
    }
    
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

         guard let fromCtrl = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
               let toCtrl = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to), let fromView = fromCtrl.view, let toView = toCtrl.view else{
             return
         }
         
        
        let containerView = transitionContext.containerView
        let f = UIScreen.main.bounds
        
        fromView.frame = f

        containerView.addSubview(fromView)
        containerView.addSubview(toView)
        
        toView.frame = presentingDirection.offsetF(withFrame: f)
        
         UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: .curveLinear) {
             toView.frame = f
         } completion: { _ in
             let success = !transitionContext.transitionWasCancelled
             transitionContext.completeTransition(success)
         }
     }
    
}
