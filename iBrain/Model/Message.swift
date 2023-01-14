//
//  Message.swift
//  iBrain
//
//  Created by Gabriel on 10/01/23.
//

import Foundation

struct Message {
    let messageType: MessageType
    let message: String
}

enum MessageType {
    case sender
    case receiver
    case none
}
