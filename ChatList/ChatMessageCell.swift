//
//  ChatCellTableViewCell.swift
//  ChatList
//
//  Created by Greg Alton on 1/2/19.
//  Copyright © 2019 Greg Alton. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {
    
    var labelLeadingAnchor: NSLayoutConstraint!
    var labelTrailingAnchor: NSLayoutConstraint!
    
    var chatMessage: ChatMessage! {
        didSet {
            chatBubble.backgroundColor = chatMessage.isIncoming ? .darkGray : .white
            messageLabel.textColor = chatMessage.isIncoming ? .white : .black
            messageLabel.text = chatMessage.text
            
            if(chatMessage.isIncoming) {
                labelLeadingAnchor.isActive = false
                labelTrailingAnchor.isActive = true
            } else {
                labelTrailingAnchor.isActive = false
                labelLeadingAnchor.isActive = true
            }
        }
    }
    
    private lazy var chatBubble: UIView = {
        let chatBubble = UIView()
        chatBubble.translatesAutoresizingMaskIntoConstraints = false
        chatBubble.backgroundColor = .black
        chatBubble.layer.cornerRadius = 5
        return chatBubble
    }()
    
    lazy var messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.textColor = .white
        messageLabel.numberOfLines = 0
        //messageLabel.text = "Some example text that may run over one line. Some example text that may run over one line. Some example text that may run over one line. Some example text that may run over one line."
        return messageLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        /*
          Chat bubble is added to the view first so that it can be the background for messageLabel, but it's constraints are added after messageLabel and are anchored to messageLabel anchors, since messageLabel will be sized according to it's text content.
        */
        
        //addSubview(paddingView)
        addSubview(chatBubble)
        addSubview(messageLabel)
        messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250).isActive = true
        
        chatBubble.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16).isActive = true
        chatBubble.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16).isActive = true
        chatBubble.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16).isActive = true
        chatBubble.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16).isActive = true
        
        // Toggled active/inactive when chatMessage is set
        labelLeadingAnchor = messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
        labelLeadingAnchor.isActive = true
        
        labelTrailingAnchor = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        labelTrailingAnchor.isActive = false
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
