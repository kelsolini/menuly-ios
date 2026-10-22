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
    
    // Handleliste

    public private(set) var shoppingList: [MenulyShoppingListItem] = []

    public func fetchShoppingList() throws {
        // Ingenting å hente, listen ligger allerede i minnet
    }

    public func addToShoppingList(_ ingredients: [MenulyIngredient]) throws {
        for ingredient in ingredients {
            if let index = shoppingList.firstIndex(where: { $0.name == ingredient.name && $0.unit == ingredient.unit }) {
                // Finnes allerede: lag en ny struct med summert mengde
                let existing = shoppingList[index]
                shoppingList[index] = MenulyShoppingListItem(id: existing.id,
                                                             name: existing.name,
                                                             amount: existing.amount + ingredient.amount,
                                                             unit: existing.unit,
                                                             isChecked: existing.isChecked)
            } else {
                // Finnes ikke: legg til ny
                shoppingList.append(MenulyShoppingListItem(id: UUID(),
                                                           name: ingredient.name,
                                                           amount: ingredient.amount,
                                                           unit: ingredient.unit,
                                                           isChecked: false))
            }
        }
    }
}
