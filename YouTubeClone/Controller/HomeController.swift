//
//  ViewController.swift
//  YouTubeClone
//
//  Created by Michael Miles on 1/28/19.
//  Copyright © 2019 Michael Miles. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var videoArray : [Video] = {
        var kanyeChannel = Channel()
        kanyeChannel.name = "KanyeWest"
        kanyeChannel.profileImageName = "kanye_profile"
        
        var lowLifeVideo = Video()
        lowLifeVideo.title = "Future ft. The Weeknd - Low Life"
        lowLifeVideo.thumbnailImageName = "lowlifethumb"
        lowLifeVideo.channel = kanyeChannel
        
        var stickTalkVideo = Video()
        stickTalkVideo.title = "Future - Stick Talk"
        stickTalkVideo.thumbnailImageName = "sticktalkthumb"
        stickTalkVideo.channel = kanyeChannel
        
        return [lowLifeVideo, stickTalkVideo]
    }()
    
    //collectionView displaying the upper menu
    let menuBar = MenuBar()

    override func viewDidLoad() {
       
        navigationItem.title = "Home"
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        collectionView.backgroundColor = UIColor.white
        
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "cellID")
        
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        
        setupMenuBar()
        setUpNavBarButtons()
    }
    
    //creates bar button items in navbar
    func setUpNavBarButtons() {
        let searchImage = UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(searchPressed))
        
        let moreImage = UIImage(named: "nav_more_icon")?.withRenderingMode(.alwaysOriginal)
        let moreBarButtonItem = UIBarButtonItem(image: moreImage, style: .plain, target: self, action: #selector(morePressed))
        
        navigationItem.rightBarButtonItems = [moreBarButtonItem, searchBarButtonItem]
    }
    
    @objc func searchPressed() {
        print("Search button pressed")
    }
    
    @objc func morePressed() {
        print("More button pressed")
    }
    
    //sets the constraints for the tabBar-type menu bar below NavBar
    private func setupMenuBar() {
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]", views: menuBar)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videoArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! VideoCell
        
        cell.video = videoArray[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //set height programatically...added and subtracted the bounds we already had in nsconstraint
        let height = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: view.frame.width, height: height + 16 + 68)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
