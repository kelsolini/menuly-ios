import SwiftUI

// Egendefinerte imports
import MenulyFoundation

struct MenulyRecipeDetailedView: View {
    
    let recipe: MenulyRecipe
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 12){
                AsyncImage(url: URL(string: recipe.image)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                Text(recipe.title)
                    .fontWeight(.bold)
                    .font(.title2)
                Text(recipe.description)
                /// TODO: Legg til at man kan endre antall porsjoner
                Label("\(recipe.portions)", systemImage: "person.2.fill")
                /// TODO: Legg til i handleliste, og eventuelt legg til i ukesplan
                Text("Ingredienser")
                    .font(.headline)
                /// TODO: Legg til ingredient i modelen
                /*
                 ForEach(recipe.ingredient) { ingredients in
                     HStack {
                         Text(ingredients.name)
                         Spacer()
                         Text("\(ingredients.amount) \(ingredients.unit)")
                     }
                     Divider()
                 }
                */
                Text("Fremgangsmåte")
                    .font(.headline)
                /// TODO: Legg til Fremgangsmåten i modellen
                /*
                 ForEach(recipe.instruction) { instructions in
                     HStack(alignment: .top, spacing: 16) {
                         Text("\(instructions.stepNumber)")
                             .font(.subheadline.bold())
                             .foregroundStyle(.white)
                             .frame(width: 32, height: 32)
                             .background(Circle().fill(Color(red: 0.48, green: 0.12, blue: 0.12)))

                         Text(instructions.text)
                            .frame(maxWidth: .infinity, alignment: .leading)
                     }
                    .padding(.vertical, 4)
                 }
                */
            }
            .padding(16)
        }
    }
}

