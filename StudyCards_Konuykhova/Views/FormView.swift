//
//  FormView.swift
//  StudyCards_Konuykhova
//
//  Created by Alex on 16.11.2021.
//

import SwiftUI

struct FormView: View {
    @State private var question: String = ""
    @State private var answer: String = ""
    
    var didAddCard: (_ studyCard: StudyCard)->Void
    
    var body: some View{
        NavigationView{
            VStack{
                Form{
                    TextField("Question", text: $question)
                    TextField("Answer", text: $answer)
                }
                
                    Button("Created card"){
                        let card = StudyCard(question: question, answer: answer)
                        didAddCard(card)
                    }.disabled(question.isEmpty || answer.isEmpty)
                    .padding()
                }
                .navigationTitle("New Study Card")
            }
        }
    }

