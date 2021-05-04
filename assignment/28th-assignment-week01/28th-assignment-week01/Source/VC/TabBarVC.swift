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

        /// friend
        let friendStoryboard = UIStoryboard(name: "Friend", bundle: nil)

        guard let friendVC = friendStoryboard.instantiateViewController(identifier: FriendVC.identifier) as? FriendVC else { return }
        
        /// chat
        let chatStoryboard = UIStoryboard(name: "Chat", bundle: nil)
        guard let chatVC = chatStoryboard.instantiateViewController(identifier: ChatVC.identifier) as? ChatVC else { return }
        
        /// entertain
        let entertainStoryboard = UIStoryboard(name: "Entertain", bundle: nil)
        guard let entertainVC = entertainStoryboard.instantiateViewController(identifier: EntertainVC.identifier) as? EntertainVC else { return }
        
        /// shopping
        let shoppingStoryboard = UIStoryboard(name: "Shopping", bundle: nil)
        guard let shoppingVC = shoppingStoryboard.instantiateViewController(identifier: ShoppingVC.identifier) as? ShoppingVC else { return }
        
        /// more
        let moreStoryboard = UIStoryboard(name: "More", bundle: nil)
        guard let moreVC = moreStoryboard.instantiateViewController(identifier: MoreVC.identifier) as? MoreVC else { return }
        
        /// tabbar Item 연결
        friendVC.tabBarItem.image = UIImage(systemName: "person")
        friendVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        
        chatVC.tabBarItem.image = UIImage(systemName: "message")
        chatVC.tabBarItem.selectedImage = UIImage(systemName: "message.fill")
        
        entertainVC.tabBarItem.image = UIImage(systemName: "square.grid.2x2")
        entertainVC.tabBarItem.selectedImage = UIImage(systemName: "square.grid.2x2.fill")
        
        shoppingVC.tabBarItem.image = UIImage(systemName: "bag")
        shoppingVC.tabBarItem.selectedImage = UIImage(systemName: "bag.fill")
        
        moreVC.tabBarItem.image = UIImage(systemName: "gearshape")
        moreVC.tabBarItem.selectedImage = UIImage(systemName: "gearshape.fill")

        setViewControllers([friendVC, chatVC, entertainVC, shoppingVC, moreVC], animated: true)
    }
}
