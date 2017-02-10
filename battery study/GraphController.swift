//
//  GraphController.swift
//  battery study
//
//  Created by Marek Newton on 2/9/17.
//  Copyright © 2017 Marek Newton. All rights reserved.
//

import UIKit

extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height:
                thickness)
            break
        case UIRectEdge.bottom:
            border.frame = CGRect(x: 0, y: self.frame.height - thickness, width: self.frame.width,
                                  height: thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect(x: 0, y: 0, width: thickness,
                                  height: self.frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect(x: self.frame.width - thickness, y: 0, width: thickness,
                                  height: self.frame.height)
            break
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        
        self.addSublayer(border)
    }
    
}

@IBDesignable class Graph: UIView {}

class GraphController: UIViewController {
    var studys: Array<Study> = [Study]()
    
    @IBOutlet var graphView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studys = getStudys()
        
        graphView?.layer.addBorder(edge: UIRectEdge.left, color: UIColor.black, thickness: 2)
        graphView?.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.black, thickness: 2)
        
        let widthIncrement = graphView.frame.width / CGFloat(studys.count)
        let heightIncrement = graphView.frame.height / 100
        
        print(widthIncrement)
        print(heightIncrement)
    
        for (i, study) in studys.enumerated() {
            let batteryLoss = study.batteryLoss
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: CGFloat(i) * widthIncrement + 2,
                                                             y: CGFloat(batteryLoss) * heightIncrement + (graphView?.frame.height)! - 2),
                                                            radius: CGFloat(1),
                                                            startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = circlePath.cgPath
            shapeLayer.fillColor = UIColor.red.cgColor
            shapeLayer.strokeColor = UIColor.red.cgColor
            shapeLayer.lineWidth = 3.0
            graphView?.layer.addSublayer(shapeLayer)
        }
    }
}
