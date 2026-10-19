import SwiftUI

import MenulyFoundation

final class PlaceholderMenulyRepository: MenulyRepositoryProtocol {
    let recipeList: [MenulyRecipe] = []
    func fetchRecipes() async throws {
        // no-op
    }
}

public extension EnvironmentValues {
    @Entry var menulyRepository: MenulyRepositoryProtocol = PlaceholderMenulyRepository()
}
