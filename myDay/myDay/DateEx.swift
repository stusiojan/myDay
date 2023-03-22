//
//  DateEx.swift
//  myDay
//
//  Created by Jan Stusio on 19/03/2023.
//

import Foundation
//I'm not using this extension, but I won't delete it because it can be useful in the future
extension Date {
    var dateDisplay1: String {
        self.formatted(date: .omitted, time: .complete)
    }
    
    static func dateDiffrence (_ lhs: Date, _ rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}
