//
//  UIViewControllerExtension.swift
//
//  Created by Roy Kronenfeld.
//

import UIKit

// Mark: - Curved Top View
extension UIView {
    
    // Public functions
    
    func updateTopCurveBackgroundColor(color: UIColor) {
        
        // Get layer if exist
        guard let layer = topCurveLayer() else {
            return
        }
        
        layer.fillColor = color.cgColor
    }
    
    // To run best place function last in viewDidLayoutSubviews
    func addTopCurve(backgroundColor: UIColor = .white,
                                curveRadius: CGFloat = 17,
                                shadowColor: UIColor = .darkGray,
                                shadowRadius: CGFloat = 4,
                                heightOffset: CGFloat = 0)
    {
        
        // Make sure layer do not exist already
        guard topCurveLayer() == nil else {
            return
        }
        
        // Get needed sizes with respect to device screen
        let viewWidth = frame.size.width
        let y1: CGFloat = heightOffset
        let y2: CGFloat = heightOffset + curveRadius

        // Create shape layer to hold curve path
        let pathLayer = CAShapeLayer()
        pathLayer.fillColor = backgroundColor.cgColor
        pathLayer.path = UIBezierPath().topCurvePath(width: viewWidth, y1: y1, y2: y2).cgPath
        
        // Create shadow layer
        let shadowLayer = CALayer().addShadowLayer(name: "curved_view", shapeLayer: pathLayer, radius: shadowRadius, color: shadowColor)
        
        // Add to view
        layer.addSublayer(shadowLayer)
    }
    
    // Private functions
    
    private func topCurveLayer() -> CAShapeLayer? {
        
        // Find our layer and return it, if not found return nil
        if let existingLayer = layer.sublayers?.filter({$0.name == "curved_view"}), existingLayer.count > 0 {
            if let existingLayerSubLayers = existingLayer[0].sublayers, let pathLayer = existingLayerSubLayers[0] as? CAShapeLayer {
                return pathLayer
            }
        }
        return nil
    }
}
