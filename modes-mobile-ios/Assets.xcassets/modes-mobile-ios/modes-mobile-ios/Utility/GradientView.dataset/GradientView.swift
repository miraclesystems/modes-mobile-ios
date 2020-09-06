//
//  GradientView.swift


import UIKit

//@IBDesignable
class GradientView: UIView {
    
    private let gradientLayer = CAGradientLayer()
    
    @IBInspectable var color1: UIColor = .white { didSet { updateColors() } }
    @IBInspectable var color2: UIColor = .blue  { didSet { updateColors() } }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureGradient()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = bounds
    }
    
    private func configureGradient() {
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        updateColors()
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func updateColors() {
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
    }
    
}

