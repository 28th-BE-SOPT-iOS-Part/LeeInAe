//
//  FriendVC.swift
//  28th-assignment-week01
//
//  Created by inae Lee on 2021/04/23.
//

import UIKit

class FriendVC: UIViewController {
    // MARK: - local variables

    static let identifier = "FriendVC"
    private var friendList: [UserDataModel] = []

    // MARK: - IBOutlets

    @IBOutlet var friendTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setFriendList()
        initView()
    }
}

// MARK: - Custom Methods

extension FriendVC {
    func initView() {
        friendTableView.delegate = self
        friendTableView.dataSource = self

        friendTableView.separatorStyle = .none
        friendTableView.estimatedRowHeight = 200
        friendTableView.rowHeight = UITableView.automaticDimension

        let profileNib = UINib(nibName: "ProfileCell", bundle: nil)
        friendTableView.register(profileNib, forCellReuseIdentifier: ProfileCell.identifier)
    }

    func setFriendList() {
        friendList.append(contentsOf: [
            UserDataModel(imageName: "profileImage1",
                          name: "안솝트",
                          state: "배고파요"),

            UserDataModel(imageName: "profileImage2",
                          name: "최솝트",
                          state: "피곤해요"),

            UserDataModel(imageName: "profileImage3",
                          name: "정솝트",
                          state: "시험언제끝나죠?"),

            UserDataModel(imageName: "profileImage4",
                          name: "이솝트",
                          state: "ㅠㅠㅠㅠ"),

            UserDataModel(imageName: "profileImage5",
                          name: "유솝트",
                          state: "나는 상태메세지!"),

            UserDataModel(imageName: "profileImage6",
                          name: "박솝트",
                          state: "원하는대로 바꿔보세요 ^_^"),

            UserDataModel(imageName: "profileImage7",
                          name: "최솝트",
                          state: "넘 덥다.."),

            UserDataModel(imageName: "profileImage8",
                          name: "원솝트",
                          state: "배고파요"),

            UserDataModel(imageName: "profileImage9",
                          name: "투솝트",
                          state: "내꿈은 대나무부자"),

            UserDataModel(imageName: "profileImage10",
                          name: "권솝트",
                          state: "걱정말라구!")

        ])
    }
}

// MARK: - UITableViewDelegate

extension FriendVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Friend", bundle: nil)
        guard let profileDetailVC = storyboard.instantiateViewController(identifier: ProfileDetailVC.identifier) as? ProfileDetailVC else { return }

        profileDetailVC.modalPresentationStyle = .overFullScreen
        present(profileDetailVC, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

// MARK: - UITableviewDataSource

extension FriendVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return friendList.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.identifier) as? ProfileCell else { return UITableViewCell() }

        if indexPath.section == 0 {
            cell.initCell(user: UserDataModel(imageName: "friendtabProfileImg", name: "이내", state: "비 그만.."), isUser: true)
        } else {
            cell.initCell(user: friendList[indexPath.row], isUser: false)
        }

        return cell
    }
}
