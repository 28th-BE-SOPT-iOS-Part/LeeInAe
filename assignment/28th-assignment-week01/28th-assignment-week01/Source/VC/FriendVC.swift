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

    // MARK: - IBOutlets

    @IBOutlet var friendTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
}

// MARK: - Custom Methods

extension FriendVC {
    func initView() {
        friendTableView.delegate = self
        friendTableView.dataSource = self

        let profileNib = UINib(nibName: "ProfileCell", bundle: nil)
        friendTableView.register(profileNib, forCellReuseIdentifier: ProfileCell.identifier)
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
}

// MARK: - UITableviewDataSource

extension FriendVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.identifier) as? ProfileCell else { return UITableViewCell() }

        return cell
    }
}
