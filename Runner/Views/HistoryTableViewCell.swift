//
//  HistoryTableViewCell.swift
//  Runner
//
//  Created by Rosie Arasa on 1/23/22.
//

import UIKit

final class HistoryTableViewCell: UITableViewCell {
    //MARK: - External Variables
    var totalMiles: Double = 0.0{
        didSet{
            totalMilesLabel.text = String(format: "%0.1f", totalMiles)
            layoutIfNeeded()
        }
    }
    
    var totalTime: String = "00:02:12"{
        didSet{
            totalMilesLabel.text = String(format: "%0.1f", totalMiles)
            layoutIfNeeded()
        }
    }
    
    var entryDate: String = "22/01/2022"{
        didSet{
           entryDateLabel.text = entryDate
            layoutIfNeeded()
        }
    }
    
    //MARK: - UI Elements
    
    private lazy var totalMilesLabel: UILabel =  {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.text = "0.0"
        v.textColor = .white
        v.font = UIFont.boldSystemFont(ofSize: 24)
        return v
    }()
    private lazy var totalTimeLabel: UILabel =  {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.text = "0.0"
        v.textColor = .white
        v.font = v.font.withSize(18)
        return v
    }()
    private lazy var entryDateLabel: UILabel =  {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.text = "0.0"
        v.textColor = .white
        v.font = v.font.withSize(18)
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews(){
        backgroundColor = UIColor.black.withAlphaComponent(0.1)
        contentView.addSubview(totalMilesLabel)
        contentView.addSubview(totalTimeLabel)
        contentView.addSubview(entryDateLabel)
    }
    
    private func setupConstrains(){
        
    }
    
}
