//
//  HeaderView.swift
//  TableViewCellExpandSwift3
//
//  Created by piyush sinroja on 06/01/17.
//
//

import UIKit

class HeaderView: UIView {

    @IBOutlet weak var imgview: UIImageView!
    @IBOutlet weak var lblHeader: UILabel!
    
    func animateImageClockwise(imageview: UIImageView, value: Double)  {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
             self.imgview.transform = CGAffineTransform(rotationAngle: CGFloat(value * M_PI))
        }) { (Bool) in
        }
    }
    
    func animateImageAntiClockwise(imageview: UIImageView, value: CGFloat)  {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.imgview.transform = CGAffineTransform(rotationAngle: CGFloat(value))
        }) { (Bool) in
            
        }
    }
}
