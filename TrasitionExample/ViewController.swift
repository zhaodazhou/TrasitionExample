//
//  ViewController.swift
//  TrasitionExample
//
//  Created by dazhou on 2017/6/15.
//  Copyright © 2017年 dazhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    var button : UIButton!
    
    var imageview : UIImageView!
    
    var presentAnimation : PresentAnimation!
    var disPresentAnimation : DismissAnimation!
    var transitionController : SwipeInteractiveTransition!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        button = UIButton();
        button.setTitle("click image pelase", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.sizeToFit()
        view.addSubview(button)
        button.frame = CGRect(x: 50, y: 100, width: 200, height: 50)
        
        
        
        imageview = UIImageView(image: UIImage(named: "nice.jpeg"))
        imageview.frame = CGRect(x: 100, y: 150, width: 100, height: 50)
        imageview.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(ViewController.handleTapGesture(sender:)))
        imageview.addGestureRecognizer(tapGesture)
        
        self.view.addSubview(imageview)
        
        
        presentAnimation = PresentAnimation()
        disPresentAnimation = DismissAnimation()
        transitionController = SwipeInteractiveTransition()
    }
    
   
    func handleTapGesture(sender: UITapGestureRecognizer){
        let presentCtl = PresentViewController()
        presentCtl.transitioningDelegate = self
        self.transitionController .wireToViewController(presentCtl)
        self.present(presentCtl, animated: true) {
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentAnimation
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return disPresentAnimation
    }
    
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
       
        return self.transitionController!.interacting ? self.transitionController : nil
        
    }
}

