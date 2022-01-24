//
//  HomeViewController.swift
//  Runner
//
//  Created by Rosie Arasa on 1/9/22.
//


// host map button and map
//location manager

import UIKit
import MapKit

class HomeViewController: BaseViewController {

    
    //MARK: - UIElements
    private lazy var startButton: CircularButton = {
        let v = CircularButton()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.borderWidth = 15
        v.borderColor = UIColor.purple
        v.titleText = "Run"
        v.addTarget(self, action: #selector(startRunning), for: .touchUpInside)
        return v
    }()
    
    
    private lazy var topLabel: UILabel  = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.text = "Run"
        v.textAlignment = .center
        v.textColor = .darkGray
        v.font = v.font.withSize(32)
        return v
    }()
    
    
    private lazy var mapView: MKMapView = {
        let v = MKMapView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.alpha = 0.6
        v.delegate = self
        return v
        
    }()
    //MARK: - Lifecycle
    
     //MARK: - LOCAL VARIABLES
    private var locatiobManager = LocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    //MARK: - Helpers
    @objc private func startRunning(){
        let currentRunVC = CurrentRunViewController()
        currentRunVC.modalPresentationStyle = .fullScreen
        present(currentRunVC, animated: true)
    }
    private func setupViews(){
        locatiobManager.checkLocationAuthorization()
        view.addSubview(topLabel)
        view.addSubview(mapView)
        view.addSubview(startButton)
        
    }
    private func setupConstraints(){
        //top label
        NSLayoutConstraint.activate([
            topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topLabel.heightAnchor.constraint(equalToConstant:  50)
        
        ])
        //map view
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 8),
            mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        //start run button
        NSLayoutConstraint.activate([
            startButton.widthAnchor.constraint(equalToConstant: 100),
            startButton.heightAnchor.constraint(equalToConstant: 100),
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }

   

}

//MARK: - extension
extension HomeViewController: MKMapViewDelegate{
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
    }
    
}
