//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by 양중창 on 2021/09/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
                
            CircleImage()
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text("Trutle Rock")
                    .font(.title)
                
                HStack {
                    Text("Joshua Tree National Part")
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Text("California")
                        .font(.subheadline)
                }
                
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                
                Text("Descriptive text fose here.")
                
                test()
                
            }
            .padding()
            
            Spacer()
        }
    }
    
    private func test() -> some View {
        print(landMarks[0])
        return Text("Test")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
