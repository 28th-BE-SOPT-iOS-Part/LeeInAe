//
//  MoreVC.swift
//  28th-assignment-week01
//
//  Created by inae Lee on 2021/04/23.
//

import UIKit

class MoreVC: UIViewController {
    static let identifier = "MoreVC"

    let menu: [String] = ["메일", "캘린더", "서랍", "카카오콘", "메이커스", "선물하기", "이모티콘", "프렌즈", "쇼핑하기", "스타일", "주문하기", "멜론티켓", "게임", "멜론", "헤어샵", "전체 서비스"]

    // MARK: - IBOutlets

    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var stateLabel: UILabel!
    @IBOutlet var iconCollectionView: UICollectionView!

    let width = UIScreen.main.bounds.width

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        initCV()
    }
}

extension MoreVC {
    func initView() {
        profileImage.image = FriendVC.user.image

        nameLabel.text = FriendVC.user.name
        nameLabel.font = UIFont.AppleSDGothic(type: .semiBold, size: 15)

        stateLabel.text = FriendVC.user.state
        stateLabel.font = UIFont.AppleSDGothic(type: .regular, size: 12)
        stateLabel.textColor = UIColor(red: 166/255, green: 166/255, blue: 166/255, alpha: 1)
    }

    func initCV() {
        iconCollectionView.delegate = self
        iconCollectionView.dataSource = self
    }
}

extension MoreVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        3
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        19
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: width * (70/375), height: width * (70/375))
    }
}

extension MoreVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        16
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = iconCollectionView.dequeueReusableCell(withReuseIdentifier: MoreIconCell.identifier, for: indexPath) as? MoreIconCell else { return UICollectionViewCell() }
        cell.initCell(iconName: menu[indexPath.row])

        return cell
    }
}
