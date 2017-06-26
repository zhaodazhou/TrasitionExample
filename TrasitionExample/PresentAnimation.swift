//
//  PresentAnimation.swift
//  TrasitionExample
//
//  Created by dazhou on 2017/6/19.
//  Copyright © 2017年 dazhou. All rights reserved.
//

import UIKit

class PresentAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.8
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // 1. Get controllers from transition context
        let toVC = transitionContext .viewController(forKey: UITransitionContextViewControllerKey.to)
        
         // 2. Set init frame for toVC
        let finalFrame = transitionContext.finalFrame(for: toVC!)
        toVC?.view.frame = CGRect(x: finalFrame.origin.x, y: finalFrame.origin.y + finalFrame.size.height, width: finalFrame.size.width, height: finalFrame.size.height)
        
        // 3. Add toVC's view to containerView
        let containerView = transitionContext.containerView
        containerView.addSubview((toVC?.view)!)
        
         // 4. Do animate now
        let duration = transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.curveLinear, animations: {
            toVC?.view.frame = finalFrame
            
        }) { (true) in
            transitionContext.completeTransition(true)
        }
    }
}
