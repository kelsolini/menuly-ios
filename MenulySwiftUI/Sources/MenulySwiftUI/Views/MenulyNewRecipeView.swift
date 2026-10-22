import SwiftUI
import PhotosUI

// Egene imports
import MenulyFoundation

struct MenulyNewRecipeView: View {
    
    // Holder staten til formen
    @State private var title: String = ""
    @State private var description: String = ""
    // Photo
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var imageData: Data?
    
    @State private var portions: Int = 4
    
    // Ingrediens
    @FocusState private var amountFocused: Bool
    
    @State private var ingredientName = ""
    @State private var ingredientAmount: Double = 1.00
    private let units = ["ml", "dl", "l", "g", "kg", "ts", "ss", "stk"]
    @State private var ingredientUnit = "dl"
    
    // Instruksjon
    @State private var instructionText: String = ""
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Description", text: $description, axis: .vertical)
            HStack {
                PhotosPicker(selection: $selectedPhoto, matching: .images) {
                    Label("Last opp bilde", systemImage: "photo")
                }
                
                Spacer()
                
                if let imageData, let uiImage = UIImage(data: imageData) {
                       Image(uiImage: uiImage)
                           .resizable()
                           .scaledToFill()
                           .frame(width: 32, height: 32)
                           .clipShape(RoundedRectangle(cornerRadius: 6))
                   }
            }
            
            Stepper("Porsjoner: \(portions)", value: $portions, in: 1...20)
            
            // Ingrediens
            Text("Ingredienser")
            
            HStack {
                TextField("Ingrediens", text: $ingredientName)
                TextField("Mengde", value: $ingredientAmount, format: .number)
                    .keyboardType(.decimalPad)
                    .focused($amountFocused)
                    .multilineTextAlignment(.trailing)
                    .frame(width: 70)

                Stepper("", value: $ingredientAmount, in: 0...10000, step: 0.5)
                    .labelsHidden()
                Picker("", selection: $ingredientUnit) {
                    ForEach(units, id: \.self) { unit in
                        Text(unit).tag(unit)
                    }
                }
            }
        }
        
        .navigationTitle("New Recipe")
        .onChange(of: selectedPhoto) { _, newItem in
            Task {
                imageData = try? await newItem?.loadTransferable(type: Data.self)
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Ferdig") {
                    amountFocused = false
                }
            }
        }
    }
}
