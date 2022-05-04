//
//  ContentView.swift
//  Lesson6
//
//  Created by Даниил Ащев on 10.02.2021.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var preentation
    @EnvironmentObject var userBuy: UserBuy
    
    var text: String
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Купить \(text) \(userBuy.caps) шт")
            
            .navigationBarItems(leading:
                Button("<- В меню") {
                    self.preentation.wrappedValue.dismiss()
                }
                , trailing:
            
                HStack{
                    Button("-") {
                        guard self.userBuy.caps > 0 else { return }
                        self.userBuy.caps -= 1
                    }
                    
                    Button("+") {
                        self.userBuy.caps += 1
                    }
                }
            )
        }
        .navigationBarBackButtonHidden(true)
        
        .onAppear() {
            self.userBuy.caps = 0
        }
    }
}

class UserBuy: ObservableObject {
    @Published var caps = 0
}
struct ContentView: View {
    @ObservedObject var userBuy = UserBuy()
    @State var isShow = false
    
    let coffee = "Кофе"
    let tea = "Чай"
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Вы выбрали = \(userBuy.caps) шт")
                Text("Что желаете?")
            
                NavigationLink(destination: DetailView(text: coffee),
                    isActive: $isShow) {
                    EmptyView()
                }
                
                Button("Go") {
                    self.isShow.toggle()
                }
                
                    .navigationBarTitle("Меню")
            }
        }
        .environmentObject(userBuy)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
