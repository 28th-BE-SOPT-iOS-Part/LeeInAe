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
        
        self.tabBar.tintColor = .black

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
        friendVC.tabBarItem.image = UIImage(named: "friendTabIcon")
        friendVC.tabBarItem.selectedImage = UIImage(named: "friendTabIconSelected")
        
        chatVC.tabBarItem.image = UIImage(named: "messageTabIcon")
        chatVC.tabBarItem.selectedImage = UIImage(named: "messageTabIconSelected")
        chatVC.tabBarItem.selectedImage?.withTintColor(.black)
        
        entertainVC.tabBarItem.image = UIImage(named: "searchTabIcon")
        entertainVC.tabBarItem.selectedImage = UIImage(named: "searchTabIconSelected")
        
        shoppingVC.tabBarItem.image = UIImage(named: "shopTabIcon")
        shoppingVC.tabBarItem.selectedImage = UIImage(named: "shopTabIconSelected")
        
        moreVC.tabBarItem.image = UIImage(named: "detailTabIcon")
        moreVC.tabBarItem.selectedImage = UIImage(named: "detailTabIconSelected")

        setViewControllers([friendVC, chatVC, entertainVC, shoppingVC, moreVC], animated: true)
    }
}
