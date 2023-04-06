//
//  CardViewModel.swift
//  StudyCards_Konuykhova
//
//  Created by Alex on 16.11.2021.
//


import Combine


final class CardViewModel: ObservableObject, Identifiable {
    private let cardRepository = CardRepository()
    @Published var studyCard: StudyCard
    
    var id = ""
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(studyCard: StudyCard) {
        self.studyCard = studyCard
            $studyCard
                .compactMap { $0.id }
                .assign(to: \.id, on: self)
                .store(in: &cancellables)
    }
    
    func add(_ studyCard: StudyCard) {
        cardRepository.add(studyCard)
    }
}
