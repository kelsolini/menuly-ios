import SwiftUI
import SwiftData

import MenulyFoundation
import MenulySwiftUI
import MenulyNetworking
import MenulyData
import MenulyMocks

@main struct MyApp: App {
    
    private let menulyService: MenulyServiceProtocol
    private let menulyRepository: MenulyRepositoryProtocol
    private let modelContainer: ModelContainer
    
    init() {
        self.modelContainer = try! ModelContainer(for: MenulyIngredientEntity.self)
        
        let service = MocksMenulyService()
        self.menulyService = service
        self.menulyRepository = MenulyRepository(
            menulyService: service,
            modelContext: modelContainer.mainContext
        )
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(\.menulyRepository, menulyRepository)
        }
    }
}
