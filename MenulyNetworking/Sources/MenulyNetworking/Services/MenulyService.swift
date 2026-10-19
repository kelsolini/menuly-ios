import Foundation

import MenulyFoundation

private struct MenulyRecipeListResponse: Decodable {
    let results: [MenulyRecipe]
}

public struct MenulyService: MenulyServiceProtocol {
    
    private let recipeURL: URL = URL(string: "http://localhost:5132/recipes")!
    
    public init() {
        // no-op
    }
    
    public func fetchRecipes() async throws -> [MenulyRecipe] {
        let (data, response) = try await URLSession.shared.data(from: recipeURL)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let decoded = try JSONDecoder().decode(MenulyRecipeListResponse.self, from: data)
        return decoded.results
    }
}
