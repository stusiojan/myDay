//
//  ActivityView.swift
//  myDay
//
//  Created by Jan Stusio on 19/03/2023.
//

import SwiftUI

struct ActivityView: View {
    let activity: Activity
    
    var body: some View {
        VStack {
            Image(systemName: "flame")
                .font(.title)
            Text(activity.name)
                .font(.largeTitle)
            Text(activity.description)
            Text("Activity duration: \(String(activity.time)) min")
            Text("Started at: \(activity.startTime.formatted(date: .omitted, time: .shortened))")
            Text("Ended at: \(activity.endTime.formatted(date: .omitted, time: .shortened))")
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static let activities: Activity = Activity(name: "Guitar", time: "30", startTime: Date.now, endTime: Date.now, description: "Play guitar")
    
    static var previews: some View {
        ActivityView(activity: activities)
    }
}
