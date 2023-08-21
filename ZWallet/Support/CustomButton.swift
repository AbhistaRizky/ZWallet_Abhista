//
//  CustomButton.swift
//  ZWallet
//
//  Created by laptop MCO on 12/08/23.
//

import UIKit

class CustomButton: UIButton {
    
    @IBInspectable
    var cornerRadius: CGFloat = 20 {
        didSet {
            update()
    }
}
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        update()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        update()
    }
    
    func update() {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
}
