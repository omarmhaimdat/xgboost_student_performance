//
//  BtnFacebookSignIn.swift
//  exmachina
//
//  Created by M'haimdat omar on 30-05-2019.
//  Copyright © 2019 M'haimdat omar. All rights reserved.
//

import UIKit

class BtnFacebookSignIn: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var myValue: Int
    
    override init(frame: CGRect) {
        self.myValue = 0
        
        super.init(frame: frame)
        
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        
        backgroundColor = .red
        layer.borderWidth = 6/UIScreen.main.nativeScale
        layer.backgroundColor = UIColor(red: 24/255, green: 119/255, blue: 242/255, alpha:1.0).cgColor
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont(name: "Avenir-Heavy", size: screenHeight/45)
        layer.borderColor = UIColor(red: 24/255, green: 119/255, blue: 242/255, alpha:1.0).cgColor
        layer.cornerRadius = 5
        let icon = UIImage(named: "facebook")?.resized(newSize: CGSize(width: 35, height: 35))
        self.setImage( icon, for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 100)
        self.layoutIfNeeded()
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
        contentHorizontalAlignment = .left
        titleEdgeInsets.left = 30
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
