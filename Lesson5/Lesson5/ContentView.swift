//
//  ContentView.swift
//  Lesson5
//
//  Created by Даниил Ащев on 29.01.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var isSharePresented = false
    let customActivity = ActivityViewCustomActivity(title: "Телеграмм", imageName: "icon.jpg") {
        print("Отправка в Телеграмм")
    }
    
    var body: some View {
        Button("share") {
            self.isSharePresented = true
        }.sheet(isPresented: $isSharePresented) {
            ActivityView(activityItems: ["message test"],
                         applicationActivities: [self.customActivity])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
