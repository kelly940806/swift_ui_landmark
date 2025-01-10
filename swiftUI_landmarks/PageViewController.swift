//
//  PageViewController.swift
//  swiftUI_landmarks
//
//  Created by UCOM-08 on 2025/1/9.
//

import SwiftUI

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    func updateUIViewController(
        _ pageViewController: UIPageViewController, context: Context
    ) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[0]], direction: .forward,
            animated: true)
    }

    var pages: [Page]

    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        return pageViewController
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIPageViewControllerDataSource {
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController
        ) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 { return controllers.last }
            return controllers[index - 1]
        }

        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController
        ) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if (index + 1) == controllers.count { return controllers.first }
            return controllers[index + 1]

        }

        var parent: PageViewController
        var controllers = [UIViewController]()
        init(_ pageViewController: PageViewController) {
            self.parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
    }
}
