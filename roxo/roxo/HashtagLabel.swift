//
//  HashtagLabel.swift
//  roxo
//
//  Created by bruno on 25/04/18.
//  Copyright © 2018 bruno. All rights reserved.
//

import UIKit

@IBDesignable
class HashtagLabel: UILabel {

    @IBInspectable var topInset: CGFloat = 2
    @IBInspectable var bottomInset: CGFloat = 2
    @IBInspectable var leftInset: CGFloat = 2
    @IBInspectable var rightInset: CGFloat = 2
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
    override var intrinsicContentSize: CGSize {
        get{
            var contentSize = super.intrinsicContentSize
            contentSize.height += topInset + bottomInset
            contentSize.width += leftInset + rightInset
            return contentSize
        }
    }

}
