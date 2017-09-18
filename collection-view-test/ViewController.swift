//
//  ViewController.swift
//  collection-view-test
//
//  Created by Henrique Nascimento on 2017-09-17.
//  Copyright © 2017 Henrique Nascimento. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let reuseIdentifier = "collectionCell"
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = true
        
        print("Setting initial dimesions")
        setCollectionViewDimensions()
    }
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        setCollectionViewDimensions()
    }
    
    private func setCollectionViewDimensions() {
        let orient = UIApplication.shared.statusBarOrientation
        
        if (orient.isPortrait) {
            print("Portrait")
            let width = self.view.frame.width * 0.85
            let height = width
            
            let x = (self.view.frame.width - width) / 2
            let y = (self.view.frame.height - width) / 2
            
            collectionView.frame = CGRect(x: x, y: y, width: width, height: height)
        } else {
            print("LandScape")
            let width = self.view.frame.width * 0.70
            let height = width
            
            let x = (self.view.frame.width - width) / 2
            let y = (self.view.frame.height - width) / 2
            
            collectionView.frame = CGRect(x: x, y: y, width: width, height: height)
        }
        
        collectionView.reloadData()
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth: CGFloat = collectionView.frame.width / 4
        let itemHeight: CGFloat = collectionView.frame.height / 4
        return CGSize(width: itemWidth, height: itemHeight)
    }
}
