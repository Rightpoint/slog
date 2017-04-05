# Slog

[![Swift 3.0](https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat)](https://swift.org)
[![Version](https://img.shields.io/cocoapods/v/Slog.svg?style=flat)](http://cocoapods.org/pods/Slog)
[![License](https://img.shields.io/cocoapods/l/Slog.svg?style=flat)](http://cocoapods.org/pods/Slog)
[![Platform](https://img.shields.io/cocoapods/p/Slog.svg?style=flat)](http://cocoapods.org/pods/Slog)

A simple Swift logging library.

## Basic use

Initialize with a default level:
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

The use of emojis defaults to `true`, you can set it to false either during initialization or by setting the `useEmoji` instance var.  

For example:

```swift
log.error("This is an error!")
```
Setting the level of a log will only print out those logs at that level or above.

```swift
log.level = .verbose
```
You can also initialize a log with a name. You may want to have different logs for App Lifecycle, API, UI, Data, etc. This would allow you to have different logs & set different log levels depending upon what you are trying to monitor or track down. The log name will be printed out as part of any log message for that log.

```swift
let lifeCycleLog = Slog(name:"LifeCycle", level: .verbose, useEmoji: true)
```

You could use this log in the AppDelegate to monitor app lifecycles. For example putting this code in `didFinishLaunchingWithOptions`:

```swift
lifeCycleLog.verbose("App finished launching with options \(String(description: launchOptions))")
```

would print:

```
📖|LifeCycle|2017-03-23 10:55:37.193 AppDelegate.swift application(_:didFinishLaunchingWithOptions:) line 22:
App did finish launching with options: nil
```

## Example Project

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

Slog is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Slog"
```

If you don't want to use the check and report features, then you can use the LogOnly subspec:

```ruby
pod "Slog/LogOnly"
```

## Author

John Stricker, john.stricker@raizlabs.com

## License

Slog is available under the MIT license. See the LICENSE file for more info.
