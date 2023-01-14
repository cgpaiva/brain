//
//  ChatView.swift
//  iBrain
//
//  Created by Gabriel on 10/01/23.
//

import Foundation
import UIKit
import SnapKit


protocol ChatViewDelegate {
    func sendMessage(message: String)
}

class ChatView: UIView {
    
    let sendMessageContainer: UIView
    let messageTextField: UITextField
    let sendMessageButton: UIButton
    let messageTableView: UITableView
    
    var delegate: ChatViewDelegate?
    
    var viewModel: ChatViewModelProtocol? {
        didSet {
            setupView()
        }
    }
    
    init() {
        sendMessageContainer = UIView()
        messageTextField = UITextField()
        sendMessageButton = UIButton()
        messageTableView = UITableView()
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func sendMessageTapped() {
        delegate?.sendMessage(message: messageTextField.text ?? String())
        viewModel?.addNewConversation(conversation: Message(messageType: .sender, message: messageTextField.text ?? String()))
        messageTableView.reloadData()
    }
    
    
}

extension ChatView: ViewCodable {
    func configHierarchy() {
        
        sendMessageContainer.addSubview(messageTextField)
        sendMessageContainer.addSubview(sendMessageButton)
        addSubview(sendMessageContainer)
        addSubview(messageTableView)
        
    }
    
    func configConstraints() {
        sendMessageContainer.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(100)
        }
        
        messageTextField.snp.makeConstraints { make in
            make.leading.equalTo(sendMessageContainer.snp.leading)
            make.top.equalTo(sendMessageContainer.snp.top)
            make.bottom.equalTo(sendMessageContainer.snp.bottom)
            make.trailing.equalTo(sendMessageButton.snp.leading)
            make.height.equalTo(40)
        }
        
        sendMessageButton.snp.makeConstraints { make in
            make.trailing.equalTo(sendMessageContainer.snp.trailing)
            make.centerY.equalTo(sendMessageContainer.snp.centerY)
            make.width.equalTo(100)
        }
        
        messageTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(sendMessageContainer.snp.top)
        }
    }
    
    func configViews() {
        sendMessageContainer.backgroundColor = .red
        backgroundColor = .white
        messageTextField.backgroundColor = .blue
        messageTableView.backgroundColor = .brown
        messageTableView.allowsSelection = false
        messageTableView.separatorStyle = .none
        messageTableView.register(ChatTableViewCell.self, forCellReuseIdentifier: "message")
        
    }
    
    func configureViewsText() {
        sendMessageButton.setTitle("Enviar", for: .normal)
    }
    
    func configureActions() {
        sendMessageButton.addTarget(self, action: #selector(sendMessageTapped), for: .touchUpInside)
    }
    
    func render() {
        
    }
}
