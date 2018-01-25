//
//  UIViewControllerExtension.swift
//
//  Created by Roy Kronenfeld.
//

import UIKit

extension CALayer {
    
    func addShadowLayer(name: String, shapeLayer: CAShapeLayer, radius: CGFloat, color: UIColor) -> CALayer {
        let shadowLayer = CALayer()
        shadowLayer.shadowColor = color.cgColor
        shadowLayer.shadowOffset = CGSize.zero
        shadowLayer.shadowRadius = radius
        shadowLayer.shadowOpacity = 0.8
        shadowLayer.backgroundColor = UIColor.clear.cgColor
        shadowLayer.insertSublayer(shapeLayer, at: 0)
        shadowLayer.name = name
        return shadowLayer
    }
}
