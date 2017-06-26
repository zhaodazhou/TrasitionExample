//
//  PresentViewController.swift
//  TrasitionExample
//
//  Created by dazhou on 2017/6/15.
//  Copyright © 2017年 dazhou. All rights reserved.
//

import UIKit

class PresentViewController: UIViewController, UINavigationControllerDelegate {
    
    var imageview : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        imageview = UIImageView(image: UIImage(named: "nice.jpeg"))
        imageview.frame = CGRect(x: 0, y: 100, width: 400, height: 200)
        self.view.addSubview(imageview)
        
        imageview.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(ViewController.handleTapGesture(sender:)))
        imageview.addGestureRecognizer(tapGesture)
    }
    
    
    func handleTapGesture(sender: UITapGestureRecognizer){
        self.dismiss(animated: true) { 
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}




