//
//  TabView.swift
//  EdvoraSR
//
//  Created by Prajjwal on 19/03/22.
//

import SwiftUI

struct TabView: View {
    @State var stateName  : String
   
    var body: some View {
        HStack{
            
            Text(stateName)
            
            
            
            
        }
        
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
