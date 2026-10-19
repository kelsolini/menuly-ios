public struct MenulyRecipe: Decodable, Identifiable {
    public let id: Int
    public let title: String
    public let description: String
    public let image: String
    public let portions: Int
    
    public init(id: Int,
         title: String,
         description: String,
         image: String,
         portions: Int) {
        self.id = id
        self.title = title
        self.description = description
        self.image = image
        self.portions = portions
    }
}
