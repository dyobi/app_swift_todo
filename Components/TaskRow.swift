//
//  TaskRow.swift
//  ToDo
//
//  Created by Dyobi on 4/9/22.
//

import SwiftUI

struct TaskRow: View {
    
    var task: String
    var completed: Bool
    
    var body: some View {
        
        HStack (spacing: 20) {
            
            Image(systemName: completed ? "checkmark.circle" : "circle")
            
            Text(task)
            
        } // HStack
        
    } // body
    
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: "Do laundry", completed: true)
    }
}
