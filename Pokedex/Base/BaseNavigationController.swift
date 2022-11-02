//
//  BaseNavigationController.swift
//  Pokedex
//
//  Created by İlkay Sever on 1.11.2022.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        leftBackButton()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    func backButton() {
        let yourBackImage = UIImage(named: "back_icon")
        self.navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.backIndicatorImage = yourBackImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    func setNavigationBar() {
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().backgroundColor = .clear
        view.backgroundColor = .clear
    }
    
    func leftBackButton() {
        let backButtonAppearance = UIBarButtonItem.appearance()
        let barButtonAttributes = [NSAttributedString.Key.foregroundColor: UIColor.clear]
        backButtonAppearance.setTitleTextAttributes(barButtonAttributes, for: .normal)
        backButtonAppearance.setTitleTextAttributes(barButtonAttributes, for: .highlighted)
        backButtonAppearance.tintColor = UIColor.white
    }
    
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
    
}
