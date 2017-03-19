//
//  Log.swift
//  Slog: a simple swift logger
//
//  Created by John Stricker on 3/17/17.
//
//

import Foundation

open class Slog {
    // MARK: Configuration

    /// Represents a level of detail to be logged.
    public enum Level: Int {
        case verbose
        case debug
        case info
        case warn
        case error
        case off

        var name: String {
            switch self {
            case .verbose: return "Verbose"
            case .debug: return "Debug"
            case .info: return "Info"
            case .warn: return "Warn"
            case .error: return "Error"
            case .off: return "Disabled"
            }
        }

        var emoji: String {
            switch self {
            case .verbose: return "📖"
            case .debug: return "🐝"
            case .info: return "✏️"
            case .warn: return "⚠️"
            case .error: return "⁉️"
            case .off: return ""
            }
        }
    }

    /// The log level, defaults to .Off
    public var logLevel: Level = .off

    /// If true, prints emojis to signify log type, defaults to off
    public var useEmoji: Bool = false

    // MARK: Private
    /// Date formatter for log
    fileprivate let dateformatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "Y-MM-dd H:m:ss.SSS"
        return df
    }()

    // MARK: Init

    /// Initialize the Log
    ///
    /// - Parameters:
    ///   - level: The minimum log level (.verbose for all)
    ///   - useEmoji: If true, use emoji as part of logging
    public init(level: Level, useEmoji: Bool = false) {
        self.logLevel = level
        self.useEmoji = useEmoji
    }

    // MARK: Log Methods
    public func error<T>(_ object: @autoclosure () -> T, _ fileName: String = #file, _ functionName: String = #function, _ line: Int = #line) {
        log(object, level:.error, fileName, functionName, line)
    }

    public func warn<T>(_ object: @autoclosure () -> T, _ fileName: String = #file, _ functionName: String = #function, _ line: Int = #line) {
        log(object, level:.warn, fileName, functionName, line)
    }

    public func info<T>(_ object: @autoclosure () -> T, _ fileName: String = #file, _ functionName: String = #function, _ line: Int = #line) {
        log(object, level:.info, fileName, functionName, line)
    }

    public func debug<T>(_ object: @autoclosure () -> T, _ fileName: String = #file, _ functionName: String = #function, _ line: Int = #line) {
        log(object, level:.debug, fileName, functionName, line)
    }

    public func verbose<T>(_ object: @autoclosure () -> T, _ fileName: String = #file, _ functionName: String = #function, _ line: Int = #line) {
        log(object, level:.verbose, fileName, functionName, line)
    }

    /// Generic log method
    fileprivate func log<T>(_ object: @autoclosure () -> T, level: Slog.Level, _ fileName: String, _ functionName: String, _ line: Int) {
        if logLevel.rawValue <= level.rawValue {
            let date = dateformatter.string(from: Date())
            let components: [String] = fileName.components(separatedBy: "/")
            let objectName = components.last ?? "Unknown Object"
            let levelString = useEmoji ? level.emoji : "|" + level.name.uppercased() + "|"
            print("\(levelString)\(date) \(objectName) \(functionName) line \(line):\n\(object())\n")
        }
    }
}
