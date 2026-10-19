public protocol MenulyServiceProtocol {
    func fetchRecipes() async throws -> [MenulyRecipe]
}
