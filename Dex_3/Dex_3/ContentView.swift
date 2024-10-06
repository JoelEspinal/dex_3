//
//  ContentView.swift
//  Dex_3
//
//  Created by Joel Espinal on 23/9/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @EnvironmentObject var pokemon: Pokemon
    
    //@Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Pokemon.id, ascending: true)],
        animation: .default)
    private var pokedex: FetchedResults<Pokemon>

    var body: some View {
        NavigationStack {
            List(pokedex) { pokemon in
                NavigationLink(value: pokemon) {
                    AsyncImage(url: pokemon.sprite) { image in
                    image.resizable()
                        scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 100, height: 100)
                    
                    Text(pokemon.name!.capitalized)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .navigationTitle("Pokedex")
            .navigationDestination(for: Pokemon.self, destination: { image in
                AsyncImage(url: image.sprite) { image in
                image.resizable()
                    scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 100)
            })
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()


struct Pokemon_Preview: PreviewProvider {
    let poke = PersistenceController.shared
    static var previews: some View {
        
        PokemonDetail().environmentObject(SamplePokemon.samplePokemon)
    }
}


//struct PokemonDetail_Preview: PreviewProvider{
//    static var previews: some View {
//        let context = PersistenceController.preview.container.viewContext
//        
//        let fetchRequest: NSFetchRequest<Pokemon> = Pokemon.fetchRequest()
//        fetchRequest.fetchLimit = 1
//        
//        
//        return
//    }
//}



//#Preview {
//    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext) 
//}
