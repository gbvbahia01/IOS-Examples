//
//  SecondLabel.swift
//  Section_4_Percival
//
//  Created by Guilherme B V Bahia on 25/06/17.
//  Copyright © 2017 Planet Bang. All rights reserved.
//

import UIKit

class SecondLabel: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

   func startBlink() {
      UIView.animate(withDuration: 0.5,
                     delay:0.0,
                     options:[.autoreverse, .repeat],
                     animations: {
                        self.alpha = 0
      }, completion: nil)
      
       Timer.scheduledTimer(timeInterval: 3.1, target: self, selector: #selector(SecondLabel.stopBlink), userInfo: nil, repeats: false)
   }
   
   func stopBlink() {
      alpha = 1
      layer.removeAllAnimations()
   }
}
