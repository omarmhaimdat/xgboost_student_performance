//
//  MyLabel.swift
//  CalculBeton
//
//  Created by M'haimdat omar on 14-08-2019.
//  Copyright © 2019 M'haimdat omar. All rights reserved.
//

import UIKit

class MyLabel: UITextView {
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 10
        let atributes = [NSAttributedString.Key.paragraphStyle: style ]
        self.attributedText = NSAttributedString(string: self.text, attributes: atributes)
        self.textColor = UIColor.label
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        self.font = UIFont.boldSystemFont(ofSize: 15)
        self.font = UIFont(name: "Avenir-Heavy", size: screenHeight/30)
        self.textAlignment = .center
        self.isEditable = false
        self.isSelectable = false
        self.isScrollEnabled = false
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
