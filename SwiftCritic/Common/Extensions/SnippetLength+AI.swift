//
//  SnippetLength+AI.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/30/26.
//

extension SnippetLength {
    var promptHint: String {
        switch self {
        case .short:  "A single function or method — keep it under 20 lines"
        case .medium: "A class or struct with 1–2 methods — keep it under 30 lines"
        case .long:   "A class or struct with multiple methods or a complex function body — keep it under 40 lines"
        }
    }
}
