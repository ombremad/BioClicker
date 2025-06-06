//
//  ContentView.swift
//  exerciceprofil20250605
//
//  Created by Anne Ferret on 05/06/2025.
//

import SwiftUI

struct ContentView: View {
            
    @State private var rotationProfile : Double = 0
    @State private var truncatedStory : Int = 13
    
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
    
    func bioGame() -> some View {
        Section(header: Text("Biographie")) {
            NavigationLink {
                ScrollView {
                    Text(petiteHistoire.prefix(truncatedStory))
                        .multilineTextAlignment(.leading)
                        .padding()
                }
                .defaultScrollAnchor(.bottom)
                Spacer()
                ZStack {
                    VStack {
                        VStack(alignment:.leading) {
                            if truncatedStory >= 300 {
                                Text("Cette biographie est générée par ChatGPT. Elle contient des informations inexactes.")
                            }
                            if truncatedStory >= 500 {
                                Text("\nCependant, certaines informations sont tout de même correctes.")
                            }
                            if truncatedStory >= 800 {
                                Text("La plupart, d'ailleurs.")
                            }
                            if truncatedStory >= 1200 {
                                Text("À vous de distinguer le vrai du faux.")
                            }
                            if truncatedStory >= 2000 {
                                Text("\n...c'est long, non ?")
                            }
                        }
                        .font(.caption)
                        .foregroundStyle(Color.primary.opacity(0.6))
                        .padding()

                        Button(action: {
                            if truncatedStory <= petiteHistoire.count {
                                truncatedStory += Int.random(in:1...8)
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
                }
            } label: {
                HStack {
                    Image(systemName: "person.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                    Text("En savoir plus")
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
                blockQuote()
                bioGame()
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
