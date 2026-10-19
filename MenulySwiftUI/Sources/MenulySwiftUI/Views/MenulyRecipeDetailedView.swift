import SwiftUI

// Egendefinerte imports
import MenulyFoundation

struct MenulyRecipeDetailedView: View {
    
    let recipe: MenulyRecipe
    
    @State private var selectedPortions: Int = 2
    
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
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                Text(recipe.title)
                    .fontWeight(.bold)
                    .font(.title2)
                    .padding(.bottom, 16)
                Text(recipe.description)
                    .padding(.bottom, 16)
                /// TODO: Legg til at man kan endre antall porsjoner
                Label("\(recipe.portions)", systemImage: "person.2.fill")
                    .padding(.bottom, 16)
                /// TODO: Legg til i handleliste, og eventuelt legg til i ukesplan
                Text("Ingredienser")
                    .font(.headline)
                    .padding(.bottom, 16)
                
                ForEach(recipe.ingredient) { ingredients in
                    HStack {
                        Text(ingredients.name)
                        Spacer()
                        Text("\(ingredients.amount.formatted(.number.precision(.fractionLength(0...2)))) \(ingredients.unit)")
                    }
                    Divider()
                }
                
                Text("Fremgangsmåte")
                    .font(.headline)
                    .padding(.bottom, 16)
                    .padding(.top, 16)
                
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
            }
            .padding(16)
        }
    }
}

