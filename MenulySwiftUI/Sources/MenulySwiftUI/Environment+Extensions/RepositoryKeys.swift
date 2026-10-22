import SwiftUI

import MenulyFoundation

final class PlaceholderMenulyRepository: MenulyRepositoryProtocol {
    let recipeList: [MenulyRecipe] = []
    func fetchRecipes() async throws {
        // no-op
    }
    
    let shoppingList: [MenulyShoppingListItem] = []
    
    func fetchShoppingList() throws {
        // no-op
    }
    func addToShoppingList(_ ingredients: [MenulyIngredient]) throws {
        // no-op
    }
}

public extension EnvironmentValues {
    @Entry var menulyRepository: MenulyRepositoryProtocol = PlaceholderMenulyRepository()
}
