//
//  Subtlety+UI.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/30/26.
//

nonisolated extension Subtlety {
    var name: String {
        switch self {
        case .obvious: "Obvious"
        case .subtle: "Subtle"
        case .wellHidden: "Well Hidden"
        case .hidden: "Hidden"
        }
    }
}
