//
//  AppDelegate.swift
//  Task1
//
//  Created by Vladislav Kondrashkov on 3/1/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let firstMatrixContainer = [
            [1, 2, 3],
            [4, 5, 6]
        ]
        let firstMatrix = Matrix(container: firstMatrixContainer)

        let secondMatrixContainer = [
            [1, 2, 3],
            [4, 5]
        ]
        let secondMatrix = Matrix(container: secondMatrixContainer)

        return true
    }
}
