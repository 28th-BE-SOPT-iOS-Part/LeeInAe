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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func wind(_ sender: Any) {
        self.performSegue(withIdentifier: "manualSegue", sender: self)
    }
}
