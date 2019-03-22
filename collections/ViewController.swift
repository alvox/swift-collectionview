//
//  ViewController.swift
//  collections
//
//  Created by alexander on 3/21/19.
//  Copyright © 2019 Alexander Popov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var wrapper = Wrapper()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        add(wrapper, frame: view.frame)
    }

}

