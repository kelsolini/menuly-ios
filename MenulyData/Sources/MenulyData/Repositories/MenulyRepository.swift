import SwiftUI
import SwiftData

import MenulyFoundation

@Observable
public class MenulyRepository: MenulyRepositoryProtocol {
    
    // Servicen er privat. Kun denne klassen skal ha tilgang
    private var menulyService: MenulyServiceProtocol
    
    private var modelContext: ModelContext
    
    // Holder listen med alle oppskrifter
    public private(set) var recipeList: [MenulyRecipe]
    
    // Holder handlelisten
    public private(set) var shoppingList: [MenulyShoppingListItem] = []
    
    public init(menulyService: MenulyServiceProtocol,
                modelContext: ModelContext) {
        self.menulyService = menulyService
        self.modelContext = modelContext
        self.recipeList = []
    }
    
    // Prøver å hente recipes fra service, og sette til listen vis ikke starter listen som et tomt array
    public func fetchRecipes() async throws {
        // Get Recipes from API
        recipeList = try await menulyService.fetchRecipes()
    }
    
    // MARK: - Handleliste
    
    // Henter alt som er lagret lokalt og gjør det om til structs
    public func fetchShoppingList() throws {
        
        let descriptor = FetchDescriptor<MenulyIngredientEntity>(
            sortBy: [SortDescriptor(\.name)]
        )
        
        let entities = try modelContext.fetch(descriptor)
        
        shoppingList = entities.map { entity in
            MenulyShoppingListItem(id: entity.id,
                                   name: entity.name,
                                   amount: entity.amount,
                                   unit: entity.unit,
                                   isChecked: entity.isChecked)
        }
    }
    
    public func addToShoppingList(_ ingredients: [MenulyIngredient]) throws {
        for ingredient in ingredients {
            // Rydder opp så "Tomat " og "tomat" blir likt
            let name = ingredient.name.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
            let unit = ingredient.unit.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
            
            // Ser etter en linje med samme navn og enhet
            let descriptor = FetchDescriptor<MenulyIngredientEntity>(
                predicate: #Predicate { $0.name == name && $0.unit == unit }
            )
            
            if let existing = try modelContext.fetch(descriptor).first {
                // Finnes allerede: legg sammen mengden
                existing.amount += ingredient.amount
            } else {
                // Finnes ikke: lag ny
                let newIngredient = MenulyIngredientEntity(name: name,
                                                           amount: ingredient.amount,
                                                           unit: unit)
                modelContext.insert(newIngredient)
            }
        }
        
        try modelContext.save()
        try fetchShoppingList()
    }
}
