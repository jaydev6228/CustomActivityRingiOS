//
//  ProgressRing.swift
//  TOT-FE
//
//  Created by VeBuIn on 2022/02/07.
//

import Foundation
import UIKit

public class ProgressRing: UIView {
        
    public var lineWidth: CGFloat = 10.0 {
        didSet {
            fillLayer.lineWidth = self.lineWidth
        }
    }
    
    private var centerPoint: CGPoint {
        get {
            return self.convert(self.center, from:self.superview)
        }
    }
    
    private var radius: CGFloat {
        get{
            if self.frame.width < self.frame.height { return (self.frame.width - lineWidth)/2 }
            else { return (self.frame.height - lineWidth)/2 }
        }
    }
    
    public var trackGradientColor: [CGColor] = [UIColor(red: 155.0/255.0, green: 134.0/255.0, blue: 223.0/255.0, alpha: 0.6).cgColor,UIColor(red: 155.0/255.0, green: 134.0/255.0, blue: 223.0/255.0, alpha: 0.6).cgColor] {
        didSet{
            setGradientLayerColor()
        }
    }

    public var trackColor: UIColor = UIColor.gray.withAlphaComponent(0.2) {
        didSet{
            setTrackColor()
        }
    }
    
    private var fillLayer = CAShapeLayer()
    private var trackLayer = CAShapeLayer()
    private let gradientLayer = CAGradientLayer()
    
    private var circlePath: UIBezierPath {
        get {
           return UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: -(.pi / 2), endAngle: 2 * CGFloat.pi + -(.pi / 2), clockwise: true)
        }
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        createTrackRing()
        createFillRing()
    }

    
    private func createFillRing() {
        fillLayer.path = circlePath.cgPath
        fillLayer.lineWidth = lineWidth
        fillLayer.strokeColor = UIColor.gray.cgColor
        fillLayer.fillColor = UIColor.clear.cgColor
        fillLayer.strokeEnd = 0
        fillLayer.lineCap = "round"
        self.layer.addSublayer(fillLayer)
        drawGradientLayer()
    }
    
    private func createTrackRing() {
        trackLayer.path = circlePath.cgPath
        trackLayer.lineWidth = lineWidth
        trackLayer.strokeColor = trackColor.cgColor
        trackLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(trackLayer)
    }
    
    private func drawGradientLayer(){
        gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.colors = trackGradientColor
        gradientLayer.frame = self.bounds
        gradientLayer.mask = fillLayer
        self.layer.addSublayer(gradientLayer)
    }
    
    private func addAnimation(progress: CGFloat) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = progress
        animation.duration = 0.5
        fillLayer.add(animation, forKey: "animation")
    }
    
    private func setGradientLayerColor(){
        self.gradientLayer.colors = trackGradientColor
    }
    
    private func setTrackColor(){
        self.trackLayer.strokeColor = trackColor.cgColor
    }
    
    private func setForegroundLayerColorForSafePercent(){
        self.fillLayer.strokeColor = UIColor.red.cgColor
    }

    private func setBackgroundLayerColorForSafePercent(){
        self.trackLayer.strokeColor = UIColor.gray.cgColor.copy(alpha: 0.5)
    }
    
    public func setProgress(to progressConstant: Double, withAnimation: Bool) {
        
        var progress: Double {
            get {
                if progressConstant > 1 { return 1 }
                else if progressConstant < 0 { return 0 }
                else { return progressConstant }
            }
        }
        fillLayer.strokeEnd = CGFloat(progress)

        if withAnimation {
            addAnimation(progress: progress)
        }
    }
}
