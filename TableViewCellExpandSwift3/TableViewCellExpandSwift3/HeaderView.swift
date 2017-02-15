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
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    func animateImageClockwise(imageview: UIImageView, value: CGFloat)  {
        UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {

        }) { (Bool) in
            
        }
    }
}
