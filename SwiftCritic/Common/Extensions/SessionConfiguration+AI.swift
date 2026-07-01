//
//  SessionConfiguration+Prompt.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/30/26.
//

extension SessionConfiguration {
    var prompt: String {
        """
        Generate a Swift code snippet for \(category.promptHint).
        - Length: \(difficulty.snippetLength.promptHint)
        - Introduce at least 1 but no more than 4 intentional defects into the code
        - Defect visibility: \(difficulty.visibilityHint)
        - All defects must be runtime or logic errors — the code must compile in Swift 6
        - Use realistic type names — never names that reference or hint at the category
        - Zero comment characters in the output — not a single // or /* anywhere in the code
        - Do NOT reveal or hint at the defects anywhere in the code

        After writing the code, list ONLY the defects you actually introduced.
        Every defect you list must be literally visible as a code pattern in the snippet above.
        """
    }
}
