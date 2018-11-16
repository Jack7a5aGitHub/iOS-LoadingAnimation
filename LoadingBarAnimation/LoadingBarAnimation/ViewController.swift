//
//  ViewController.swift
//  LoadingBarAnimation
//
//  Created by Jack Wong on 2018/06/04.
//  Copyright © 2018 Jack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterLabel: CountingLabel!
    private let shapeLayer = CAShapeLayer()
    private var pulsatingLayer: CAShapeLayer!
    private var pulsatingLayer2: CAShapeLayer!
    private var pulsatingLayer3: CAShapeLayer!
    override func viewDidLoad() {
        super.viewDidLoad()
       // drawCircle()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        drawCircle()
    }

}

extension ViewController {
    private func drawCircle(){
        
        let center = view.center
        print(view.center)
        //remember the default start angle is started from the east
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 1.5 * CGFloat.pi, clockwise: true)
        
        //pulsating
        pulsatingLayer = CAShapeLayer()
        pulsatingLayer.path = circularPath.cgPath
        pulsatingLayer.strokeColor = UIColor.brown.cgColor
        pulsatingLayer.lineWidth = 10
        pulsatingLayer.fillColor = UIColor.clear.cgColor
        pulsatingLayer.lineCap = kCALineCapRound
        pulsatingLayer.position = center
        view.layer.addSublayer(pulsatingLayer)
        animatePulsatingLAyer(layer: pulsatingLayer, duration: 1, toValue: 1.2)
        
        pulsatingLayer2 = CAShapeLayer()
        pulsatingLayer2.path = circularPath.cgPath
        pulsatingLayer2.strokeColor = UIColor.brown.cgColor
        pulsatingLayer2.lineWidth = 10
        pulsatingLayer2.fillColor = UIColor.clear.cgColor
        pulsatingLayer2.lineCap = kCALineCapRound
        pulsatingLayer2.position = center
        view.layer.addSublayer(pulsatingLayer2)
        animatePulsatingLAyer(layer: pulsatingLayer2, duration: 1.2, toValue: 1.45)
        
        pulsatingLayer3 = CAShapeLayer()
        pulsatingLayer3.path = circularPath.cgPath
        pulsatingLayer3.strokeColor = UIColor.brown.cgColor
        pulsatingLayer3.lineWidth = 10
        pulsatingLayer3.fillColor = UIColor.clear.cgColor
        pulsatingLayer3.lineCap = kCALineCapRound
        pulsatingLayer3.position = center
        view.layer.addSublayer(pulsatingLayer3)
        animatePulsatingLAyer(layer: pulsatingLayer3, duration: 1.4, toValue: 1.8)
        
        //create my track layer
        let trackLayer = CAShapeLayer()
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = kCALineCapRound
        trackLayer.position = center
        view.layer.addSublayer(trackLayer)
       
        //shapeLayer
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.strokeEnd = 0
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.position = center
        // make the head round
        shapeLayer.lineCap = kCALineCapRound
        view.layer.addSublayer(shapeLayer)
        handleTap()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    @objc private func handleTap(){
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "kickAss")
        counterLabel.count(fromValue: 0, to: 100, withDuration: 2, andAnimationType: .EaseOut, andCounterType: .Int)
    }
    
    private func animatePulsatingLAyer(layer: CAShapeLayer, duration: CFTimeInterval, toValue: Double) {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.toValue = toValue
        animation.duration = duration
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.autoreverses = false
        animation.repeatCount = Float.infinity
        layer.add(animation, forKey: "pulsing")
    }
}






