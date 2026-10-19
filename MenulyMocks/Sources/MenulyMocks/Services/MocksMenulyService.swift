import MenulyFoundation

public struct MocksMenulyService: MenulyServiceProtocol {
    public init() {
        // no-op
    }
    
    public func fetchRecipes() async throws -> [MenulyRecipe] {
        return [
            MenulyRecipe(id: 1,
                         title: "Pannekaker",
                         description: "Sjukt digge pannekaker",
                         image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNuce1MAG80ghfeniLye2xTLh5mGtJX7a6HQdR-7rPdA&s=10",
                         portions: 4),
            MenulyRecipe(id: 2,
                         title: "Hamburgler",
                         description: "Veldig godt med Hamburgeler",
                         image: "https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0b/RedDot_Burger.jpg/500px-RedDot_Burger.jpg?utm_source=en.wikipedia.org&utm_campaign=parser&utm_content=thumbnail",
                         portions: 2),
            MenulyRecipe(id: 3,
                         title: "Spaghetti Bolognese",
                         description: "Klassisk kjøttsaus som koker i timevis",
                         image: "https://picsum.photos/seed/bolognese/500/400",
                         portions: 4),
            MenulyRecipe(id: 4,
                         title: "Taco med kyllingstrimler og masse tilbehør",
                         description: "Fredagstaco for hele familien",
                         image: "https://picsum.photos/seed/taco/500/400",
                         portions: 4),
            MenulyRecipe(id: 5,
                         title: "Fiskesuppe",
                         description: "Kremet suppe med laks og torsk",
                         image: "https://picsum.photos/seed/fiskesuppe/500/400",
                         portions: 6),
            MenulyRecipe(id: 6,
                         title: "Pizza",
                         description: "Hjemmelaget pizzabunn med valgfri topping",
                         image: "https://picsum.photos/seed/pizza/500/400",
                         portions: 2),
            MenulyRecipe(id: 7,
                         title: "Lasagne",
                         description: "Lag i lag med ost og kjøttsaus",
                         image: "https://picsum.photos/seed/lasagne/500/400",
                         portions: 6),
            MenulyRecipe(id: 8,
                         title: "Grøt",
                         description: "Enkel og mettende frokost",
                         image: "https://picsum.photos/seed/grot/500/400",
                         portions: 1)
        ]
    }
}
