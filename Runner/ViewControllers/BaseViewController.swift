//
//  BaseViewController.swift
//  Runner
//
//  Created by Rosie Arasa on 1/9/22.
//

import UIKit

class BaseViewController: UIViewController {
   
    //MARK: - To DO - UNDERSTAND THIS STRUCTURE OF CODE
    private lazy var backgroundLayer: GradientView = {
        let v = GradientView(colors: [UIColor.systemRed,UIColor.systemPink,   UIColor.systemPurple ])
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        
    }
    private func setupViews(){
        view.addSubview(backgroundLayer)
    }
    
    private func setupConstraints() {
        //background layer
        NSLayoutConstraint.activate([
            backgroundLayer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundLayer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundLayer.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundLayer.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}
