public protocol MenulyRepositoryProtocol {
    var recipeList: [MenulyRecipe] {get}
    func fetchRecipes() async throws
}
