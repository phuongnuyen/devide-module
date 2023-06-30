//
//  ViewController.swift
//  TestUIkit
//
//  Created by Phuong Nguyen on 23/02/2023.
//


import UIKit
import TestFramework
import SnapKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let badge = BadgeLabel(typeProperty: .primary(property: .informative))
        
        self.view.addSubview(badge)
        badge.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
