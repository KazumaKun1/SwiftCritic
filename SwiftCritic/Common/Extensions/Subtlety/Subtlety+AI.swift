//
//  Subtlety+AI.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 7/1/26.
//

nonisolated extension Subtlety {
    var promptHint: String {
        switch self {
        case .obvious: "Surface — issues should be immediately noticeable to a developer scanning the code"
        case .subtle: "Subtle — issues require careful, line-by-line reading to spot; not obvious on first scan"
        case .wellHidden: "Well-hidden — issues blend into otherwise reasonable-looking code; require domain knowledge to catch"
        case .hidden: "Hidden — issues require reasoning through logic or data flow to uncover; a quick read will miss them entirely"
        }
    }
}
