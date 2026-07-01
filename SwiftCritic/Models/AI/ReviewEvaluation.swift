//
//  ReviewEvaluation.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 7/1/26.
//

import FoundationModels

@Generable
struct CaughtIssue {
    @Guide(description: "The known defect description that the user correctly identified.")
    var defectDescription: String

    @Guide(description: "The exact user comment that identified this defect.")
    var userComment: String

    @Guide(description: "Severity note — empty string if the user's severity matched the known severity. If mismatched, briefly explain what the correct severity was and why.")
    var severityNote: String
}

@Generable
struct MissedIssue {
    @Guide(description: "The known defect the user failed to identify.")
    var defectDescription: String

    @Guide(description: "Brief explanation of what the user missed and why it matters.")
    var explanation: String
}

@Generable
struct FalsePositive {
    @Guide(description: "The exact user comment that incorrectly flagged something as a defect.")
    var userComment: String

    @Guide(description: "Brief explanation of why this is not actually a defect.")
    var explanation: String
}

@Generable
struct ReviewEvaluation {
    @Guide(description: "Defects from the known list that the user correctly identified. Only include a defect here if the user's comment clearly describes the actual problem.")
    var caught: [CaughtIssue]

    @Guide(description: "Defects from the known list that the user did not identify or described too vaguely to count.")
    var missed: [MissedIssue]

    @Guide(description: "User comments that flagged something not in the known defect list. Only include if the flagged item is genuinely not a problem.")
    var falsePositives: [FalsePositive]

    @Guide(description: "Score from 0 to 100. Calculate as: (caught / total defects) * 100, then subtract 5 per false positive. Round to nearest integer.")
    var score: Int

    @Guide(description: "One short paragraph of constructive feedback on the review quality — what the user did well, what they missed, and what to watch for next time.")
    var feedback: String
}
