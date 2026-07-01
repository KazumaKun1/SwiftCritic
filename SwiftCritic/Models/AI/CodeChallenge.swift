//
//  CodeSession.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/30/26.
//

import FoundationModels

@Generable
struct CodeChallenge {
    @Guide(description: "Complete Swift code snippet with intentional defects. Raw Swift code only — no markdown fences, no ``` wrappers, and zero comment characters. The string must not contain a single // or /* anywhere. Always write complete, syntactically valid Swift. Never truncate mid-statement.")
    var code: String
    
    @Guide(description: "List of EXACTLY the intentional defects you introduced into the code you just wrote. Every issue must correspond to something visible in that code. No invented issues.")
    var issues: [CodeIssue]
}

#if DEBUG
extension CodeChallenge {
    static var factoryPatternMock: CodeChallenge {
        CodeChallenge(
            code: """
            protocol PaymentProcessor {
                func process(amount: Double)
            }

            struct CreditCardProcessor: PaymentProcessor {
                func process(amount: Double) { }
            }

            struct PayPalProcessor: PaymentProcessor {
                func process(amount: Double) { }
            }

            struct StripeProcessor: PaymentProcessor {
                func process(amount: Double) { }
            }

            struct PaymentProcessorFactory {
                static func createProcessor(for method: String) -> PaymentProcessor {
                    switch method.lowercased() {
                    case "creditcard":
                        return CreditCardProcessor()
                    case "paypal":
                        return PayPalProcessor()
                    case "stripe":
                        return PayPalProcessor()
                    default:
                        return CreditCardProcessor()
                    }
                }
            }
            """,
            issues: [
                CodeIssue(
                    description: "The stripe case returns PayPalProcessor instead of StripeProcessor.",
                    lineHint: "line 25",
                    severity: "Major",
                    visibilityLevel: "Subtle"
                ),
                CodeIssue(
                    description: "The default case silently falls back to CreditCardProcessor instead of throwing an error or returning nil for an unsupported method.",
                    lineHint: "line 27",
                    severity: "Major",
                    visibilityLevel: "Subtle"
                )
            ]
        )
    }
}
#endif
