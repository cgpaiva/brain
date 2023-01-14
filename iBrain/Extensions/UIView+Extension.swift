//
//  UIView+Extensions.swift
//  iBrain
//
//  Created by Gabriel on 13/01/23.
//

import Foundation
import UIKit

extension UIView {
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unregisterForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else {return}
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardFrame = keyboardSize.cgRectValue
        if self.findFirstResponder() is UITextField || self.findFirstResponder() is UITextView {
            self.frame.origin.y = -keyboardFrame.height
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.findFirstResponder() is UITextField || self.findFirstResponder() is UITextView {
            self.frame.origin.y = 0
        }
    }
    
    private func findFirstResponder() -> UIView? {
        if self.isFirstResponder {
            return self
        }
        
        for subView in self.subviews {
            if let firstResponder = subView.findFirstResponder() {
                return firstResponder
            }
        }
        return nil
    }
}

