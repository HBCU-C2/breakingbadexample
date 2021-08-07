//
//  ContentView.swift
//  teststset
//
//  Created by Marc Aupont on 8/7/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var characters = [BreakingBadCharacter]()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(characters)  { character in
                    NavigationLink {
                        DetailView(breakingBadCharacter: character)
                    } label: {
                        HStack {
                            
                            AsyncImage(url: character.img) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 50)
                            
                            Text(character.name)
                            
                        }
                    }

                    
                    
                }
            }
            .onAppear {
                let url = URL(string: "https://www.breakingbadapi.com/api/characters")!
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data {
                        do {
                            let characters = try JSONDecoder().decode([BreakingBadCharacter].self, from: data)
                            self.characters = characters
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        
                    }
                }.resume()
            }
        }
    }
}

struct BreakingBadCharacter: Decodable, Identifiable {
    var id: Int
    var name: String
    var img: URL
    
    enum CodingKeys: String, CodingKey {
        case id = "char_id"
        case name
        case img
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
