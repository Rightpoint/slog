//
//  ViewController.swift
//  SlogExample
//
//  Created by John Stricker on 3/19/17.
//  Copyright © 2017 Raizlabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let log = Slog(level: .error, useEmoji: true)

        let index = 100
        let array = ["one", "two", "three"]

        log.check(index: index, isWithinBoundsOf: array)
    }

}

