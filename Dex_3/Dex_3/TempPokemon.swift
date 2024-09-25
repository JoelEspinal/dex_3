//
//  TempPokemon.swift
//  Dex_3
//
//  Created by Joel Espinal on 24/9/24.
//

import Foundation

struct TempPokemon:  Decodable {
    
    let id: Int
    let name: String
    let type: [String]
    let hp: Int
    let attack: Int
    let defese: Int
    let specialAtack: Int
    let specialDefense: Int
    let sepeed: Int
    let sprite: URL
    let shiny: URL
    
    enum PokemonKeys: String, CodingKey {
        case id
        case name
        case types
        case stats
        case sprites
        
        enum TypeDictionarykeys: String, CodingKey {
            case type
            
            enum TypeKeys: String, CodingKey {
                case name
            }
        }
        
        enum StatDictioraryKey: String, CodingKey {
            case value = "base_stat"
            case stat
            
            enum StatKey: String, CodingKey {
                case name
            }
        }
        
        enum SpriteKeys: String, CodingKey {
            case sprite = "front_default"
            case shinys = "front_shiny"
        }
    }
    
}
