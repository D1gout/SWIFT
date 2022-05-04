//
//  ContentView.swift
//  Lesson3
//
//  Created by Даниил Ащев on 22.01.2021.
//

import AVFoundation
import SwiftUI

class PlayerViemModel: ObservableObject {
    @Published public var maxDuration = 0.0
    private var player: AVAudioPlayer?
    
    public func play() {
        PlaySong(name: "song")
        player?.play()
    }
    
    public func stop() {
        player?.stop()
    }
    
    public func setTime(value: Float) {
        guard let time = TimeInterval(exactly: value) else { return }
        player?.currentTime = time
        player?.play()
    }
    
    private func PlaySong(name: String) {
        guard let audioPath = Bundle.main.path(forResource: name, ofType: "mp3") else { return }
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            maxDuration = player?.duration ?? 0.0
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ContentView: View {
    @State private var progress: Float = 0
    @ObservedObject var viemModel = PlayerViemModel()
    
    var body: some View {
        VStack {
            
            Slider(value: Binding(get: {
                Double(self.progress)
            }, set: { newValue in
                self.progress = Float(newValue)
                self.viemModel.setTime(value: Float(newValue))
            }), in: 0...viemModel.maxDuration).padding()
            
            HStack {
                Button(action: {
                    self.viemModel.play()
                }, label: {
                    Text("Пуск")
                    .foregroundColor(Color.black)
                })
                
                    .frame(width: 100, height: 50)
                    .background(Color.orange)
                    .cornerRadius(10)
                
                Button(action: {
                    self.viemModel.stop()
                }, label: {
                    Text("Пауза")
                    .foregroundColor(Color.black)
                })
                
                    .frame(width: 100, height: 50)
                    .background(Color.orange)
                    .cornerRadius(10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
