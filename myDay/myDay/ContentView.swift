//
//  ContentView.swift
//  myDay
//
//  Created by Jan Stusio on 19/03/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var activities = Activities()
    @State private var showingAddView = false
    @State private var isAlerted = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(activities.items) {item in
                    NavigationLink {
                        ActivityView(activity: item)
                    }label:{
                        HStack {
                            Text(item.name)
                                .font(.title2)
                            
                            Spacer()
                            
                            Text(item.time)
                                .font(.title3)
                        }
                    }
                }
                .onDelete(perform: removeItem)
            }
//            .onAppear {
//                sortActivities()
//            }
            .listStyle(.plain)
            .navigationTitle("myDay")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar){
                    EditButton()
                        .bold()
                    
                    Button("Reorder", action: sortActivities)
                    Spacer()
                    
                    Button {
                        isAlerted = true
                    } label: {
                        Image(systemName: "minus")
                            .bold()
                    }
                    
                    Button {
                        showingAddView = true
                    } label: {
                        Image(systemName: "plus")
                            .bold()
                    }
                }
            }
            .alert("Clear all?", isPresented: $isAlerted) {
                Button("Clear", action: clearList)
                Button("Cancel", action: cancelClearingList)
            } message: {
                Text("All of your activities will be purged.")
            }
            .sheet(isPresented: $showingAddView) {
                AddView(activities: activities)
            }
        }
    }
    func removeItem(at offsets: IndexSet) {
        activities.items.remove(atOffsets: offsets)
    }
    
    func clearList() {
        activities.items = []
    }
    
    func cancelClearingList() {
        isAlerted = false
    }
    
    func sortActivities() {
        activities.items = activities.items.sorted()
        return
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
