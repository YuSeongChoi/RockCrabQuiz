//
//  RockTurtleQuizApp.swift
//  RockTurtleQuiz
//
//  Created by YuSeongChoi on 9/13/24.
//

import SwiftUI

@main
struct RockTurtleQuizApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
            }
        }
    }
    
    @MainActor
        init() {
            let barAppearance: UINavigationBarAppearance = {
                let appearance = UINavigationBarAppearance()
                appearance.configureWithDefaultBackground()
                appearance.backgroundColor = .white
                appearance.backButtonAppearance.normal.titleTextAttributes[.foregroundColor] = UIColor.clear
                appearance.backButtonAppearance.normal.titleTextAttributes[.font] = UIFont.boldSystemFont(ofSize: 17)
                let inset = UIEdgeInsets(top: 0, left: -15, bottom: 0, right: 0)
                let indicator = appearance.backIndicatorImage.withAlignmentRectInsets(inset).withTintColor(.black, renderingMode: .alwaysOriginal)
                let transition = appearance.backIndicatorTransitionMaskImage.withAlignmentRectInsets(inset).withTintColor(.black, renderingMode: .alwaysOriginal)
                appearance.setBackIndicatorImage(indicator, transitionMaskImage: transition)
                return appearance
            }()
            let naviProxy = UINavigationBar.appearance(whenContainedInInstancesOf: [UINavigationController.self])
            naviProxy.standardAppearance = barAppearance
            naviProxy.barTintColor = .white
            naviProxy.tintColor = .black
            
            
            do {
                try RockTurtleQuizFont.register()
            } catch {
                print(error)
            }
        }
}
