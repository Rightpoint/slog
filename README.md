# Slog

[![Swift 3.0](https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat)](https://swift.org)
[![Version](https://img.shields.io/cocoapods/v/Slog.svg?style=flat)](http://cocoapods.org/pods/Slog)
[![License](https://img.shields.io/cocoapods/l/Slog.svg?style=flat)](http://cocoapods.org/pods/Slog)
[![Platform](https://img.shields.io/cocoapods/p/Slog.svg?style=flat)](http://cocoapods.org/pods/Slog)

A simple Swift logging library.

## Basic use

Initialize with a default level, and if emojis should be included in logs:
```Swift-3
let log = Slog(level: .warn)
```

Then you can log with functions for each of the log levels (with their associated emoji):
* 📖 &nbsp; verbose
* 🐝 &nbsp; debug
* ✏️ &nbsp; info
* ⚠️ &nbsp; warn
* ⁉️ &nbsp; error
* off

For example:
```Swift-3
log.error("This is an error!")
```
Setting the level of a log will only print out those logs at that level or above.
```Swift-3
log.level = .verbose
```
You can also initialize a log with a name. You may want to have different logs for App Lifecycle, API, UI, Data, etc. This would allow you to have different logs & set different log levels depending upon what you are trying to monitor or track down. The log name will be printed out as part of any log message for that log.
```Swift-3
let lifeCycleLog = Slog(name:"LifeCycle", level: .verbose, useEmoji: true)
```

You could use this log in the AppDelegate to monitor app lifecycles. For example putting this code in `didFinishLaunchingWithOptions`:
```Swift-3
lifeCycleLog.verbose("App finished launching with options \(launchOptions)")
```

would print:

```
📖|LifeCycle|2017-03-23 10:55:37.193 AppDelegate.swift application(_:didFinishLaunchingWithOptions:) line 22:
App did finish launching with options: nil
```

You can turn off the emoji use during initialization of the log or by setting the log's instance var `useEmoji` to false.

## Example Project

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

Slog is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Slog"
```

## Author

johnstricker, john.stricker@raizlabs.com

## License

Slog is available under the MIT license. See the LICENSE file for more info.
