//
//  SmallAddbutton.swift
//  ToDo
//
//  Created by Dyobi on 4/9/22.
//

import SwiftUI

struct SmallAddbutton: View {
    
    var body: some View {
    
        ZStack {
            
            Circle()
                .frame(width: 50)
                .foregroundColor(Color(hue: 0.328, saturation: 0.796, brightness: 0.408))
            
            Text("+")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
            
        } // ZStack
        .frame(height: 50)
        
    } // body
    
}

struct SmallAddbutton_Previews: PreviewProvider {
    static var previews: some View {
        SmallAddbutton()
    }
}
