import SwiftUI

import MenulyFoundation

@Observable
public final class MockMenulyRepository: MenulyRepositoryProtocol {
    
    private let menulyService: MenulyServiceProtocol
    
    public private(set) var recipeList: [MenulyRecipe]
    
    public init(menulyService: MenulyServiceProtocol) {
        self.menulyService = menulyService
        self.recipeList = []
    }
    
    public func fetchRecipes() async throws {
        recipeList = try await menulyService.fetchRecipes()
    }
}
