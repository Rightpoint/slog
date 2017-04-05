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

    let lifeCycleLog = Slog(name: "LifeCycle", level: .verbose, useEmoji: true)

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        lifeCycleLog.verbose("App did finish launching with options: \(String(describing: launchOptions))")

        return true
    }

}

