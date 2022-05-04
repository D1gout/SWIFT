//
//  ContentView.swift
//  Lesson1
//
//  Created by Даниил Ащев on 20.01.2021.
//

import SwiftUI

struct ContentView: View {
    @State var IsOnToggle = false
    
    
    var body: some View {
        VStack {
            ZStack {
                HStack{
                    VStack{
                        Text("Кошелек")
                        Text("Профиль")
                    }
                    Spacer()
                }
                RoundedRectangle(cornerRadius:
                    10).fill(Color.red)
                    .offset(x: IsOnToggle ? 100: 0)
                Text("Что то на экране")
            }
            Toggle(isOn: $IsOnToggle, label: {
                Text("Показать настройки")
            }).padding()
        }.animation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.3))
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
