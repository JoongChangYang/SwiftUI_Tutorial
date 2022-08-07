//
//  ContentView.swift
//  Landmarks
//
//  Created by 양중창 on 2022/07/07.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        VStack {
            MapView()
                .frame(height: 300)
                .ignoresSafeArea()
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            // spacing: VStack 안에 있는 뷰들 사이의 간격
            VStack(alignment: .leading, spacing: 10) {
                self.titleView()
                Divider() // 구분선
                self.descriptionView()
            }
            .padding()
            
            Spacer()
        }
            
    }
    
    private func titleView() -> some View {
        let titleText = Text("Turtle Rockas")
            .font(.title)
        
        let subTitleView = HStack {
            Text("Joshua Tree National Par")
            Spacer() // 가운데 여백
            Text("California")
        }
            .font(.subheadline)
            .foregroundColor(.secondary)
        
        let result = TupleView((titleText, subTitleView))
        return result
    }
    
    private func descriptionView() -> some View {
        let descriptionTitleText = Text("About Turtle Rock")
            .font(.title2)
        
        let descriptionText = Text("Descriptive text goes here.")
        
        let result = TupleView((descriptionTitleText, descriptionText))
        return result
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
