//
//  HomeView.swift
//  SwiftVIPER
//
//  Created by İzmir İnovasyon ve Teknoloji on 9.12.2024.
//

import Foundation
import UIKit

protocol AnyView{
    var presenter : AnyPresenter? {get set}
    func update(with cryptos: [Crypto])
    func update(with error: String)
}

class CryptoViewController : UIViewController, AnyView , UITableViewDelegate,UITableViewDataSource {
   
    
    var presenter: AnyPresenter?
    var cryptos : [Crypto] = []
    
    
    private let messageLabel : UILabel = {
        let label = UILabel()
        label.isHidden = false
        label.text = "Downloading..."
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    
    private let tableView : UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.addSubview(messageLabel)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        messageLabel.frame = CGRect(x: view.frame.width/2 - 100, y: view.frame.height / 2 - 25, width: 200, height: 50)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func update(with cryptos: [Crypto]) {
        DispatchQueue.main.async {
            self.cryptos = cryptos
            self.messageLabel.isHidden = true
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    
    func update(with error: String) {
        print("error")
    }
    
    
}
