import SwiftUI

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
 
let ticTacToe = TicTacToe(size: 4)
ticTacToe.show()
ticTacToe[0,1] = .x
if ticTacToe[0,2] == .x {
    ticTacToe[1,1] = .o
} else {
    ticTacToe[0,2] = .o
}
ticTacToe.show()
ticTacToe[1,1] = .o
ticTacToe.show()
ticTacToe[1,2] = .x
ticTacToe.show()
ticTacToe[2,2] = .o
ticTacToe.show()
ticTacToe[0,0] = .x
ticTacToe.show()
ticTacToe[0,2] = .o
ticTacToe.show()
ticTacToe[0,1] = .o
ticTacToe.show()
ticTacToe[2,1] = .x
ticTacToe.show()
ticTacToe[2,2] = .o
ticTacToe.show()
ticTacToe[0,0] = .x
ticTacToe.create()
ticTacToe.show()


