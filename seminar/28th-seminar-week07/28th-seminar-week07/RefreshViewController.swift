//
//  RefreshViewController.swift
//  28th-seminar-week07
//
//  Created by inae Lee on 2021/05/29.
//

import Lottie
import UIKit

class RefreshViewController: UIViewController {
    @IBOutlet var sampleTableView: UITableView!
    
    let sampleList: [String] = ["A", "B", "C", "D", "E"]
    
    lazy var lottieView: AnimationView = {
        let animationView = AnimationView(name: "7thSeminar_Lottie_sample")
        animationView.frame = CGRect(x: 0, y: 0,
                                     width: 50, height: 50)
    
        let centerX = UIScreen.main.bounds.width / 2
        animationView.center = CGPoint(x: centerX, y: 40)
        animationView.contentMode = .scaleAspectFit
        animationView.stop()
        animationView.isHidden = true
    
        return animationView
    }()

    let refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sampleTableView.delegate = self
        sampleTableView.dataSource = self
        
        sampleTableView.register(UINib(nibName: RefreshTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: RefreshTableViewCell.identifier)
        initRefresh()
    }
    
//    func initRefresh() {
//        refreshControl.addTarget(self, action: #selector(refreshTable(refresh:)), for: .valueChanged)
//        sampleTableView.refreshControl = refreshControl
//    }
    
    func initRefresh() {
        refreshControl.addTarget(self, action: #selector(refreshTable(refresh:)), for: .valueChanged)
        refreshControl.addSubview(lottieView)
        refreshControl.tintColor = .clear
        sampleTableView.refreshControl = refreshControl
    }

    @objc func refreshTable(refresh: UIRefreshControl) {
        print("새로고침!")
        lottieView.isHidden = false
        lottieView.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.sampleTableView.reloadData()
            self.lottieView.isHidden = true
            self.lottieView.stop()
            refresh.endRefreshing()
        }
    }
}

extension RefreshViewController: UITableViewDelegate {}

extension RefreshViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sampleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sampleCell = tableView.dequeueReusableCell(withIdentifier: RefreshTableViewCell.identifier) as? RefreshTableViewCell else { return UITableViewCell() }
        
        sampleCell.setData(data: sampleList[indexPath.row])
        
        return sampleCell
    }
}

extension RefreshViewController: UIScrollViewDelegate {}
