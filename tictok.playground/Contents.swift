import SwiftUI

struct ContentView: View {
    let dict: [KeyObject: [SomeObject]] = [
        KeyObject(name: "1st group") : [SomeObject(value: 1),
             SomeObject(value: 2),
             SomeObject(value: 3)],
        KeyObject(name: "2nd group") : [SomeObject(value: 4),
             SomeObject(value: 5),
             SomeObject(value: 6)],
        KeyObject(name: "3rd group") : [SomeObject(value: 7),
             SomeObject(value: 8),
             SomeObject(value: 9)]
    ]
    var body: some View {
        TreeView(data: dict,
                 keyContent: {keyObject in
                    Text("the key is: \(keyObject.name)")
                 }
        ){valueObject in
            Text("value: \(valueObject.value)")
        }
    }
}
