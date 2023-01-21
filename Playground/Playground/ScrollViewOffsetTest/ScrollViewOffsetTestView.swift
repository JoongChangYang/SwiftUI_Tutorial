//
//  ScrollViewOffsetTestView.swift
//  Playground
//
//  Created by YJC on 2023/01/21.
//

import SwiftUI

struct ScrollViewOffsetTestView: View {
    private let data = (1...100).map { String($0) }
    @State private var direct = Direct.none
    @State private var offset: CGFloat = .zero
    var body: some View {
        ZStack(alignment: .top) {
            self.scrollView
            Color.pink
                .frame(height: 50)
                .ignoresSafeArea()
        }
    }
}

extension ScrollViewOffsetTestView {
    enum Direct: String {
        case none
        case up
        case down
    }
    
    struct HeaderView: View {
        @Binding var direct: Direct
        @Binding var offset: CGFloat
        
        var body: some View {
            LazyVStack {
                Text("drect: \(self.direct.rawValue)")
                Text("offset: \(self.offset)")
                Color.secondary
                    .frame(height: 1)
            }
        }
    }
    
    struct RowView: View {
        let title: String
        var body: some View {
            HStack {
                Text(title)
                Spacer()
            }
            .padding()
            .background(.green)
            .cornerRadius(12)
            .padding(.horizontal)
        }
    }
    
    struct ScrollOffsetKey: PreferenceKey {
        static var defaultValue: CGFloat = 0
        
        static func reduce(value: inout Value, nextValue: () -> Value) {
            print("value: \(value)")
            let nextValue = nextValue()
            print("nextValue: \(nextValue)")
            let result = value + nextValue
            print("result: \(result)")
            value = result
        }
        
    }
}

extension ScrollViewOffsetTestView {
    private var scrollView: some View {
        ScrollView {
            self.offsetTracker
            
            LazyVStack {
                Section {
                    ForEach(self.data, id: \.self) { id in
                        RowView(title: id)
                    }
                } header: {
                    HeaderView(direct: self.$direct,
                               offset: self.$offset)
                }
            }
        }
        .onPreferenceChange(ScrollOffsetKey.self) { offset in
//            print("offset: \(offset)")
        }
    }
    
    private var offsetTracker: some View {
        GeometryReader { proxy in
            let offsetY = proxy.frame(in: .named("ScrollView"))
            print("proxy:", offsetY)
            return Color.blue
//                .preference(key: ScrollOffsetKey.self,
//                            value: offsetY)
        }
        .frame(height: 10)
    }
}

struct ScrollViewOffsetTestView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewOffsetTestView()
    }
}
