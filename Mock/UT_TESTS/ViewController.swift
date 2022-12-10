//
//  ViewController.swift
//  UT_TESTS
//
//  Created by Bob on 2022/12/09.
//

import UIKit

//擬似通信・DBデータの型
struct User {
    let name: String
}

//擬似通信・DBデータ
let data: [User] = [
    User(name: "mothule-1"),
    User(name: "mothule-2"),
    User(name: "mothule-3"),
    User(name: "mothule-4"),
    User(name: "mothule-5"),
    User(name: "mothule-6"),
    User(name: "mothule-7")
]

class ViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    private let dataSource = DataSource()

    private var users: [User] = [] {
        didSet {
            dataSource.setupModel(users)
            tableView?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //通信による遅延時間の再現
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: { [weak self ] in
            self?.users = data
        })
    }
}

class DataSource: NSObject, UITableViewDataSource {
    private var models: [User] = []

    func setupModel(_ models: [User]) {
        self.models = models
    }

    //モジュール件数の確認
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    //確認した件数分のモジュールをテーブルセルに設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ??
                    UITableViewCell(style: .default, reuseIdentifier: "cell")
        let model = models[indexPath.row]
        cell.textLabel?.text = model.name
        return cell
    }
}



