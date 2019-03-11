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

    func testNumPadMatrix() {
        // Given
        let matrixBuider: MatrixBuilder = [
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9]
        ]
        guard let matrix = matrixBuider.build() else {
            XCTFail()
            return
        }

        // When
        let matrixFormatter = MatrixFormatter(for: matrix)
        let ascendedMatrix = matrixFormatter.ascendedByModule()

        // Then
        let container: [[Int]] = [
            [3, 2, 1],
            [6, 5, 4],
            [9, 8, 7]
        ]
        let expectedMatrix = Matrix(container: container)
        XCTAssertEqual(ascendedMatrix, expectedMatrix)
    }

    func testEmptyMatrix() {
        // Given
        let matrixBuilder: MatrixBuilder = [
            []
        ]

        // When
        let matrix = matrixBuilder.build()

        // Then
        XCTAssertNil(matrix)
    }

    func testWrongMatrix() {
        // Given
        let matrixBuilder: MatrixBuilder = [
            [1, 2, 3],
            [4, 5]
        ]

        // When
        let matrix = matrixBuilder.build()

        // Then
        XCTAssertNil(matrix)
    }

    func testAscendedMatrix() {
        // Given
        let matrixBuilder: MatrixBuilder = [
            [3, 2, 1],
            [6, 5, 4]
        ]
        guard let matrix = matrixBuilder.build() else {
            XCTFail()
            return
        }

        // When
        let matrixFormatter = MatrixFormatter(for: matrix)
        let ascendedMatrix = matrixFormatter.ascendedByModule()

        // Then
        let container: [[Int]] = [
            [3, 2, 1],
            [6, 5, 4]
        ]
        let expectedMatrix = Matrix(container: container)
        XCTAssertEqual(ascendedMatrix, expectedMatrix)
    }

    func testDianaMatrix() {
        // Given
        let matrixBuilder: MatrixBuilder = [
            [15, 0, -4],
            [2, 10, 3],
            [4, 9, 23]
        ]
        guard let matrix = matrixBuilder.build() else {
            XCTFail()
            return
        }

        // When
        let matrixFormatter = MatrixFormatter(for: matrix)
        let ascendedMatrix = matrixFormatter.ascendedByModule()

        // Then
        let container: [[Int]] = [
            [-4, 15, 0],
            [3, 2, 10],
            [23, 4, 9]
        ]
        let expectedMatrix = Matrix(container: container)
        XCTAssertEqual(ascendedMatrix, expectedMatrix)
    }
}
