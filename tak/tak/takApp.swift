//
//  takApp.swift
//  tak
//
//  Created by Даниил Ащев on 21.01.2021.
//

import SwiftUI

@main
struct takApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

enum FieldType: Character {
    case o = "⭕"
    case x = "❌"
    case empty = "⬜"
}

class TicTacToe {
    let size: Int
    var array: [[FieldType]] = [[FieldType]]()
    init(size: Int) {
        self.size = size
        create()
    }
    func create() {
        print("Create new Tic Tac Toe")
        array = [[FieldType]]()
        for _ in 0..<size {
            let line = Array(repeating: FieldType.empty, count: size)
            array.append(line)
        }
    }
    func show() {
        for line in array {
            var lineString = ""
            for character in line {
                lineString += String(character.rawValue)
            }
            print(lineString)
        }
    }
    subscript (x: Int, y: Int) -> FieldType {
        get {
            if x < 0 || y < 0 || x >= size || y >= size {
                return .empty
            }
            return array[y][x]
        }
        set {
            print("\(newValue.rawValue) - (\(x), \(y))")
            if !(x < 0 || y < 0 || x >= size || y >= size || newValue == .empty || array[y][x] != .empty) {
                array[y][x] = newValue
            }
        }
    }
}

let ticTacToe = TicTacToe(size: 3)
