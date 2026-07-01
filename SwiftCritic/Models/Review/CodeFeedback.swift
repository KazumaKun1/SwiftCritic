//
//  CodeFeedback.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 7/1/26.
//

struct CodeFeedback {
    var inlineComments: [InlineComment]
    var overallComment: String?

    var isEmpty: Bool {
        inlineComments.isEmpty
    }
}

#if DEBUG
extension CodeFeedback {
    /// Simulates a user who caught defect 1, missed defect 2, and added one false positive.
    static var partialReviewMock: CodeFeedback {
        CodeFeedback(
            inlineComments: [
                InlineComment(
                    line: 25,
                    comment: "This is returning PayPalProcessor for the stripe case — should be StripeProcessor.",
                    severity: .major
                ),
                InlineComment(
                    line: 6,
                    comment: "The process method body is empty, this should probably do something.",
                    severity: .minor
                )
            ],
            overallComment: "Found one wrong return type in the switch. The empty method bodies also look suspicious."
        )
    }

    /// Simulates a user who caught both defects with correct severity.
    static var perfectReviewMock: CodeFeedback {
        CodeFeedback(
            inlineComments: [
                InlineComment(
                    line: 25,
                    comment: "stripe case incorrectly returns PayPalProcessor instead of StripeProcessor.",
                    severity: .major
                ),
                InlineComment(
                    line: 27,
                    comment: "The default case should throw an error or return nil — silently falling back to CreditCardProcessor hides unsupported input.",
                    severity: .major
                )
            ],
            overallComment: nil
        )
    }
}
#endif
