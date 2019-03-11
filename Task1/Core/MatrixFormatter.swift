//
//  MatrixFormatter.swift
//  Task1
//
//  Created by Vladislav Kondrashkov on 3/1/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

private struct ModuleNode {
    let index: Int
    let value: Int
}

class MatrixFormatter {
    private var matrix: Matrix

    init(for matrix: Matrix) {
        self.matrix = matrix
    }

//    TODO:
//    func ascendedByModule() -> Matrix

    private func swapColumns(at firstIndex: Int,_ secondIndex: Int) -> Matrix {
        var container = matrix.content
        for index in 0..<matrix.rowsCount {
            let secondElement = container[index][secondIndex]
            let firstElement = container[index].remove(at: firstIndex)
            container[index].insert(secondElement, at: firstIndex)
            container[index].remove(at: secondIndex)
            container[index].insert(firstElement, at: secondIndex)
        }
        return Matrix(container: container)!
    }

    private func calculateColumnModule(at index: Int) -> Int {
        let column = matrix.column(at: index)
        let module = column.reduce(0, +)
        return module
    }
}
