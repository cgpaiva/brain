//
//  ChatTableViewCell.swift
//  iBrain
//
//  Created by Gabriel on 10/01/23.
//

import Foundation
import UIKit

class ChatTableViewCell: UITableViewCell {
    
    var messageSenderLabel = UILabel()
    var messageReceiverLabel = UILabel()
    var messageType: MessageType = .none
    var message = String()
    
    var senderContainerView = UIView()
    var receiverContainerView = UIView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

extension ChatTableViewCell: ViewCodable {
    func configHierarchy() {
        if messageType == .sender {
            addSubview(senderContainerView)
            addSubview(messageSenderLabel)
        } else {
            addSubview(receiverContainerView)
            addSubview(messageReceiverLabel)
        }
        
    }
    
    func configConstraints() {
        
        if messageType == .sender {
            messageSenderLabel.snp.makeConstraints { make in
                make.top.equalTo(senderContainerView.snp.top).offset(30)
                make.bottom.equalTo(senderContainerView.snp.bottom).offset(-30)
                make.trailing.equalTo(senderContainerView.snp.trailing)
                make.leading.equalTo(senderContainerView.snp.leading)
            }
            
            senderContainerView.snp.makeConstraints { make in
                make.trailing.equalToSuperview()
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
                make.width.equalTo(200)
            }
        } else if messageType == .receiver {
            messageReceiverLabel.snp.makeConstraints { make in
                make.top.equalTo(receiverContainerView.snp.top).offset(30)
                make.bottom.equalTo(receiverContainerView.snp.bottom).offset(-30)
                make.trailing.equalTo(receiverContainerView.snp.trailing)
                make.leading.equalTo(receiverContainerView.snp.leading)
            }
            
            receiverContainerView.snp.makeConstraints { make in
                make.leading.equalToSuperview()
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
                make.width.equalTo(200)
            }
        }
        
   
    }
    
    func configViews() {
        
        messageSenderLabel.textColor = .black
        
        senderContainerView.layer.cornerRadius = 20
        senderContainerView.backgroundColor = .white
        
        receiverContainerView.layer.cornerRadius = 20
        receiverContainerView.backgroundColor = .white
        
        messageSenderLabel.numberOfLines = 0
        
    }
    
    func configureViewsText() {
        if messageType == .sender {
            messageSenderLabel.text = message
        } else  {
            messageReceiverLabel.text = message
        }
        
    }
    
    func configureActions() {
        
    }
    
    func render() {
        
    }
    
    
}
