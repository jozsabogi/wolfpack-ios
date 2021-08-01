//
//  Question.swift
//  Personality Quiz
//
//  Created by Wolfpack Digital on 30/07/2021.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}
