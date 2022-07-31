//
//  View+.swift
//  MVVMExample
//
//  Created by YJC on 2022/07/31.
//

import SwiftUI

extension View {
    
    func emptyNavigationLink<Selection: Hashable, Destination: View>(tag: Selection,
                                                selection: Binding<Selection?>,
                                                @ViewBuilder destination: @escaping () -> Destination) -> some View {
        return NavigationLink(tag: tag, selection: selection, destination: destination, label: { EmptyView() })
    }
}
