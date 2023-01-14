//
//  ChatViewModel.swift
//  iBrain
//
//  Created by Gabriel on 10/01/23.
//

import Foundation

protocol ChatViewModelProtocol {
    
    var messageList: [Message] { get set }
    
    func addNewConversation(conversation: Message)
    
}

class ChatViewModel: ChatViewModelProtocol {
    var messageList: [Message]
    
    init() {
        self.messageList = []
    }
    
    func addNewConversation(conversation: Message) {
        messageList.append(conversation)
    }

}
