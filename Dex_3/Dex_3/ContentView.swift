//
//  ContentView.swift
//  Dex_3
//
//  Created by Joel Espinal on 23/9/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Pokemon.id, ascending: true)],
        animation: .default)
    private var pokedex: FetchedResults<Pokemon>

    var body: some View {
       
        NavigationView {
           
            List {
                ForEach(pokedex) { pokemon in
                    NavigationLink {
                        Text("\(String(describing: pokemon.id)) \(pokemon.name!.capitalized)")
                    } label: {
                        Text("\(String(describing: pokemon.id)) \(pokemon.name!.capitalized)")
                   }
                }
               
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                 
                }
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
