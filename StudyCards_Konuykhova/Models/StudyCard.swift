//
//  StudyCard.swift
//  StudyCards_Konuykhova
//
//  Created by Alex on 15.11.2021.
//

import FirebaseFirestoreSwift

struct StudyCard: Identifiable, Codable {
    
    @DocumentID var id: String?
    var question: String
    var answer: String
    var passed: Bool = false
    
}
