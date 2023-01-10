//
//  ChatView.swift
//  iBrain
//
//  Created by Gabriel on 10/01/23.
//

import Foundation
import UIKit


protocol ChatViewDelegate {
    func sendMessage(message: String)
}

class ChatView: UIView {
    
    var delegate: ChatViewDelegate?
    
    var viewModel: ChatViewModelProtocol? {
        didSet {
            setupView()
        }
    }
    
}

extension ChatView: ViewCodable {
    func configHierarchy() {
        
    }
    
    func configConstraints() {
        
    }
    
    func configViews() {
        backgroundColor = .white
        
    }
    
    func configureViewsText() {
        
    }
    
    func configureActions() {
        
    }
    
    func render() {
        
    }
    
    
}
