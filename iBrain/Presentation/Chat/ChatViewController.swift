//
//  ViewController.swift
//  iBrain
//
//  Created by Gabriel on 09/01/23.
//

import UIKit

class ChatViewController: UIViewController {
    
    let service: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = ChatView()
        view.delegate = self
        view.viewModel = ChatViewModel()
        self.view = view
    }
    
}

extension ChatViewController: ChatViewDelegate {
    func sendMessage(message: String) {
        service.request(
            router: .completions(
            message: message)) {(
                result: Result<Conversation, Error>) in
                switch result {
                case .success(let success):
                    print(success)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
}
