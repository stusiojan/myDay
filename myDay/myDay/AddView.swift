//
//  AddView.swift
//  myDay
//
//  Created by Jan Stusio on 19/03/2023.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var description = ""
    @State private var startTime = deflautStartTime
    @State private var endTime = deflautEndTime
    
    private var time: String {
        var duration = startTime.distance(to: endTime) / 60
        var hourCount = 0
        
        while duration > 60 {
            duration -= 60
            hourCount += 1
        }
        
        return hourCount != 0 ? "\(hourCount) h \(duration.formatted())" : duration.formatted()
    }

    static var deflautStartTime: Date {
        var components = DateComponents()
        components.hour = 9
        components.minute = 30
        return Calendar.current.date(from: components) ?? Date.now
    }
    static var deflautEndTime: Date {
        var components = DateComponents()
        components.hour = 10
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    @ObservedObject var activities: Activities
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    TextField("Activity", text: $name)
                    
                    TextField("Description", text: $description)
                    
                    DatePicker("Start", selection: $startTime, displayedComponents: .hourAndMinute)
                    
                    DatePicker("End", selection: $endTime, displayedComponents: .hourAndMinute)
                   
                    HStack {
                        Text("Activity duration")
                        Spacer()
                        Text("\(time) min")
                    }
                    
                }
                .frame(height: 230)
                .scrollContentBackground(.hidden)
                
                HStack {
                    Spacer()
                    
                    Button("Save", action: addNewActivity)
                        .padding()
                        .foregroundColor(.black)
                        .background(.yellow)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.horizontal, 30)
                
                Spacer()
                
            }
            .navigationTitle("Add new activity")
        }
    }
    func addNewActivity() {
        let item = Activity(name: name, time: time,startTime: startTime, endTime: endTime, description: description)
        activities.items.append(item)
        activities.items.sorted()
        dismiss()
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(activities: Activities())
    }
}
