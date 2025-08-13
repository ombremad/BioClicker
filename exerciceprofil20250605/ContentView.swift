//
//  ContentView.swift
//  exerciceprofil20250605
//
//  Created by Anne Ferret on 05/06/2025.
//

import SwiftUI

struct ContentView: View {
            
    @State private var pictureRotation : Double = 0
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
                            .rotation3DEffect(.degrees(pictureRotation), axis: (x: 0, y: 1, z: 1))
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 1.2)) {
                                    pictureRotation += 1080
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
    func favQuote() -> some View {
        Section(header: Text("Favourite quote")) {
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
                                Text("Cost **\(10 * gameData.bonusCost)** \(Image(systemName: "character.square"))")
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
                                case 10..<70:
                                    Text("This bio was written by ChatGPT. It's been proofread, corrected, and now only contains genuine information. Although it's still in written in a style of almost comically inflated hagiography.")
                                case 70..<100:
                                    Text("Is it still long? Just go on for a bit, and I'll see how I can help.")
                                case 300..<400:
                                    Text("Do you think there's at least something special waiting at the end?")
                                case UInt(gameData.bio.count)...:
                                    Text("Congratulations! You're done.")
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
                            Text("Read more")
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
                    Text("BioClicker")
                        .font(.largeTitle)
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
                    Text("Try BioClicker")
                }
            }
        }
}
    func otherActivities() -> some View {
        Section(header: Text("Other activities")) {
            HStack {
                Image(systemName: "text.book.closed.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                Text("Published poetry and novels")
            }
            HStack {
                Image(systemName: "microphone.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                Text("Hosts and produces podcasts")
            }
            HStack {
                Image(systemName: "music.quarternote.3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                Text("Composes music on a Game Boy")
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                header()
                gameView()
                favQuote()
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
