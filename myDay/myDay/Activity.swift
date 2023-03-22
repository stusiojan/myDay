//
//  Activity.swift
//  myDay
//
//  Created by Jan Stusio on 19/03/2023.
//

import Foundation

struct Activity: Codable, Comparable, Identifiable {
    var id = UUID()
    let name: String
    let time: String
    let startTime: Date
    let endTime: Date
    let description: String
    
    static func <(lhs: Activity, rhs: Activity) -> Bool {
        lhs.startTime < rhs.startTime
    }
}
