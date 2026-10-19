import SwiftUI

import MenulyFoundation
import MenulySwiftUI
import MenulyNetworking
import MenulyData
import MenulyMocks

@main struct MyApp: App {
    
    private let menulyService: MenulyServiceProtocol
    private let menulyRepository: MenulyRepositoryProtocol
    
    init() {
        let service = MocksMenulyService()
        self.menulyService = service
        self.menulyRepository = MockMenulyRepository(
            menulyService: service
        )
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(\.menulyRepository, menulyRepository)
        }
    }
}
