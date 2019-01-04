//
//  SectionHeaderView.swift
//  ChatList
//
//  Created by Greg Alton on 1/4/19.
//  Copyright © 2019 Greg Alton. All rights reserved.
//

import UIKit

// Alternative to placing a background view with constraints
class HeaderLabel: UILabel {
    override var intrinsicContentSize: CGSize {
        let originalContentSize = super.intrinsicContentSize
        let height = originalContentSize.height + 12
        layer.cornerRadius = height / 2
        layer.masksToBounds = true
        return CGSize(width: originalContentSize.width + 20, height: height)
    }
}

class SectionHeaderView: UIView {
    
    lazy var headerLabel: HeaderLabel = {
        let headerLabel = HeaderLabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.backgroundColor = UIColor(displayP3Red: 200/255, green: 255/255, blue: 200/255, alpha: 1.0)
        headerLabel.textColor = .black
        headerLabel.textAlignment = .center
        headerLabel.font = UIFont.boldSystemFont(ofSize: 14)
        return headerLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(headerLabel)
        headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

}
