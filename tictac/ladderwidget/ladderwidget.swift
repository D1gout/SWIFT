import WidgetKit
import SwiftUI
import Intents

protocol TimelineProvider {

    associatedtype Entry : TimelineEntry
    typealias Context = TimelineProviderContext

    func placeholder(in context: Context) -> Entry
    func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void)
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void)
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
