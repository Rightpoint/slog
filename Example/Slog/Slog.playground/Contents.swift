//: Playground - noun: a place where people can play

import Slog

let log = Slog(level: .verbose, useEmoji: true)

log.error("Here's an error")

let index = 1000
let array = ["One", "Two", "Three"]

log.check(index: index, isWithinBoundsOf: array)

