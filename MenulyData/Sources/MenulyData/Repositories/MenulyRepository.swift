import SwiftUI
import MenulyFoundation

@Observable
public class MenulyRepository {
    
    // Servicen er privat. Kun denne klassen skal ha tilgang
    private var menulyService: MenulyServiceProtocol
    
    // Holder listen med alle oppskrifter
    public private(set) var recipeList: [MenulyRecipe]
    
    public init(menulyService: MenulyServiceProtocol) {
        self.menulyService = menulyService
        self.recipeList = []
    }
    
    // Prøver å hente recipes fra service, og sette til listen vis ikke starter listen som et tomt array
    public func fetchRecipes() async throws {
        recipeList = try await menulyService.fetchRecipes()
    }
}
