//
//  IBrainRouter.swift
//  iBrain
//
//  Created by Gabriel on 09/01/23.
//

import Foundation
import Alamofire

enum Router {
    
    case completions(message: String)
    
    var url: String {
        switch self {
        case .completions:
            return "https://api.openai.com/v1/completions"
        }
    }

    var params: [String : Any]? {
        switch self {
        case .completions(let message):
            return [
                "model": "text-davinci-003",
                "prompt": message,
                "max_tokens": 4000,
                "temperature": 0.5
            ]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .completions:
            return .post
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .completions:
            return [
                "Authorization": "Bearer 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",
            ]
        }
    }
    
}
