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
        let givenContainer: [[Int]] = [
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9]
        ]
        guard let matrix = Matrix(container: givenContainer) else {
            XCTFail()
            return
        }

        // When
        let matrixFormatter = MatrixFormatter(for: matrix)
        let ascendedMatrix = matrixFormatter.ascendedByModule()

        // Then
        let expectedContainer: [[Int]] = [
            [3, 2, 1],
            [6, 5, 4],
            [9, 8, 7]
        ]
        let expectedMatrix = Matrix(container: expectedContainer)
        XCTAssertEqual(ascendedMatrix, expectedMatrix)
    }

    func testEmptyMatrix() {
        // Given
        let givenContainer: [[Int]] = [
            []
        ]

        // When
        let matrix = Matrix(container: givenContainer)

        // Then
        XCTAssertNil(matrix)
    }

    func testSingleElementMatrix() {
        // Given
        let givenContainer: [[Int]] = [
            [1]
        ]
        guard let matrix = Matrix(container: givenContainer) else {
            XCTFail()
            return
        }

        // When
        let matrixFormatter = MatrixFormatter(for: matrix)
        let ascendedMatrix = matrixFormatter.ascendedByModule()

        // Then
        let expectedContainer = [
            [1]
        ]
        let expectedMatrix = Matrix(container: expectedContainer)
        XCTAssertEqual(ascendedMatrix, expectedMatrix)
    }

    func testWrongMatrix() {
        // Given
        let givenContainer: [[Int]] = [
            [1, 2, 3],
            [4, 5]
        ]

        // When
        let matrix = Matrix(container: givenContainer)

        // Then
        XCTAssertNil(matrix)
    }

    func testAscendedMatrix() {
        // Given
        let givenContainer: [[Int]] = [
            [3, 2, 1],
            [6, 5, 4]
        ]
        guard let matrix = Matrix(container: givenContainer) else {
            XCTFail()
            return
        }

        // When
        let matrixFormatter = MatrixFormatter(for: matrix)
        let ascendedMatrix = matrixFormatter.ascendedByModule()

        // Then
        let expectedContainer: [[Int]] = [
            [3, 2, 1],
            [6, 5, 4]
        ]
        let expectedMatrix = Matrix(container: expectedContainer)
        XCTAssertEqual(ascendedMatrix, expectedMatrix)
    }

    func testDianaMatrix() {
        // Given
        let givenContainer: [[Int]] = [
            [15, 0, -4],
            [2, 10, 3],
            [4, 9, 23]
        ]
        guard let matrix = Matrix(container: givenContainer) else {
            XCTFail()
            return
        }

        // When
        let matrixFormatter = MatrixFormatter(for: matrix)
        let ascendedMatrix = matrixFormatter.ascendedByModule()

        // Then
        let expectedContainer: [[Int]] = [
            [-4, 15, 0],
            [3, 2, 10],
            [23, 4, 9]
        ]
        let expectedMatrix = Matrix(container: expectedContainer)
        XCTAssertEqual(ascendedMatrix, expectedMatrix)
    }
}
