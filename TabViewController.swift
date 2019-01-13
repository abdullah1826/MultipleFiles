//  Created by Muhammad Abdullah on 19/12/2018.
//  Copyright © 2018 Muhammad Abdullah - twaintec. All rights reserved.

import UIKit

class TabViewController: UIViewController {

    //Mark:- declare all viewControllers as a variable
    
    var alertViewCntrl : UIViewController!
    var watchlistViewCntrl : UIViewController!
    var learnViewCntrl : UIViewController!
    var liveViewCntrl : UIViewController!
    var settingsViewCntrl : UIViewController!
    
    //Mark:- array of all viewcontrollers
    var viewControllers : [UIViewController]!
    
    //Mark:- check selected Index
    var selectedIndex: Int = 0
    
    //Mark:- title of nav bar
    var navigationBarTitle : String = ""

    //Mark:- arrayOfAllButtons
    @IBOutlet var buttons : [UIButton]!
    
    //Mark:- array of all lables
    @IBOutlet var labels : [UILabel]!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tabBarView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //funtion to assign the title to navbar
        self.navigationBar(_titleWithIndex: selectedIndex)

        
        //call storyboard
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

    //Mark:- didPressTab bar button
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
    
    //Mark:- changeTappedBtnColor
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

