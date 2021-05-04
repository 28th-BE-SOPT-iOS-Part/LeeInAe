//
//  FirstVC.swift
//  28th-assignment-week01
//
//  Created by inae Lee on 2021/04/08.
//

import UIKit

class FirstVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        NSLog("segue : \(segue.identifier)")
    }

    @IBAction func wind(_ sender: Any) {
        self.performSegue(withIdentifier: "manualSegue", sender: self)
    }
}
