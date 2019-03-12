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

    func ascendedByModule() -> Matrix {
        var sorted = false
        while !sorted {
            sorted = true
            for index in 0..<(matrix.columnsCount - 1) {
                let currentColumnModule = calculateColumnModule(at: index)
                let nextColumnModule = calculateColumnModule(at: index + 1)
                if currentColumnModule < nextColumnModule {
                    sorted = false
                    matrix = swapColumns(at: index, index + 1)
                }
            }
        }
        return matrix
    }

    private func swapColumns(at firstIndex: Int,_ secondIndex: Int) -> Matrix {
        var container = matrix.content
        for index in 0..<matrix.rowsCount {
            let secondElement = container[index][secondIndex]
            let firstElement = container[index].remove(at: firstIndex)
            container[index].insert(secondElement, at: firstIndex)
            container[index].remove(at: secondIndex)
            container[index].insert(firstElement, at: secondIndex)
        }
        return Matrix(container: container) ?? matrix
    }

    private func calculateColumnModule(at index: Int) -> Int {
        let column = matrix.column(at: index)
        let module = column.reduce(0, +)
        return module
    }
}
