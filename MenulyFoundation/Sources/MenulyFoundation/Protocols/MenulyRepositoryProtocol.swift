public protocol MenulyRepositoryProtocol {
    var recipeList: [MenulyRecipe] {get}
    func fetchRecipes() async throws
    
    // ShoppingList
    var shoppingList: [MenulyShoppingListItem] {get}
    func fetchShoppingList() throws
    func addToShoppingList(_ ingredients: [MenulyIngredient]) throws
}
