//
//  ViewController.swift
//  28th-seminar-week07
//
//  Created by inae Lee on 2021/05/28.
//

import Lottie
import UIKit

class ViewController: UIViewController {
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = CGRect(x: 0, y: 0,
                                         width: 50, height: 50)
        activityIndicator.center = self.view.center

        activityIndicator.color = .purple
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .medium

        activityIndicator.stopAnimating()
        return activityIndicator
    }()

    lazy var lottieView: AnimationView = {
        let animationView = AnimationView(name: "7thSeminar_Lottie_sample")
        animationView.frame = CGRect(x: 0, y: 0,
                                     width: 100, height: 100)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFill
        animationView.stop()
        animationView.isHidden = true

        return animationView
    }()

    var isOpened: Bool = false

    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.addSubview(activityIndicator)
        view.addSubview(lottieView)
    }

    @IBAction func touchUpStartButton(_ sender: Any) {
        activityIndicator.startAnimating()
    }

    @IBAction func touchUpStopButton(_ sender: Any) {
        activityIndicator.stopAnimating()
    }

    @IBAction func startButtonClicked(_ sender: Any) {
        lottieView.isHidden = false
        lottieView.play()
    }

    @IBAction func stopButtonClicked(_ sender: Any) {
        lottieView.isHidden = true
        lottieView.stop()
    }

    @IBAction func expendButtonClicked(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            if self.isOpened {
                self.close()
            }
            else {
                self.open()
            }
        }
    }

    func open() {
        print("open")

        heightConstraint.constant = 200
//        arrowImageView.transform = CGAffineTransform(rotationAngle: .pi)
        view.layoutIfNeeded()
        isOpened = true
    }

    func close() {
        print("close")
        heightConstraint.constant = 100
//        arrowImageView.transform = CGAffineTransform(rotationAngle: 0)
        view.layoutIfNeeded()
        isOpened = false
    }
}
