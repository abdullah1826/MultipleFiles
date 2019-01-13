//  AppGlobals.swift
//  Created by Muhammad Abdullah on 19/12/2018.
//  Copyright © 2018 Muhammad Abdullah - twaintec. All rights reserved.

import UIKit

class AppGlobals: NSObject {
    
    static let shared = AppGlobals()
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    static let greenColor = UIColor(red:  CGFloat(RED),
                             green: CGFloat(GREEN),
                             blue: CGFloat(BLUE),
                             alpha: CGFloat(ALPHA))
    
    static let darkGreenColor = UIColor(red: 17.0/255.0, green: 82.0/255.0, blue: 16.0/256.0, alpha: 1.0)
    
    static let customFont = UIFont(name: "Arvo-Bold", size: 14)!
    static let customNormalFont = UIFont(name: "Arvo", size: 12)!

    static let customFontWith20 = UIFont(name: "Arvo-Bold", size: 20)!

    static let FULL_SCREEN_WIDTH: CGFloat = CGFloat(UIScreen.main.bounds.width)
    static let FULL_SCREEN_HEIGHT: CGFloat = UIScreen .main.bounds.height
    
    
    private override init() {
        
        super.init()
        
      //  self.checkFontFamilyName()
        
    }
    
    //Accessible: can access easily by shared.methodName()
    
    //Mark:- checkFontFamilyName
    
    func checkFontFamilyName(){
    
        for family: String in UIFont.familyNames
        {
            print("\(family)")
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }
    }
    
    //Unaccessible: can't access class functions with shared word, it's can be accessible by class name.
    //Mark:- checkFontFamily
    class func checkFontFamily() {
        
        for family: String in UIFont.familyNames
        {
            print("\(family)")
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }

        
    }

    //Mark:- customNavBarColor
    func customNavBarColor(){
        
    UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Arvo-Bold", size: 17) as Any,NSAttributedString.Key.foregroundColor : AppGlobals.greenColor]
        
    }
    
    //Mark:- hideKeypad
    class func keypad(display:Bool, vu: UIView){
        
        if display == true {
            
            vu.endEditing(true)
            
        } else {
            
            vu.endEditing(false)
            
        }
        
    }
    
 //Mark:- instantiateStoryBoard
    class func instantiateStoryBoard(storyboardname: String, identifier: String){
        
        let storyboard = UIStoryboard(name: storyboardname, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: identifier)
        
        controller.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    //Mark:- isTextfieldEmpty
    class func isTextfieldEmpty(txtfld: UITextField) -> Bool {
        
        var value = Bool()
        
        if txtfld.text == "" {
            
            value = false
        
        } else {
            
            value = true
        }
        
        return value
    }
    
    //Mark:- isValidName
    class func isValid(name: String) -> Bool {
        
        // check the name is between 4 and 16 characters
        
        if !(4...16 ~= name.characters.count) {
            
            return false
        }
        
        return true
    }
    
    
    //Mark:- changeTintColorOfImage
    func changeTintColor(imageName: String, color: UIColor){
        
        let origImage = UIImage(named: imageName);
        _ = origImage?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        
    }


    //Mark:- collectionViewWidth
    func collectionViewWidth(collectionVu: UICollectionView) -> CGFloat {
        
        let collectionViewSize = collectionVu.bounds.size
        let width = collectionViewSize.width
        
        return width
        
    }
    
    //Mark:- collectionViewHeight
    func collectionViewHeight(collectionVu: UICollectionView) -> CGFloat {
        
        let collectionViewSize = collectionVu.bounds.size
        let height = collectionViewSize.height
        
        return height
        
    }
    
    //Mark:- heightForLabel
    func heightForLabel(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        
        // pass string ,font , LableWidth
        
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        
        return label.frame.height
    }
    //Mark:- textWidth
    func textWidth(font: UIFont, text: String) -> CGFloat {
        
        let myText = text as NSString
        let rect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        let labelSize = myText.boundingRect(with: rect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(labelSize.width)
    }
    
    //Mark:- getTextheightByAssigningWidth
    func height(withConstrainedWidth width: CGFloat, font: UIFont, text: String) -> CGFloat {
        
        let myText = text as NSString
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = myText.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    //Mark:- getTextWidthByAssigningHeight
    func width(withConstrainedHeight height: CGFloat, font: UIFont, text: String) -> CGFloat {
        
        let myText = text as NSString
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = myText.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }


    
}
