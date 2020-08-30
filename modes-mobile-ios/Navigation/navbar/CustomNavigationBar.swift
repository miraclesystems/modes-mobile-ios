import Foundation
import UIKit

protocol ButtonTapDelegate {
  func didTapButton()
}

class CustomNavigationBar: UIView {
    
    private static let NIB_NAME = "CustomNavigationBar"
    
    @IBOutlet private var view: UIView!
    @IBOutlet private weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
   // var delegate: ButtonTapDelegate
    
    /*
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    var isLeftButtonHidden: Bool {
        set {
            leftButton.isHidden = newValue
        }
        get {
            return leftButton.isHidden
        }
    }
    
    var isRightFirstButtonEnabled: Bool {
        set {
            rightFirstButton.isEnabled = newValue
        }
        get {
            return rightFirstButton.isEnabled
        }
    }
    */
    
    override func awakeFromNib() {
        initWithNib()
    }
    
    
    @IBAction func rightMenuClicked(_ sender: Any) {
        print("Menu Button Pressed")
       // SSASideMenu._presentRightMenuViewController()
      //  delegate.didTapButton()
    }
    
 
    private func initWithNib() {
        Bundle.main.loadNibNamed(CustomNavigationBar.NIB_NAME, owner: self, options: nil)
        
     
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        setupLayout()
        
        //rightButton.addTarget(self, action: #selector(SSASideMenu.presentRightMenuViewController), for: UIControl.Event.touchUpInside)
        
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate(
            [
                view.topAnchor.constraint(equalTo: topAnchor),
                view.leadingAnchor.constraint(equalTo: leadingAnchor),
                view.bottomAnchor.constraint(equalTo: bottomAnchor),
                view.trailingAnchor.constraint(equalTo: trailingAnchor),
            ]
        )
    }
}
