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
        let container = [
            [2, 5, 6, -5, 0],
            [10, 20, 30, -28, 0],
            [-20, 13, 0, 2, 0],
            [3, 2, 1, 2, 0]
        ]
        let matrix = Matrix(container: container)
        let formatter = MatrixFormatter(for: matrix)

        let newMatrix = formatter.ascendedByModule()
        let test = matrix == newMatrix
        return true
    }
}
