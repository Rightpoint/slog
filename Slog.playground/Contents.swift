//: Playground for demonstrating Slog, also contains Slog source files
import Foundation

let log = Slog(level: .verbose, useEmoji: true)

log.error("here is an error")

let index = 400
let array = ["one", "two", "three"]

_ = log.check(index: index, isWithinBoundsOf: array)

