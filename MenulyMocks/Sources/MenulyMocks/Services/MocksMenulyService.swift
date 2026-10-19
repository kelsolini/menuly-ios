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
                         portions: 4,
                         ingredient: [
                            MenulyIngredient(id: 1, name: "Hvetemel", amount: 3, unit: "dl"),
                            MenulyIngredient(id: 2, name: "Salt", amount: 0.5, unit: "ts"),
                            MenulyIngredient(id: 3, name: "Melk", amount: 5, unit: "dl"),
                            MenulyIngredient(id: 4, name: "Egg", amount: 3, unit: "stk"),
                            MenulyIngredient(id: 5, name: "Smør til steking", amount: 2, unit: "ss")
                         ],
                         instruction: [
                            MenulyInstruction(id: 1, stepNumber: 1, text: "Bland mel og salt i en stor arbeidsbolle."),
                            MenulyInstruction(id: 2, stepNumber: 2, text: "Tilsett halvparten av melken og visp til jevnt."),
                            MenulyInstruction(id: 3, stepNumber: 3, text: "Visp inn eggene og resten av melken."),
                            MenulyInstruction(id: 4, stepNumber: 4, text: "Stek tynne pannekaker i smør på middels varme.")
                         ]),
            MenulyRecipe(id: 2,
                         title: "Hamburgler",
                         description: "Veldig godt med Hamburgeler",
                         image: "https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0b/RedDot_Burger.jpg/500px-RedDot_Burger.jpg?utm_source=en.wikipedia.org&utm_campaign=parser&utm_content=thumbnail",
                         portions: 2,
                         ingredient: [
                            MenulyIngredient(id: 1, name: "Karbonadedeig", amount: 400, unit: "g"),
                            MenulyIngredient(id: 2, name: "Hamburgerbrød", amount: 2, unit: "stk"),
                            MenulyIngredient(id: 3, name: "Cheddar", amount: 2, unit: "skiver"),
                            MenulyIngredient(id: 4, name: "Tomat", amount: 1, unit: "stk"),
                            MenulyIngredient(id: 5, name: "Salat", amount: 4, unit: "blader")
                         ],
                         instruction: [
                            MenulyInstruction(id: 1, stepNumber: 1, text: "Form deigen til to like store burgere og krydre med salt og pepper."),
                            MenulyInstruction(id: 2, stepNumber: 2, text: "Stek burgerne i en varm panne i 3–4 minutter på hver side."),
                            MenulyInstruction(id: 3, stepNumber: 3, text: "Legg osten på mot slutten så den smelter."),
                            MenulyInstruction(id: 4, stepNumber: 4, text: "Rist brødene og bygg burgeren med salat, tomat og kjøtt.")
                         ]),
            MenulyRecipe(id: 3,
                         title: "Spaghetti Bolognese",
                         description: "Klassisk kjøttsaus som koker i timevis",
                         image: "https://img.taste.com.au/5qlr1PkR/taste/2016/11/spaghetti-bolognese-106560-1.jpeg",
                         portions: 4,
                         ingredient: [
                            MenulyIngredient(id: 1, name: "Spaghetti", amount: 400, unit: "g"),
                            MenulyIngredient(id: 2, name: "Kjøttdeig", amount: 500, unit: "g"),
                            MenulyIngredient(id: 3, name: "Hakkede tomater", amount: 1, unit: "boks"),
                            MenulyIngredient(id: 4, name: "Løk", amount: 1, unit: "stk"),
                            MenulyIngredient(id: 5, name: "Hvitløksfedd", amount: 2, unit: "stk")
                         ],
                         instruction: [
                            MenulyInstruction(id: 1, stepNumber: 1, text: "Fres løk og hvitløk i olje til de er myke."),
                            MenulyInstruction(id: 2, stepNumber: 2, text: "Brun kjøttdeigen og tilsett tomatene."),
                            MenulyInstruction(id: 3, stepNumber: 3, text: "La sausen putre under lokk i minst 45 minutter."),
                            MenulyInstruction(id: 4, stepNumber: 4, text: "Kok spaghettien og server med sausen.")
                         ]),
            MenulyRecipe(id: 4,
                         title: "Taco med kyllingstrimler og masse tilbehør",
                         description: "Fredagstaco for hele familien",
                         image: "https://www.rema.no/_img/production/8ffe1ee9cf30f19125cf620ac2352009c23b5826-1199x800.jpg?q=75&fit=max&w=1080&fm=webp",
                         portions: 4,
                         ingredient: [
                            MenulyIngredient(id: 1, name: "Kyllingstrimler", amount: 500, unit: "g"),
                            MenulyIngredient(id: 2, name: "Tacokrydder", amount: 1, unit: "pose"),
                            MenulyIngredient(id: 3, name: "Tortillalefser", amount: 8, unit: "stk"),
                            MenulyIngredient(id: 4, name: "Rømme", amount: 2, unit: "dl"),
                            MenulyIngredient(id: 5, name: "Agurk", amount: 0.5, unit: "stk")
                         ],
                         instruction: [
                            MenulyInstruction(id: 1, stepNumber: 1, text: "Stek kyllingstrimlene og bland inn tacokrydderet."),
                            MenulyInstruction(id: 2, stepNumber: 2, text: "Varm tortillalefsene i ovnen eller på en tørr panne."),
                            MenulyInstruction(id: 3, stepNumber: 3, text: "Skjær agurk og annet tilbehør."),
                            MenulyInstruction(id: 4, stepNumber: 4, text: "Sett alt på bordet og lag taco etter eget ønske.")
                         ]),
            MenulyRecipe(id: 5,
                         title: "Fiskesuppe",
                         description: "Kremet suppe med laks og torsk",
                         image: "https://matpaabordet.no/wp-content/uploads/2016/03/P3060232.jpg",
                         portions: 6,
                         ingredient: [
                            MenulyIngredient(id: 1, name: "Laks", amount: 300, unit: "g"),
                            MenulyIngredient(id: 2, name: "Torsk", amount: 300, unit: "g"),
                            MenulyIngredient(id: 3, name: "Fiskebuljong", amount: 1, unit: "l"),
                            MenulyIngredient(id: 4, name: "Matfløte", amount: 3, unit: "dl"),
                            MenulyIngredient(id: 5, name: "Gulrot", amount: 2, unit: "stk")
                         ],
                         instruction: [
                            MenulyInstruction(id: 1, stepNumber: 1, text: "Kok opp buljongen med gulrot i terninger."),
                            MenulyInstruction(id: 2, stepNumber: 2, text: "Tilsett fløten og la det småkoke i noen minutter."),
                            MenulyInstruction(id: 3, stepNumber: 3, text: "Ha i fisken i biter og la den trekke i 5 minutter."),
                            MenulyInstruction(id: 4, stepNumber: 4, text: "Smak til med salt, pepper og frisk dill.")
                         ]),
            MenulyRecipe(id: 6,
                         title: "Pizza",
                         description: "Hjemmelaget pizzabunn med valgfri topping",
                         image: "https://cdn.sanity.io/images/2vehtkn0/production/54aab4db84746d07e3ffe27ca3925dcf363439ca-2000x1500.jpg",
                         portions: 2,
                         ingredient: [
                            MenulyIngredient(id: 1, name: "Hvetemel", amount: 5, unit: "dl"),
                            MenulyIngredient(id: 2, name: "Tørrgjær", amount: 1, unit: "ts"),
                            MenulyIngredient(id: 3, name: "Lunket vann", amount: 2, unit: "dl"),
                            MenulyIngredient(id: 4, name: "Tomatsaus", amount: 1, unit: "dl"),
                            MenulyIngredient(id: 5, name: "Mozzarella", amount: 125, unit: "g")
                         ],
                         instruction: [
                            MenulyInstruction(id: 1, stepNumber: 1, text: "Elt sammen mel, gjær og vann til en smidig deig."),
                            MenulyInstruction(id: 2, stepNumber: 2, text: "La deigen heve i en time under et kjøkkenhåndkle."),
                            MenulyInstruction(id: 3, stepNumber: 3, text: "Kjevle ut bunnen og smør på tomatsaus og ost."),
                            MenulyInstruction(id: 4, stepNumber: 4, text: "Stek på 250 grader til osten er gylden.")
                         ]),
            MenulyRecipe(id: 7,
                         title: "Lasagne",
                         description: "Lag i lag med ost og kjøttsaus",
                         image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQ-xwE6lc53fsqWv8cavPHOYQsNo50hp-b4uhkRN7kXJF7P_EtuJrTsULk&s=10",
                         portions: 6,
                         ingredient: [
                            MenulyIngredient(id: 1, name: "Lasagneplater", amount: 250, unit: "g"),
                            MenulyIngredient(id: 2, name: "Kjøttsaus", amount: 6, unit: "dl"),
                            MenulyIngredient(id: 3, name: "Hvit saus", amount: 5, unit: "dl"),
                            MenulyIngredient(id: 4, name: "Revet ost", amount: 200, unit: "g")
                         ],
                         instruction: [
                            MenulyInstruction(id: 1, stepNumber: 1, text: "Legg kjøttsaus i bunnen av et ildfast fat."),
                            MenulyInstruction(id: 2, stepNumber: 2, text: "Legg lasagneplater, hvit saus og kjøttsaus lagvis."),
                            MenulyInstruction(id: 3, stepNumber: 3, text: "Avslutt med et tykt lag ost på toppen."),
                            MenulyInstruction(id: 4, stepNumber: 4, text: "Stek på 200 grader i 40 minutter.")
                         ]),
            MenulyRecipe(id: 8,
                         title: "Grøt",
                         description: "Enkel og mettende frokost",
                         image: "https://v.imgi.no/norskmat-452-c249d6bc86613e00460e05d7fb19980b-1920x1280/grot.jpg",
                         portions: 1,
                         ingredient: [
                            MenulyIngredient(id: 1, name: "Havregryn", amount: 1, unit: "dl"),
                            MenulyIngredient(id: 2, name: "Melk", amount: 2, unit: "dl"),
                            MenulyIngredient(id: 3, name: "Salt", amount: 1, unit: "klype"),
                            MenulyIngredient(id: 4, name: "Kanel", amount: 1, unit: "ts")
                         ],
                         instruction: [
                            MenulyInstruction(id: 1, stepNumber: 1, text: "Kok opp melk og havregryn med litt salt."),
                            MenulyInstruction(id: 2, stepNumber: 2, text: "Rør til grøten tykner, ca. 5 minutter."),
                            MenulyInstruction(id: 3, stepNumber: 3, text: "Dryss over kanel og server varm.")
                         ])
        ]
    }
}
