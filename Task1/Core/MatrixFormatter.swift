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
        var data: [ModuleNode] = []
        for index in 0..<matrix.columnsCount {
            let value = calculateColumnModule(at: index)
            data.append(ModuleNode(index: index, value: value))
        }
        data.sort(by: { $0.value > $1.value })

        var currentIndex = 0
        for node in data {
            guard node.index > currentIndex else {
                currentIndex += 1
                continue
            }
            matrix = swapColumns(at: currentIndex, node.index)
            currentIndex += 1
        }

        return matrix
    }

    private func swapColumns(at firstIndex: Int,_ secondIndex: Int) -> Matrix {
        var container = matrix.container
        for index in 0..<matrix.rowsCount {
            let secondElement = container[index][secondIndex]
            let firstElement = container[index].remove(at: firstIndex)
            container[index].insert(secondElement, at: firstIndex)
            container[index].remove(at: secondIndex)
            container[index].insert(firstElement, at: secondIndex)
        }
        return Matrix(container: container)
    }

    private func calculateColumnModule(at index: Int) -> Int {
        let column = matrix.column(at: index)
        var module = 0
        for element in column {
            module += abs(element)
        }
        return module
    }
}
