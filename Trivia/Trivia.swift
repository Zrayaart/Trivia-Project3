//
//  Trivia.swift
//  Trivia
//
//  Created by Soraya Sardine on 3/12/24.
//

import Foundation

struct Trivia {
    let theme: String
    let question: String
    let answers: [String]
    let correctAnswers: Int
    let questionNumber: Int
    
    init(theme: String, question: String, answers: [String], correctAnswers: Int, questionNumber: Int){
        self.theme = theme
        self.question = question
        self.answers = answers
        self.correctAnswers = correctAnswers
        self.questionNumber = questionNumber
    }
}
