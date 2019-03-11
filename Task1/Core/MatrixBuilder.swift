//
//  MatrixBuilder.swift
//  Task1
//
//  Created by Vladislav Kondrashkov on 3/11/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

class MatrixBuilder: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Array<Int>

    private var container: [ArrayLiteralElement] = []

    required init(arrayLiteral elements: Array<Int>...) {
        container = elements
    }

    func build() -> Matrix? {
        guard let columnsCount = container.first?.count, columnsCount != 0 else {
            return nil
        }

        let unsuitableRows = container.filter { $0.count != columnsCount }
        guard unsuitableRows.count == 0 else {
            return nil
        }

        return Matrix(container: container)
    }
}
