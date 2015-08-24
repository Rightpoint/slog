//
//  Log.swift
//
//  Created by Raizlabs on 11/24/2014.
//  Copyright (c) 2014 Raizlabs. All rights reserved.
//
//
// Makes use of XcodeColors (can also install using alcatraz)
// https://github.com/robbiehanson/XcodeColors

import Foundation

struct Log {
    
    static let isDebugging: Bool = {
        #if DEBUG
            return true
        #else
            return false
        #endif
    }()

    private struct Cmd {
        static let esc = "\u{001b}["
        static let resetFG = esc + "fg;"
        static let resetBG = esc + "bg;"
        static let reset = esc + ";"
    }

    private struct Color {
        static let red = Cmd.esc + "fg240,0,0;"
        static let yellow = Cmd.esc + "fg200,200,0;"
        static let green = Cmd.esc + "fg0,150,0;"
    }

    private static func log<T>(object: T, title: String, color: String, _ fileName: String, _ functionName: String, _ line: Int) {
        let components:[String] = fileName.componentsSeparatedByString("/")
        let objectName = components.last ?? "Unknown Object"
        setenv("XcodeColors", "YES", 0)
        print( color + title + objectName + " : " + functionName + "(\(line))" + Cmd.reset)
        setenv("XcodeColors", "NO", 0)
        debugPrint(object)
    }

    static func error<T>(object: T, _ fileName: String = __FILE__, _ functionName: String = __FUNCTION__, _ line: Int = __LINE__) {
        log(object, title: "ERROR-> ", color: Color.red, fileName, functionName, line)
    }

    static func warning<T>(object: T, _ fileName: String = __FILE__, _ functionName: String = __FUNCTION__, _ line: Int = __LINE__) {
        log(object, title: "WARNING-> ", color: Color.yellow, fileName, functionName, line)
    }

    static func info<T>(object: T, _ fileName: String = __FILE__, _ functionName: String = __FUNCTION__, _ line: Int = __LINE__) {
        if isDebugging {
            log(object, title:"Info-> ", color: Color.green, fileName, functionName, line)
        }
    }
}