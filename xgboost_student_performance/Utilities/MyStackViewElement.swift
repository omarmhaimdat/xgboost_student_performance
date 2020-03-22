//
//  MyStackViewElement.swift
//  CalculBeton
//
//  Created by M'haimdat omar on 14-08-2019.
//  Copyright © 2019 M'haimdat omar. All rights reserved.
//

import UIKit

class MyStackViewElement: UITextView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.text = ""
        self.textAlignment = .center
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 10
        let atributes = [NSAttributedString.Key.paragraphStyle: style ]
        self.attributedText = NSAttributedString(string: self.text, attributes: atributes)
        self.font = UIFont.boldSystemFont(ofSize: 16)
        self.font = UIFont(name: "Avenir-Heavy", size: 20)
        self.textAlignment = .center
        self.isEditable = false
        self.isSelectable = false
        self.isScrollEnabled = false
        self.layer.cornerRadius = 20
        self.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 244/255, alpha: 1)
        self.textColor = .label
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
