//
//  CardRepository.swift
//  StudyCards_Konuykhova
//
//  Created by Alex on 15.11.2021.
//


import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine


final class CardRepository: ObservableObject{
    
    private let path = "studyCards"
    
    //константа, имеющая доступ к Firebase
    private let store = Firestore.firestore()
    
    //переменная, содержащая все карточки
    @Published var studyCards: [StudyCard] = []
    
    init() {
         get()
        
    }
    
    func get() {
        store.collection(path)
            .addSnapshotListener{(snapshot, error) in
                if let error = error {
                    print(error)
                    return
                }
                self.studyCards = snapshot?.documents.compactMap{
                    try? $0.data(as:StudyCard.self)
                } ?? []
            }
    
    }
    
    
    func add(_ studyCard: StudyCard){
        do{
            _ = try store.collection(path).addDocument(from: studyCard)
        } catch {
            fatalError("Adding a study card failed")
        }
    }
    
    func remove(_ studyCard: StudyCard){
        guard let documentID = studyCard.id else {return}
        store.collection(path).document(documentID).delete{
            error in
            if let error = error {
                print("Unable to remove the card: \(error.localizedDescription)")
            }
        }
    }
    
    func update(_ studyCard: StudyCard){
        guard let documentID = studyCard.id else {return}
        do{
            try store.collection(path).document(documentID).setData(from: studyCard)
        } catch {
            fatalError("Update a study card failed")
        }
    }
}
