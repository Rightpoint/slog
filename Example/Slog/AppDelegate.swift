//
//  AppDelegate.swift
//  Slog
//
//  Created by johnstricker on 03/19/2017.
//  Copyright (c) 2017 johnstricker. All rights reserved.
//

import UIKit
import Slog

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let log = Slog(name: "TEST", level: .verbose, useEmoji: true)

        log.error("Here's an error")

        let index = 1000
        let array = ["one", "two", "three"]

        if log.check(index: index, isWithinBoundsOf: array) {
            print(array[index])
        }

        return true
    }

}

