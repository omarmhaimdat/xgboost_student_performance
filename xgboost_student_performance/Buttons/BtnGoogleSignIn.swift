//
//  BtnGoogleSignIn.swift
//  exmachina
//
//  Created by M'haimdat omar on 30-05-2019.
//  Copyright © 2019 M'haimdat omar. All rights reserved.
//

import UIKit

class BtnGoogleSignIn: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    var myValue: Int
    
    override init(frame: CGRect) {
        self.myValue = 0
        
        super.init(frame: frame)
        
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        
        backgroundColor = .white
        layer.borderWidth = 6/UIScreen.main.nativeScale
        layer.backgroundColor = UIColor.white.cgColor
        setTitleColor(UIColor(red: 117/255, green: 117/255, blue: 117/255, alpha: 1), for: .normal)
        titleLabel?.font = UIFont(name: "Avenir-Heavy", size: screenHeight/45)
        layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        layer.cornerRadius = 5
        let icon = UIImage(named: "logo_google_colors")?.resized(newSize: CGSize(width: 35, height: 35))
        self.setImage( icon, for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 100)
        self.layoutIfNeeded()
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
        contentHorizontalAlignment = .left
        layer.shadowOpacity = 0.2
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
        layer.shadowRadius = 10
        layer.masksToBounds = true
        clipsToBounds = false
        titleEdgeInsets.left = 15
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

