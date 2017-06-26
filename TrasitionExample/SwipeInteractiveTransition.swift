//
//  SwipeInteractiveTransition.swift
//  TrasitionExample
//
//  Created by dazhou on 2017/6/19.
//  Copyright © 2017年 dazhou. All rights reserved.
//

import UIKit

class SwipeInteractiveTransition: UIPercentDrivenInteractiveTransition {
    
    public var interacting = false
    var presentingVC : UIViewController!
    var shouldComplete : Bool?
    
    public func wireToViewController(_ viewController:UIViewController) -> Void {
        self.presentingVC = viewController
        prepareGestureRecognizerInView(viewController.view)
    }

    func prepareGestureRecognizerInView(_ view : UIView) -> Void {
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(SwipeInteractiveTransition.handleGesture(sender:)))
        view.addGestureRecognizer(gesture)
        
    }
    
   
    
    func handleGesture(sender : UIPanGestureRecognizer) -> Void {
        let translation = sender.translation(in: sender.view?.superview)
        
        switch sender.state {
        case .began:
            // 1. Mark the interacting flag. Used when supplying it in delegate.
            self.interacting = true
            self.presentingVC.dismiss(animated: true, completion: nil)
            break
 
        case .changed:
            // 2. Calculate the percentage of guesture
            var fraction = translation.y / 400.0
            //Limit it between 0 and 1
            fraction = CGFloat(fminf(fmaxf(Float(fraction), 0.0), 1.0))
            self.shouldComplete = fraction > 0.5
            update(fraction)
            break
            
        case .ended,
             .cancelled:
             // 3. Gesture over. Check if the transition should happen or not
            self.interacting = false
            if !self.shouldComplete! || sender.state == .cancelled {
                cancel()
            }
            else {
                finish()
            }
            
            break
            
        default:
            break
        }
        
    }
}




















