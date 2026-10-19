public struct MenulyRecipe: Decodable, Identifiable {
    public let id: Int
    public let title: String
    public let description: String
    public let image: String
    public let portions: Int
    public let ingredient: [MenulyIngredient]
    public let instruction: [MenulyInstruction]
    
    public init(id: Int,
                title: String,
                description: String,
                image: String, portions: Int,
                ingredient: [MenulyIngredient] = [],
                instruction: [MenulyInstruction] = []) {
        self.id = id
        self.title = title
        self.description = description
        self.image = image
        self.portions = portions
        self.ingredient = ingredient
        self.instruction = instruction
    }
}

public struct MenulyIngredient: Decodable, Identifiable {
    public let id: Int
    public let name: String
    public let amount: Double
    public let unit: String
    
    public init(id: Int,
                name: String,
                amount: Double,
                unit: String) {
        self.id = id
        self.name = name
        self.amount = amount
        self.unit = unit
    }
}

public struct MenulyInstruction: Decodable, Identifiable {
    public let id: Int
    public let stepNumber: Int
    public let text: String
    
    public init(id: Int,
                stepNumber: Int,
                text: String) {
        self.id = id
        self.stepNumber = stepNumber
        self.text = text
    }
}
