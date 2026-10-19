import SwiftUI

import MenulyFoundation
import MenulyMocks

struct MenulyListView: View {

    @Environment(\.menulyRepository) private var menulyRepository

    @State private var hasFetchedInitialList = false

    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(menulyRepository.recipeList) { recipe in
                    NavigationLink(destination: MenulyRecipeDetailedView(recipe: recipe)) {
                        VStack(alignment: .leading, spacing: 4) {
                            Color.clear
                                .frame(height: 140)
                                .frame(maxWidth: .infinity)
                                .overlay {
                                    AsyncImage(url: URL(string: recipe.image)) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 8))

                            Text(recipe.title)
                                .font(.subheadline)
                                .lineLimit(2, reservesSpace: true)
                                .multilineTextAlignment(.leading)
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(16)
        }
        .navigationTitle("Oppskrifter")
        .onAppear {
            fetchListIfNeeded()
        }
    }

    private func fetchListIfNeeded() {
        guard !hasFetchedInitialList else {
            return
        }

        hasFetchedInitialList = true

        Task {
            do {
                try await menulyRepository.fetchRecipes()
            } catch {
                hasFetchedInitialList = false
                print("Feil ved henting av oppskrifter: \(error)")
            }
        }
    }
}

#Preview {

    let mockService: MenulyServiceProtocol = MocksMenulyService()
    let mockRepo: MenulyRepositoryProtocol = MockMenulyRepository(menulyService: mockService)

    NavigationStack {
        MenulyListView()
            .environment(\.menulyRepository, mockRepo)
    }
}
