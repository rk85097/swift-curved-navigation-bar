//
//  UIViewControllerExtension.swift
//
//  Created by Roy Kronenfeld.
//

import UIKit

// Mark: - Curved UINavigationBar
extension UIViewController {
    
    // Public functions
    
    func updateCurvedNavigationBarBackgroundColor(color: UIColor) {
        
        // Get layer if exist
        guard let layer = curvedLayer() else {
            return
        }
        
        layer.fillColor = color.cgColor
    }
    
    // To run best place function last in viewDidLayoutSubviews
    func addCurvedNavigationBar(backgroundColor: UIColor = .white,
                                curveRadius: CGFloat = 17,
                                shadowColor: UIColor = .darkGray,
                                shadowRadius: CGFloat = 4,
                                heightOffset: CGFloat = 0) {
        
        // Without navigation controller we cannot continue. Also make sure layer do not exist already.
        guard let navigationController = self.navigationController, curvedLayer() == nil else {
            return
        }
        
        // Clear navigatio bar line and background by replacing with empty image
        navigationController.navigationBar.isTranslucent = true
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        
        // Get needed sizes with respect to device screen
        let screenWidth = UIScreen.main.bounds.size.width
        let totalHeight = UIApplication.shared.statusBarFrame.height + navigationController.navigationBar.frame.size.height + heightOffset
        let y1: CGFloat = totalHeight
        let y2: CGFloat = totalHeight + curveRadius
        
        // Create shape layer to hold curve path
        let pathLayer = CAShapeLayer()
        pathLayer.fillColor = backgroundColor.cgColor
        pathLayer.path = UIBezierPath().topCurvePath(width: screenWidth, y1: y1, y2: y2).cgPath
        
        // Create shadow layer
        let shadowLayer = CALayer().addShadowLayer(name: "curved_view", shapeLayer: pathLayer, radius: shadowRadius, color: shadowColor)
        
        // Add to view
        view.layer.addSublayer(shadowLayer)
    }
    
    // Private functions
    
    private func curvedLayer() -> CAShapeLayer? {
        
        // Find our layer and return it, if not found return nil
        if let existingLayer = view.layer.sublayers?.filter({$0.name == "curved_nav_bar"}), existingLayer.count > 0 {
            if let existingLayerSubLayers = existingLayer[0].sublayers, let pathLayer = existingLayerSubLayers[0] as? CAShapeLayer {
                return pathLayer
            }
        }
        return nil
    }
}
