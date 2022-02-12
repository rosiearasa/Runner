//
//  HistoryViewController.swift
//  Runner
//
//  Created by Rosie Arasa on 1/9/22.
//

import UIKit

class HistoryViewController: BaseViewController {
    private static let reuseId = "REUSEID"
    
    //MARK: - UI Elements
    private lazy var topLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.text = "Run Logs"
        v.textAlignment = .center
        v.textColor = .darkGray
        v.font = v.font.withSize(32)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var tableView: UITableView = {
        let v = UITableView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.allowsSelection = false
        v.dataSource = self
        v.register(HistoryTableViewCell.self, forCellReuseIdentifier: Self.reuseId)
        v.backgroundColor = .clear
        v.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        v.separatorColor = .white
        return v
    }()
    
    //MARK: - View lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews(){
        view.addSubview(topLabel)
        view.addSubview(tableView)
    }
    
    private func setupConstraints(){
        // top Label
        NSLayoutConstraint.activate([
            topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topLabel.heightAnchor.constraint(equalToConstant: 50)
        
        ])
        //tableview
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topLabel.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
    }


}
//MARK: - Extensions
extension HistoryViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.reuseId) as? HistoryTableViewCell else{
            return UITableViewCell()
        }
        cell.totalMiles = Double(indexPath.row)
        cell.totalTime = "0:23:33"
        cell.entryDate = "02/10/2021"
        return cell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
