import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
                .offset(y: -10)
        
            CircleImage()
                .offset(y: -60)
                .padding(.bottom, -60)
            
        
            VStack(alignment: .leading) {
                Text("Клуб")
                    .font(.title)
                HStack {
                    Text("Cyber Arena TEKKEN")
                    Spacer()
                    Text("Екатеринбург")
                }
                .font(.subheadline)
                
                    Divider()

                    Text("О нашем клубе")
                        .font(.title2)
                    Text("Descriptive text goes here.")
                }
                .padding()
            
                Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
