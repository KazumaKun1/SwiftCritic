//
//  CodeFeedback+AI.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 7/1/26.
//

extension CodeFeedback {
    func evaluationPrompt(for challenge: CodeChallenge) -> String {
        let defectList = challenge.issues
            .enumerated()
            .map { "\($0.offset + 1). \($0.element.description) (line \($0.element.lineHint), severity: \($0.element.severity))" }
            .joined(separator: "\n")

        let commentList = inlineComments
            .map { "- Line \($0.line): \($0.comment) [severity: \($0.severity.rawValue)]" }
            .joined(separator: "\n")

        return """
                Here is the Swift code that was reviewed:
                \(challenge.code)

                Known defects in this code:
                \(defectList)

                The developer submitted this review:

                Inline comments:
                \(commentList)

                Overall comment: \(overallComment ?? "none")

                Evaluate the review against the known defects above.
            """
    }
}
