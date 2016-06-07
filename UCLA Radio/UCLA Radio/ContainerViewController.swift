//
//  ContainerViewController.swift
//  UCLA Radio
//
//  Created by Christopher Laganiere on 5/15/16.
//  Copyright © 2016 ChrisLaganiere. All rights reserved.
//

import Foundation
import UIKit
import KRLCollectionViewGridLayout

class ContainerViewController: UIViewController {
    
    // Menu
    var rootNavController: UINavigationController!
    
    // Now Playing slider
    var slider: SlidingViewController!
    var nowPlaying: NowPlayingViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menuVC = MenuViewController(collectionViewLayout: KRLCollectionViewGridLayout())
        rootNavController = UINavigationController(rootViewController: menuVC)
        view.addSubview(rootNavController.view)
        addChildViewController(rootNavController)
        rootNavController.didMoveToParentViewController(self)
        rootNavController.view.translatesAutoresizingMaskIntoConstraints = false
        rootNavController.view.frame.size = CGSize(width: rootNavController.view.frame.width, height: rootNavController.view.frame.size.height - NowPlayingView.PreferredHeight)
        rootNavController.navigationBar.barTintColor = Constants.Colors.darkBlue
        // back button color
        rootNavController.navigationBar.tintColor = UIColor.whiteColor()
        // title color
        rootNavController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: Constants.Colors.gold, NSFontAttributeName: UIFont(name: Constants.Fonts.titleBold, size: 21)!]
        
        installNowPlayingSlider()
    }
    
    func installNowPlayingSlider() {
        if slider != nil {
            return
        }
        // set up slider view controller (container)
        slider = SlidingViewController()
        view.addSubview(slider.view)
        addChildViewController(slider)
        slider.didMoveToParentViewController(self)
        view.addConstraints(slider.preferredConstraints())
        
        // set up content (NowPlayingViewController)
        if let nowPlaying = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("nowPlaying") as? NowPlayingViewController {
            self.nowPlaying = nowPlaying
            slider.addContent(nowPlaying)
            
            // set up slider tab (NowPlayingView)
            let tabView = NowPlayingView(canSkipStream: false)
            slider.addTabView(tabView)
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
}
