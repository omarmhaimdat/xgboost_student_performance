//
//  String+Extension.swift
//  exmachina
//
//  Created by M'haimdat omar on 09-08-2019.
//  Copyright © 2019 M'haimdat omar. All rights reserved.
//

import UIKit
extension String {
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.height
    }
}
