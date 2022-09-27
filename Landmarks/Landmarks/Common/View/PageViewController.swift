//
//  PageViewController.swift
//  Landmarks
//
//  Created by YJC on 2022/09/27.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
}
