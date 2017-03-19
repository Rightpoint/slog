//
//  Slog+CheckError.swift
//  
//
//  Created by John Stricker on 3/17/17.
//
//

// MARK: - Check functions will check if a condition is held. If the condition is true, the function will return true, if its is false the function will return false and log a detailed error.
extension Slog {

    /// Return true if an index is within the bounds of an array
    public func check<T>(index: Int, isWithinBoundsOf array: [T]?, _ fileName: String = #file, _ functionName: String = #function, _ line: Int = #line) -> Bool {

        let count = array?.count ?? 0

        if index < count {
            return true
        } else {
            report(index: index, outOfBoundsFor: array, fileName, functionName, line)
            return false
        }
    }
    
}
