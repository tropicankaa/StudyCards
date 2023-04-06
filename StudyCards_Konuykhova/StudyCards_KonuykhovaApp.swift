//
//  StudyCards_KonuykhovaApp.swift
//  StudyCards_Konuykhova
//
//  Created by Alex on 15.11.2021.
//

import SwiftUI
import Firebase

@main
struct StudyCards_KonuykhovaApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            CardListView(cardListViewModel: CardListViewModel())
        }
    }
}
