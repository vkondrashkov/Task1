//
//  Matrix.swift
//  Task1
//
//  Created by Vladislav Kondrashkov on 3/1/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

class Matrix {
    private var container: [[Int]] = []

    var content: [[Int]] {
        return container
    }

    var columnsCount: Int {
        return row(at: 0).count
    }

    var rowsCount: Int {
        return column(at: 0).count
    }

    init?(container: [[Int]]) {
        guard let columnsCount = container.first?.count else {
            return nil
        }
        let unsuitableElements = container.filter { $0.count != columnsCount }
        guard unsuitableElements.count == 0 else {
            return nil
        }
        self.container = container
    }

    func row(at index: Int) -> [Int] {
        return container[index]
    }

    func column(at index: Int) -> [Int] {
        var column: [Int] = []
        for row in container {
            column.append(row[index])
        }
        return column
    }
}

// MARK: - Equatable implementation
extension Matrix: Equatable {
    public static func == (lhs: Matrix, rhs: Matrix) -> Bool {
        guard lhs.columnsCount == rhs.columnsCount && lhs.rowsCount == rhs.rowsCount else {
            return false
        }
        for index in 0..<lhs.rowsCount {
            let lhsRow = lhs.row(at: index)
            let rhsRow = rhs.row(at: index)
            guard lhsRow == rhsRow else {
                return false
            }
        }
        return true
    }
}
