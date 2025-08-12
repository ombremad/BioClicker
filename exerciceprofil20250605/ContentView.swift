//
//  ContentView.swift
//  exerciceprofil20250605
//
//  Created by Anne Ferret on 05/06/2025.
//

import SwiftUI

struct ContentView: View {
            
    // Animation
    @State private var rotationProfile : Double = 0
    
    // Game
    @State var gameData = GameData()
    
    func iconBackground() -> some View {
        LazyVGrid(columns: columns) {
            ForEach (gridIcons, id: \.self) { icon in
                Rectangle()
                    .fill(Color.clear)
                ZStack {
                    Image(systemName: icon)
                        .foregroundStyle(Color.primary.opacity(0.2))
                        .font(.system(size: 26, weight: .medium))
                        .scaledToFit()
                }
            }
        }
        .frame(height: 260)
        .clipped()
    }
    func header() -> some View {
        Section {
            VStack {
                ZStack {
                    iconBackground()
                        Image(.profile)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 140, height: 140)
                            .clipShape(Circle())
                            .rotation3DEffect(.degrees(rotationProfile), axis: (x: 0, y: 1, z: 1))
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 1.2)) {
                                    rotationProfile += 1080
                                }
                            }
                }

                HStack {
                    Spacer()
                        Text("Anne Ferret")
                            .font(.title)
                    Spacer()
                        Text(" iOS Developer")
                            .font(.title3)
                    Spacer()
                }
                
            }
    }
        
    }
    func blockQuote() -> some View {
        Section(header: Text("Citation")) {
            Link(destination: URL(string:"https://music.apple.com/nl/album/n-i-b/1438648677?i=1438648681")!,
                 label: {
            HStack(spacing: 20) {
                    ZStack {
                        Circle()
                            .fill(Color.accentColor)
                            .frame(width: 60, height: 60)
                        Image(systemName: "music.note")
                            .font(.system(size: 82, weight: .black))
                    }
                VStack(alignment: .leading, spacing:8) {
                    Text("« Some people say my love cannot be true »")
                        .font(.headline)
                    Text("*Black Sabbath - **N.I.B.** (1970)*")
                        .font(.caption)
                }
            }
            })
            .foregroundStyle(.primary)
        }
    }
    
    func gameBar() -> some View {
            VStack {
                ZStack {
                    HStack {
                        Button(action: {
                            if gameData.characters >= 10 * gameData.bonusCost {
                                gameData.characters -= 10 * gameData.bonusCost
                                gameData.bonusCost += 1
                                gameData.bonusForce += 1
                            }
                        }, label: {
                            VStack(spacing: 6) {
                                Text("\(Image(systemName: "hand.tap.fill")) +1")
                                Text("Coût **\(10 * gameData.bonusCost)** \(Image(systemName: "character.square"))")
                                    .font(.caption)
                            }
                        })
                        .padding()
                        .foregroundStyle(Color.white)
                        .background {
                            RoundedRectangle(cornerRadius: 90)
                                .fill(Color.orange)
                        }
                        Spacer()
                        HStack {
                            Image(systemName: "hand.tap.fill")
                            Text("\(gameData.bonusCost)")
                        }
                        .font(.title)
                    }
                    .padding()
                }
                .background(.regularMaterial)
            }
    }
    func gameBottom() -> some View {
        VStack {
            ZStack {
                HStack {
                    Spacer()
                    VStack {
                        VStack {
                            switch gameData.clicks {
                                case 20..<50:
                                    Text("Cette biographie est générée par ChatGPT. Elle a été relue et corrigée pour ne contenir que des informations exactes, mais reste rédigée dans un style hagiographique.")
                                case 50..<100:
                                    Text("C'est long... continue un peu, et je pourrai peut-être t'aider.")
                                case 100..<130:
                                    Text("Voilà un peu d'aide pour accomplir ta mission !")
                                case 300..<400:
                                    Text("Tu crois au moins qu'il y a un truc spécial à la fin ?")
                                case UInt(gameData.bio.count)...:
                                    Text("Bravo ! C'est fini.")
                                default:
                                    Text("")
                            }
                        }
                        .font(.caption)
                        .foregroundStyle(Color.primary.opacity(0.6))
                        .padding()
                        
                        Button(action: {
                            if gameData.characters <= gameData.bio.count {
                                gameData.characters += gameData.bonusForce
                                gameData.clicks += 1
                            }
                        }, label: {
                            Text("En lire plus")
                                .frame(maxWidth: 256)
                                .padding()
                                .foregroundStyle(Color.white)
                                .background {
                                    RoundedRectangle(cornerRadius: 90)
                                        .fill(Color.accentColor)
                                }
                        })
                    }
                    Spacer()
                }
            }
            .background(.regularMaterial)
        }
    }
    func gameView() -> some View {
        
        Section(header: Text("Wanna play?")) {
            NavigationLink {
                
                if gameData.clicks >= 100 {
                    gameBar()
                }
                ScrollView {
                    HStack {
                        Text(gameData.bio.prefix(Int(gameData.characters)))
                            .multilineTextAlignment(.leading)
                            .allowsTightening(false)
                            .padding()
                        Spacer()
                    }
                }
                .defaultScrollAnchor(.bottom)
                Spacer()
                gameBottom()
                
            } label: {
                HStack {
                    Image(systemName: "cursorarrow.click.2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                    Text("BioClicker")
                }
            }
        }
}
    
    func otherActivities() -> some View {
        Section(header: Text("Autres activités")) {
            HStack {
                Image(systemName: "text.book.closed.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                Text("Publie des recueils de poésie, nouvelles...")
            }
            HStack {
                Image(systemName: "microphone.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                Text("Présente et produit des podcasts")
            }
            HStack {
                Image(systemName: "music.quarternote.3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                Text("Compose des musiques sur Game Boy")
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                header()
                gameView()
                blockQuote()
                otherActivities()
            }
        }
        .listStyle(.grouped)
        .navigationTitle("Anne Ferret")
    }
}


#Preview {
    ContentView()
}
