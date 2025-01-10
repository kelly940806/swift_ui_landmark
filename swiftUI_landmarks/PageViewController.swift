//
//  PageViewController.swift
//  swiftUI_landmarks
//
//  Created by UCOM-08 on 2025/1/9.
//

import SwiftUI

struct PageViewController<Page:View>: UIViewControllerRepresentable {
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers([UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
    }
    
    var pages: [Page]
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        return pageViewController
    }
    
}
