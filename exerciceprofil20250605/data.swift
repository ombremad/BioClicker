//
//  data.swift
//  exerciceprofil20250605
//
//  Created by Anne Ferret on 05/06/2025.
//

import SwiftUI

let gridIcons = ["bicycle", "books.vertical", "gamecontroller", "macbook.and.applewatch", "magazine", "music.microphone", "music.note", "earbuds.case", "apple.terminal.on.rectangle", "xbox.logo"].shuffled()

let petiteHistoire = """
Biographie
---
Anne Ferret est une figure aux multiples facettes, oscillant entre journalisme technologique, développement iOS, écriture littéraire et engagement militant. Née en 1987 dans la banlieue parisienne, elle a su tisser un parcours riche et varié, mêlant rigueur technique et sensibilité artistique.

Des débuts dans le journalisme technologique
---
Anne Ferret a entamé sa carrière en tant que rédactrice principale chez Freenews, un site d'actualités dédié aux technologies et aux télécommunications. De 2009 à 2020, elle a couvert de nombreux événements majeurs, notamment les conférences d'Apple, offrant des analyses pointues et critiques sur les innovations de la firme de Cupertino. Son expertise et sa plume acérée ont fait d'elle une référence dans le domaine du journalisme high-tech.

Transition vers le développement iOS
---
Parallèlement à sa carrière journalistique, Anne Ferret s'est formée au développement iOS, notamment via le langage Swift. Elle a suivi les formations Apple Foundation Program et Apple Foundation Program Extended en 2022, puis en 2025, s'est lancée dans une formation longue (l'Apple Foundation Program Advanced) sur 19 mois dont un an d'alternance, afin de décrocher le titre professionnel de conceptrice développeuse d'applications. Son implication dans le développement mobile témoigne de sa polyvalence et de sa capacité à évoluer dans des domaines techniques pointus.

Littérature
---
Anne Ferret a entamé son travail littéraire avec Tout le soufre de mon corps, un texte radical et sensoriel publié en 2023, qui mêle lyrisme incandescent et exploration intime du désir et de la corporalité. Œuvre dense et fragmentaire, elle y conjugue l’expérience vécue à une écriture stylisée, tantôt poétique, tantôt coupante comme un scalpel. En parallèle, elle alimente régulièrement deux espaces numériques qui prolongent son geste littéraire : sur ombremad.lesbienn.es, elle publie des textes courts, souvent introspectifs ou politiques, entre autofiction et manifeste queer, tandis que son site personnel anneferret.eu fait office de carnet de bord expérimental, mêlant brouillons, réflexions sur l’écriture et formes hybrides qui échappent aux classifications habituelles. Ces publications en ligne témoignent de sa volonté de désacraliser le texte imprimé en cultivant une littérature vivante, mouvante, et toujours traversée par les tensions du monde contemporain.

Engagement et activisme
---
Au-delà de ses activités professionnelles, Anne Ferret est également une militante engagée pour les droits des personnes LGBT. Son parcours personnel et professionnel reflète une volonté constante de briser les barrières et de promouvoir l'inclusion et la diversité. Elle utilise sa voix et sa visibilité pour sensibiliser le public aux enjeux liés à l'identité de genre et à la représentation des minorités dans les médias et la technologie.

Une personnalité aux multiples talents
---
Anne Ferret incarne la convergence entre technologie, littérature et engagement social. Son parcours illustre la richesse d'une carrière construite à l'intersection de disciplines variées, où chaque expérience nourrit l'autre. Qu'il s'agisse de décrypter les dernières innovations technologiques, de développer des applications mobiles ou de raconter des histoires poignantes, Anne Ferret continue de se réinventer, guidée par une curiosité insatiable et un profond désir de contribuer à un monde plus inclusif et éclairé.
"""

let columns = Array(repeating: GridItem(.flexible(minimum: 140)), count: 3)

