//
//  ViewController.swift
//  ChatList
//
//  Created by Greg Alton on 1/1/19.
//  Copyright © 2019 Greg Alton. All rights reserved.
//

import UIKit

struct ChatMessage {
    let text: String
    let isIncoming: Bool
    let date: String
}

class ViewController: UITableViewController {
    
    fileprivate let cellId = "id"
    
    let chatMessages = [
        [ChatMessage(text: "Hi John", isIncoming: false, date: "1/2/2019"),
        ChatMessage(text: "How are you?", isIncoming: true, date: "1/2/2019")],
        [ChatMessage(text: "I am doing well", isIncoming: false, date: "1/3/2019"),
        ChatMessage(text: "Do you think I talk too much? I have a lot to say. Sometimes I repeat myself, because I can sense when others aren't listening", isIncoming: false, date: "1/3/2019")],
        [ChatMessage(text: "Are you listening, John?", isIncoming: false, date: "1/4/2019")]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.separatorStyle = .none
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.backgroundColor = UIColor(white: 0.85, alpha: 1)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeaderView = SectionHeaderView()
        sectionHeaderView.headerLabel.text = chatMessages[section].first?.date
        
        return sectionHeaderView
    }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageCell
        cell.chatMessage = chatMessages[indexPath.section][indexPath.row]

        return cell
    }


}

