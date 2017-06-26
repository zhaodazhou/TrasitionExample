//
//  DismissAnimation.swift
//  TrasitionExample
//
//  Created by dazhou on 2017/6/19.
//  Copyright © 2017年 dazhou. All rights reserved.
//

import UIKit

class DismissAnimation: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // 1. Get controllers from transition context
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let initFrame = transitionContext.initialFrame(for: fromVC!)
        
         // 2. Set init frame for fromVC
        let finalFrame = CGRect(x: initFrame.origin.x, y: initFrame.origin.y + initFrame.size.height, width: initFrame.size.width, height: initFrame.size.height)
        
        // 3. Add target view to the container, and move it to back.
        let containerView = transitionContext .containerView
        containerView .addSubview((toVC?.view)!)
        containerView .sendSubview(toBack: (toVC?.view)!)
        
        // 4. Do animate now
        let duration = transitionDuration(using: transitionContext)
        UIView .animate(withDuration: duration, animations: { 
            fromVC?.view.frame = finalFrame
        }) { (true) in
            transitionContext .completeTransition(!transitionContext .transitionWasCancelled)
        }
    }
}
