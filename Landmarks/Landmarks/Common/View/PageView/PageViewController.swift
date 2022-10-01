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
    
    @Binding
    var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll,
                                                      navigationOrientation: .horizontal,
                                                      options: nil)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers([context.coordinator.controllers[self.currentPage]],
                                              direction: .forward,
                                              animated: true)
    }
}

extension PageViewController {
    final class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers = [UIViewController]()

        init(_ pageViewController: PageViewController) {
            self.parent = pageViewController
            self.controllers = self.parent.pages.map { UIHostingController(rootView: $0) }
            
            self.controllers.enumerated().forEach { $0.element.title = "\($0.offset)" }
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = self.controllers.firstIndex(of: viewController) else { return nil }
            
            if index == 0 {
                return self.controllers.last
            }
            
            return self.controllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = self.controllers.firstIndex(of: viewController) else { return nil }
            
            if index + 1 == self.controllers.count {
                return self.controllers.first
            }
            
            return self.controllers[index + 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            guard completed,
                  let visibleViewController = pageViewController.viewControllers?.first,
                  let index = self.controllers.firstIndex(of: visibleViewController)
            else { return }
            
            self.parent.currentPage = index
        }
    }
}
