//
//  NewSegue.swift
//  28th-assignment-week01
//
//  Created by inae Lee on 2021/04/09.
//

import UIKit

class NewSegue: UIStoryboardSegue {
    override func perform() {
        let srcVC = self.source
        let destVC = self.destination
        
        UIView.transition(from: srcVC.view, to: destVC.view, duration: 1.5, options: .transitionFlipFromRight, completion: nil)
    }
}
