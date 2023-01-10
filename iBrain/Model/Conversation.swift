//
//  Conversation.swift
//  iBrain
//
//  Created by Gabriel on 09/01/23.
//

import Foundation

struct Conversation: Decodable {
    let id, object: String
    let created: Int
    let model: String
    let choices: [Choice]
    let usage: Usage

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case object = "object"
        case created = "created"
        case model = "model"
        case choices = "choices"
        case usage = "usage"
    }
}

struct Choice: Decodable {
    let text: String
    let index: Int
    let logprobs: String?
    let finishReason: String

    enum CodingKeys: String, CodingKey {
        case text = "text"
        case index = "index"
        case logprobs = "logprobs"
        case finishReason = "finish_reason"
    }
}

struct Usage: Decodable {
    let promptTokens, completionTokens, totalTokens: Int

    enum CodingKeys: String, CodingKey {
        case promptTokens = "prompt_tokens"
        case completionTokens = "completion_tokens"
        case totalTokens = "total_tokens"
    }
}
