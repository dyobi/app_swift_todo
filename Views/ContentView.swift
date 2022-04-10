//
//  ContentView.swift
//  ToDo
//
//  Created by Dyobi on 4/9/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var realmManager = RealmManager()
    @State private var showAddTaskView: Bool = false
    
    var body: some View {
        
        ZStack (alignment: .bottomTrailing) {
            
            TasksView()
                .environmentObject(realmManager)
            
            SmallAddbutton()
                .padding()
                .onTapGesture {
                    showAddTaskView.toggle()
                }
            
        } // ZStack
        .sheet(isPresented: $showAddTaskView) {
            AddTaskView()
                .environmentObject(realmManager)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    
    } // body
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
