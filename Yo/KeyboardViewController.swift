//
//  KeyboardViewController.swift
//  Yo
//
//  Created by Cameron Nottingham on 6/19/14.
//  Copyright (c) 2014 Cameron Nottingham. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    
    @IBOutlet var nextKeyboardButton: UIButton
    @IBOutlet var yoButton: UIButton
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton.buttonWithType(.System) as UIButton
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.nextKeyboardButton.titleLabel.font = UIFont(name: "Helvetica", size: 10)
        
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        var nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
        var nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
        
        // Yo button
        
        self.yoButton = UIButton.buttonWithType(.System) as UIButton
        
        self.yoButton.setTitle(NSLocalizedString("Yo", comment: "Yo button"), forState: .Normal)
        self.yoButton.sizeToFit()
        self.yoButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.yoButton.titleLabel.font = UIFont(name: "Helvetica", size: 50)
        
        self.yoButton.addTarget(self, action: "yo", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.yoButton)
        
        var yoButtonCenterXConstraint = NSLayoutConstraint(item: self.yoButton, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
        var yoButtonCenterYConstraint = NSLayoutConstraint(item: self.yoButton, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([yoButtonCenterXConstraint, yoButtonCenterYConstraint])
    }
    
    func yo() {
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        proxy.insertText("Yo ")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(textInput: UITextInput) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(textInput: UITextInput) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
        self.yoButton.setTitleColor(textColor, forState: .Normal)
    }
    
}

