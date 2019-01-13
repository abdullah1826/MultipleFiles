//
//  ViewController.swift
//  AidedTradeApp
//
//  Created by Muhammad Abdullah on 19/12/2018.
//  Copyright © 2018 Muhammad Abdullah - twaintec. All rights reserved.
//

import UIKit

class TabViewController: UIViewController {

    var alertViewCntrl : UIViewController!
    var watchlistViewCntrl : UIViewController!
    var learnViewCntrl : UIViewController!
    var liveViewCntrl : UIViewController!
    var settingsViewCntrl : UIViewController!
    
    
    var viewControllers : [UIViewController]!
    
    var selectedIndex: Int = 0
    var navigationBarTitle : String = ""

    
    @IBOutlet var buttons : [UIButton]!
    @IBOutlet var labels : [UILabel]!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tabBarView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.navigationController?.isNavigationBarHidden = false
        self.navigationBar(_titleWithIndex: selectedIndex)

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        alertViewCntrl = storyboard.instantiateViewController(withIdentifier: "alertViewCntrl")
        watchlistViewCntrl = storyboard.instantiateViewController(withIdentifier: "watchlistViewCntrl")
        learnViewCntrl = storyboard.instantiateViewController(withIdentifier: "learnViewCntrl")
        liveViewCntrl = storyboard.instantiateViewController(withIdentifier: "liveViewCntrl")
        settingsViewCntrl = storyboard.instantiateViewController(withIdentifier: "settingsViewCntrl")

        viewControllers = [alertViewCntrl,watchlistViewCntrl,learnViewCntrl, liveViewCntrl,settingsViewCntrl]
        

        buttons[selectedIndex].isSelected = true
        didPressTab(buttons[selectedIndex])
    
        
    }

    @IBAction func didPressTab(_ sender: UIButton) {
        
        selectedIndex = sender.tag

        let previousIndex = selectedIndex
        
        buttons[previousIndex].isSelected = false
        
        buttons[previousIndex].tintColor = UIColor.clear
        labels[previousIndex].textColor = UIColor.black
        
        let previousVC = viewControllers[previousIndex]
        
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        
        
        sender.isSelected = true
        let vc = viewControllers[selectedIndex]
        addChild(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMove(toParent: self)
        
        self.navigationBar(_titleWithIndex: selectedIndex)
        self.changeTappedBtnColor(_selectedState: sender)
        
        
    }
    
    //    Mark: SetNavigatioaBarTitle
    func navigationBar(_titleWithIndex: NSInteger)
    {
        switch _titleWithIndex {
        
    
        case 0:
            self.title = "Alerts"
        case 1:
            self.title = "Watchlist"
        case 2:
            self.title = "Learn"
        case 3:
            self.title = "Live"
        case 4:
            self.title = "Settings"
        default:
            self.title = "Alerts"
        }
        
        
    }
    
    func changeTappedBtnColor(_selectedState:UIButton){
        
        if _selectedState.isSelected {
            
            buttons[_selectedState.tag].tintColor = AppGlobals.greenColor
            labels[_selectedState.tag].textColor = AppGlobals.greenColor
            
            _selectedState.isSelected = false
    }
        for index in buttons{
           
            if index.tag != _selectedState.tag{
                
                buttons[index.tag].tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                labels[index.tag].textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }
        }
        
  }
}

extension UIView {
    func addshadow(top: Bool,
                   left: Bool,
                   bottom: Bool,
                   right: Bool,
                   shadowRadius: CGFloat = 2.0) {
        
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = 1.0
        
        let path = UIBezierPath()
        var x: CGFloat = 0
        var y: CGFloat = 0
        var viewWidth = self.frame.width
        var viewHeight = self.frame.height
        
        // here x, y, viewWidth, and viewHeight can be changed in
        // order to play around with the shadow paths.
        if (!top) {
            y+=(shadowRadius+1)
        }
        if (!bottom) {
            viewHeight-=(shadowRadius+1)
        }
        if (!left) {
            x+=(shadowRadius+1)
        }
        if (!right) {
            viewWidth-=(shadowRadius+1)
        }
        // selecting top most point
        path.move(to: CGPoint(x: x, y: y))
        // Move to the Bottom Left Corner, this will cover left edges
        /*
         |☐
         */
        path.addLine(to: CGPoint(x: x, y: viewHeight))
        // Move to the Bottom Right Corner, this will cover bottom edge
        /*
         ☐
         -
         */
        path.addLine(to: CGPoint(x: viewWidth, y: viewHeight))
        // Move to the Top Right Corner, this will cover right edge
        /*
         ☐|
         */
        path.addLine(to: CGPoint(x: viewWidth, y: y))
        // Move back to the initial point, this will cover the top edge
        /*
         _
         ☐
         */
        path.close()
        self.layer.shadowPath = path.cgPath
 }
}

extension UIView{
    
    func addShadow(to edges:[UIRectEdge], radius:CGFloat){
        
        let toColor = AppGlobals.greenColor
        let fromColor =  AppGlobals.greenColor
        
        // Set up its frame.
        let viewFrame = self.frame
        for edge in edges{
            let gradientlayer          = CAGradientLayer()
            gradientlayer.colors       = [fromColor.cgColor,toColor.cgColor]
            gradientlayer.shadowRadius = radius
            
            switch edge {
            case UIRectEdge.top:
                gradientlayer.startPoint = CGPoint(x: 0.5, y: 0.0)
                gradientlayer.endPoint = CGPoint(x: 0.5, y: 1.0)
                gradientlayer.frame = CGRect(x: 0.0, y: 0.0, width: viewFrame.width, height: gradientlayer.shadowRadius)
            case UIRectEdge.bottom:
                gradientlayer.startPoint = CGPoint(x: 0.5, y: 1.0)
                gradientlayer.endPoint = CGPoint(x: 0.5, y: 0.0)
                gradientlayer.frame = CGRect(x: 0.0, y: viewFrame.height - gradientlayer.shadowRadius, width: viewFrame.width, height: gradientlayer.shadowRadius)
            case UIRectEdge.left:
                gradientlayer.startPoint = CGPoint(x: 0.0, y: 0.5)
                gradientlayer.endPoint = CGPoint(x: 1.0, y: 0.5)
                gradientlayer.frame = CGRect(x: 0.0, y: 0.0, width: gradientlayer.shadowRadius, height: viewFrame.height)
            case UIRectEdge.right:
                gradientlayer.startPoint = CGPoint(x: 1.0, y: 0.5)
                gradientlayer.endPoint = CGPoint(x: 0.0, y: 0.5)
                gradientlayer.frame = CGRect(x: viewFrame.width - gradientlayer.shadowRadius, y: 0.0, width: gradientlayer.shadowRadius, height: viewFrame.height)
            default:
                break
            }
            self.layer.addSublayer(gradientlayer)
        }
        
    }
    
    func removeAllSublayers(){
        if let sublayers = self.layer.sublayers, !sublayers.isEmpty{
            for sublayer in sublayers{
                sublayer.removeFromSuperlayer()
            }
        }
    }
    
}
