//
//  ContentView.swift
//  Lesson2
//
//  Created by Даниил Ащев on 21.01.2021.
//

import SwiftUI

struct ContentView: View {
    @State var section = 0
    @State var isOn = false
    var settingsTime = ["5 min", "10 min", "15 min", "20 min"]
    var procents = ["5 %", "50 %", "100 %"]
    var body: some View {
            NavigationView {
                Form {
                    
                    Picker(selection: $section, label:
                            Text("Время")) {
                            ForEach(0..<settingsTime
                                .count) {
                                Text(self.settingsTime[$0])
                    }
                }
                
                    Toggle(isOn: $isOn) {
                       Text("Авиарежим")
                        .foregroundColor(isOn ? Color.red : Color.black)
                    }
                    
                    Picker(selection: $section, label:
                            Text("Подсветка")) {
                            ForEach(0..<procents
                                .count) {
                                Text(self.procents[$0])
                    }
                }
                    
            }.navigationBarTitle("Настройки")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
