import Foundation

// Speiler MenulyIngredintEntity, kommer ikke fra API'et
public struct MenulyShoppingListItem: Identifiable {
    public let id: UUID
    public let name: String
    public let amount: Double
    public let unit: String
    public let isChecked: Bool
    
    public init(id: UUID,
                name: String,
                amount: Double,
                unit: String,
                isChecked: Bool) {
        self.id = id
        self.name = name
        self.amount = amount
        self.unit = unit
        self.isChecked = isChecked
    }
}
