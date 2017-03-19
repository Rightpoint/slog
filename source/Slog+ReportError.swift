//
//  Slog+ReportError.swift
//  
//
//  Created by John Stricker on 3/17/17.
//
//

// MARK: - Report functions will log detailed errors for common error states.
extension Slog {

    /// Report Index out of bounds for an array
    func report<T>(index: Int, outOfBoundsFor array: [T]?, count: Int? = nil, _ fileName: String = #file, _ functionName: String = #function, _ line: Int = #line) {

        guard let array = array else {
            error("Index \(index) is out of bounds for nil array", fileName, functionName, line)
            return
        }

        let count = count ?? array.count

        error("Index \(index) is out of bounds of \(array) with count: \(count)", fileName, functionName, line)
    }

    /// Report if a nil is expected for a value
    func report(unexpectedNil name: String,  _ fileName: String = #file, _ functionName: String = #function, _ line: Int = #line) {
        error("\(name) was nil when a value was expected")
    }

}
