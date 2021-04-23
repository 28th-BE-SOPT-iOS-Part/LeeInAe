//
//  TabBarVC.swift
//  28th-assignment-week01
//
//  Created by inae Lee on 2021/04/23.
//

import UIKit

class TabBarVC: UITabBarController {
    static let identifier = "TabBarVC"

    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "Detail", bundle: nil)

        guard let friendVC = storyboard.instantiateViewController(identifier: FriendVC.identifier) as? FriendVC else { return }
        friendVC.tabBarItem.image = UIImage(systemName: "person")
        friendVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")

        setViewControllers([friendVC], animated: true)
    }
}
