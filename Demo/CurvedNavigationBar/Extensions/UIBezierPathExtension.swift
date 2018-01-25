//
//  UIViewControllerExtension.swift
//
//  Created by Roy Kronenfeld.
//

import UIKit

extension UIBezierPath {
    
    func topCurvePath(width: CGFloat, y1: CGFloat, y2: CGFloat) -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0.0, y: y1))
        path.addCurve(to: CGPoint(x: width / 2 , y: y2), controlPoint1: CGPoint(x: 0, y: y1), controlPoint2: CGPoint(x:width / 4, y: y2))
        path.addCurve(to: CGPoint(x: width, y: y1), controlPoint1: CGPoint(x: width * 0.75, y: y2), controlPoint2: CGPoint(x: width, y: y1))
        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x:0, y: 0))
        path.addLine(to: CGPoint(x:0, y: y1))
        path.stroke()
        return path
    }
}
