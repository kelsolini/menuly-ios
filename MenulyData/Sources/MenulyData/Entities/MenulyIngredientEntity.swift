import Foundation
import SwiftData

@Model
public final class MenulyIngredientEntity {
    
    // Navn + enhet skal være unikt sammen
    #Unique<MenulyIngredientEntity>([\.name, \.unit])
    
    public var id: UUID
    public var name: String
    public var amount: Double
    public var unit: String
    public var isChecked: Bool
    
    public init(name: String,
                amount: Double,
                unit: String,
                isChecked: Bool = false) {
        self.id = UUID()
        self.name = name
        self.amount = amount
        self.unit = unit
        self.isChecked = isChecked
    }
}
