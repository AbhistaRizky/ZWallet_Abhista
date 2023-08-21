//
//  CustomLogin.swift
//  ZWallet
//
//  Created by laptop MCO on 11/08/23.
//

import UIKit

class CustomLogin: UIView {
    
    var cornerRadius: CGFloat = 60 {
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

extension UIView {
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        layer.shadowRadius = 1
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
