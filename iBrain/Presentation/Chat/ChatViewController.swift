//
//  ViewController.swift
//  iBrain
//
//  Created by Gabriel on 09/01/23.
//

import UIKit

class ChatViewController: UIViewController {
    
    let service: NetworkServiceProtocol
    let viewModel: ChatViewModelProtocol
    var theView: ChatView?
    
    init(service: NetworkServiceProtocol, viewModel: ChatViewModelProtocol) {
        self.service = service
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = ChatView()
        view.delegate = self
        view.viewModel = viewModel
        view.messageTableView.dataSource = self
        self.theView = view
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.registerForKeyboardNotifications()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.view.unregisterForKeyboardNotifications()
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
                    let cleanedResponse = success.choices[0].text.trimmingCharacters(in: .whitespacesAndNewlines)
                    self.viewModel.addNewConversation(conversation: Message(messageType: .receiver, message: cleanedResponse))
                    self.theView?.messageTableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
    }
    
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.messageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = theView?.messageTableView.dequeueReusableCell(withIdentifier: "message", for: indexPath) as? ChatTableViewCell
        cell?.message = viewModel.messageList[indexPath.row].message
        cell?.backgroundColor = .clear
        
        cell?.messageType = viewModel.messageList[indexPath.row].messageType
        
        cell?.setupView()
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
