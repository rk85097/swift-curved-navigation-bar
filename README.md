# swift-curved-navigation-bar
Curved UINavigationBar written in Swift 3.0

![](http://www.aviationwb.com/image-1.png)
# Installation 
Copy all extensions into your project

# Usage

### View Controller Navigation Bar
In your view controller add the following line (adjust properties as needed)

`addCurvedNavigationBar(backgroundColor: .white, curveRadius: 17.0, shadowColor: .darkGray, shadowRadius: 4.0, heightOffset: 0.0)`

If you need to change color, use the following

`updateTopCurveBackgroundColor(color: .red)`

### UIView Top Curve
This repo also contains support to add top curve on UIViews, in your view add the following line (adjust properties as needed)

`addTopCurve(backgroundColor: .white, curveRadius: 17.0, shadowColor: .darkGray, shadowRadius: 4.0, heightOffset: 0.0)`

If you need to change color, use the following

`updateTopCurveBackgroundColor(color: .red)`
