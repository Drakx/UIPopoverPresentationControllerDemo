//
//  ViewController.swift
//  SwfitPopoverPresntationController
//
//  Created by Kai Windle on 26/10/2015.
//  Copyright © 2015 Kai Windle. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate, UpdatePresentingViewControllerWithData {

    @IBOutlet weak var lblSelectedItem: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - UIBarbutton event handler
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        let tableVC = self.storyboard?.instantiateViewControllerWithIdentifier("tableVC") as? TableViewController
        
        if let viewController = tableVC {
        
            viewController.modalPresentationStyle = UIModalPresentationStyle.Popover
            viewController.delegate = self
            
            let popPC = viewController.popoverPresentationController
            popPC?.barButtonItem = sender as? UIBarButtonItem
            popPC?.permittedArrowDirections = UIPopoverArrowDirection.Any
            popPC?.delegate = self
            
            self.presentViewController(viewController, animated: true, completion: nil)
        }
    }
    
    // MARK: - UpdatePresentingViewControllerWithData
    func updateViewWithSelectedData(selectedString: String) {
        
        self.lblSelectedItem.text = selectedString
//        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        
        return UIModalPresentationStyle.FullScreen
//        return UIModalPresentationStyle.None
    }

    func presentationController(controller: UIPresentationController, viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {
        
        let navController = UINavigationController(rootViewController: controller.presentedViewController)
        let barButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "barButtonDonePressed:")
        navController.topViewController?.navigationItem.rightBarButtonItem = barButton
        
        return navController
        
    }
    
    func barButtonDonePressed(sender: UIBarButtonItem) {
        
        print("button pressed")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

