import SwiftUI

public struct RootView: View {
    
    public init() {
        // no-op
    }
    
    public var body: some View {
        TabView {
            Tab("Recipes", systemImage: "fork.knife") {
                NavigationStack {
                    MenulyListView()
                }
            }
        }
    }
}
