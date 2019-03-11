//
//  Task1Tests.swift
//  Task1Tests
//
//  Created by Vladislav Kondrashkov on 3/1/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

import XCTest
@testable import Task1

class Task1Tests: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test123Matrix() {
        let container: [[Int]] = [
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9]
        ]
        let expectedContainer: [[Int]] = [
            [3, 2, 1],
            [6, 5, 4],
            [9, 8, 7]
        ]
        let matrix = Matrix(container: container)
        let matrixFormatter = MatrixFormatter(for: matrix)
        let ascendedMatrix = matrixFormatter.ascendedByModule()

        let expectedMatrix = Matrix(container: expectedContainer)
        XCTAssertEqual(ascendedMatrix, expectedMatrix, "Matrix ascended is not ascended by module!")
    }

    func testEmptyMatrix() {
        let container: [[Int]] = [
            []
        ]
        let expectedContainer: [[Int]] = [
            []
        ]
        let matrix = Matrix(container: container)
        let matrixFormatter = MatrixFormatter(for: matrix)
        let ascendedMatrix = matrixFormatter.ascendedByModule()

        let expectedMatrix = Matrix(container: expectedContainer)
        XCTAssertEqual(ascendedMatrix, expectedMatrix, "Expected empty matrix!")
    }

    func testAscendedMatrix() {
        let container: [[Int]] = [
            [3, 2, 1],
            [6, 5, 4]
        ]
        let expectedContainer: [[Int]] = [
            [3, 2, 1],
            [6, 5, 4]
        ]
        let matrix = Matrix(container: container)
        let matrixFormatter = MatrixFormatter(for: matrix)
        let ascendedMatrix = matrixFormatter.ascendedByModule()

        let expectedMatrix = Matrix(container: expectedContainer)
        XCTAssertEqual(ascendedMatrix, expectedMatrix, "Matrix ascended is not ascended by module!")
    }

    func testDianaMatrix() {
        // given
        let container: [[Int]] = [
            [15, 0, -4],
            [2, 10, 3],
            [4, 9, 23]
        ]
        let matrix = Matrix(container: container)

        // when
        let matrixFormatter = MatrixFormatter(for: matrix)
        let ascendedMatrix = matrixFormatter.ascendedByModule()


        // then
        let expectedContainer: [[Int]] = [
            [-4, 15, 0],
            [3, 2, 10],
            [23, 4, 9]
        ]
        let expectedMatrix = Matrix(container: expectedContainer)
        XCTAssertEqual(ascendedMatrix, expectedMatrix, "Matrix ascended is not ascended by module!")
    }
}
